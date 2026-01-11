import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/provisioning_job_entity.dart';
import '../../domain/repositories/provisioning_repository.dart';
import '../datasources/provisioning_remote_datasource.dart';

@LazySingleton(as: ProvisioningRepository)
class ProvisioningRepositoryImpl implements ProvisioningRepository {
  final ProvisioningRemoteDataSource remoteDataSource;

  ProvisioningRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProvisioningJobEntity>>> getJobs({
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await remoteDataSource.getJobs(page: page, size: size);

      final jobs = response.data.data.map((model) => model.toEntity()).toList();
      return Right(jobs);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProvisioningJobEntity>> getJobById(String id) async {
    try {
      final response = await remoteDataSource.getJobById(id);
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProvisioningJobEntity>> createJob({
    required String jobType,
  }) async {
    try {
      final response = await remoteDataSource.createJob({'job_type': jobType});

      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProvisioningJobEntity>> retryJob(String id) async {
    try {
      final response = await remoteDataSource.retryJob(id);
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> cancelJob(String id) async {
    try {
      await remoteDataSource.cancelJob(id);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  // ! Add localizations
  Failure _handleDioException(DioException e) {
    if (e.response != null) {
      final statusCode = e.response!.statusCode;
      final message = e.response!.data?['message'] ?? e.message;

      switch (statusCode) {
        case 400:
          return ValidationFailure(message: message ?? 'Invalid request');
        case 401:
          return AuthenticationFailure(message: message ?? 'Unauthorized');
        case 403:
          return AuthorizationFailure(message: message ?? 'Forbidden');
        case 404:
          return NotFoundFailure(message: message ?? 'Resource not found');
        case 500:
          return ServerFailure(message: message ?? 'Server error');
        default:
          return ServerFailure(message: message ?? 'Unknown error');
      }
    }

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return NetworkFailure(message: 'Connection timeout');
    }

    if (e.type == DioExceptionType.connectionError) {
      return NetworkFailure(message: 'No internet connection');
    }

    return ServerFailure(message: e.message ?? 'Unknown error');
  }
}
