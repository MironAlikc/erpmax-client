import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/tenant_entity.dart';
import '../../domain/entities/tenant_user_entity.dart';
import '../../domain/repositories/tenant_repository.dart';
import '../datasources/tenant_remote_datasource.dart';

@LazySingleton(as: TenantRepository)
class TenantRepositoryImpl implements TenantRepository {
  final TenantRemoteDataSource remoteDataSource;

  TenantRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<TenantEntity>>> getTenants({
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await remoteDataSource.getTenants(
        page: page,
        size: size,
      );

      final tenants = response.data.map((model) => model.toEntity()).toList();
      return Right(tenants);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TenantEntity>> getCurrentTenant() async {
    try {
      final response = await remoteDataSource.getCurrentTenant();
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TenantEntity>> getTenantById(String id) async {
    try {
      final response = await remoteDataSource.getTenantById(id);
      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TenantEntity>> updateTenant(
    String id, {
    String? name,
    Map<String, dynamic>? settings,
  }) async {
    try {
      final response = await remoteDataSource.updateTenant(
        id,
        {
          if (name != null) 'name': name,
          if (settings != null) 'settings': settings,
        },
      );

      return Right(response.data.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TenantUserEntity>>> getTenantUsers(
    String tenantId, {
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await remoteDataSource.getTenantUsers(
        tenantId,
        page: page,
        size: size,
      );

      final users = response.data.map((model) => model.toEntity()).toList();
      return Right(users);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> inviteUser(
    String tenantId, {
    required String email,
    required String role,
  }) async {
    try {
      await remoteDataSource.inviteUser(
        tenantId,
        {
          'email': email,
          'role': role,
        },
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateUserRole(
    String tenantId,
    String userId, {
    required String role,
  }) async {
    try {
      await remoteDataSource.updateUserRole(
        tenantId,
        userId,
        {'role': role},
      );

      return const Right(null);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> removeUser(
    String tenantId,
    String userId,
  ) async {
    try {
      await remoteDataSource.removeUser(tenantId, userId);
      return const Right(null);
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
