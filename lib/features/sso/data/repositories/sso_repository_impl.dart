import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/sso/data/datasources/sso_remote_datasource.dart';
import 'package:erpmax_client/features/sso/domain/entities/sso_token_entity.dart';
import 'package:erpmax_client/features/sso/domain/repositories/sso_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SSORepository)
class SSORepositoryImpl implements SSORepository {
  final SSORemoteDataSource remoteDataSource;

  SSORepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, SSOTokenEntity>> generateToken() async {
    try {
      final response = await remoteDataSource.generateToken();
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

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
