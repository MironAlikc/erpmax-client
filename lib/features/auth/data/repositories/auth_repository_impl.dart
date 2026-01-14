import 'dart:developer' as dev;

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:erpmax_client/core/auth/secure_storage.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:erpmax_client/features/auth/domain/entities/auth_result.dart';
import 'package:erpmax_client/features/auth/domain/entities/auth_tokens.dart';
import 'package:erpmax_client/features/auth/domain/entities/switch_tenant_result.dart';
import 'package:erpmax_client/features/auth/domain/entities/user_with_tenants.dart';
import 'package:erpmax_client/features/auth/domain/repositories/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final SecureStorage secureStorage;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.secureStorage,
  });

  @override
  Future<Either<Failure, AuthResult>> register({
    required String email,
    required String password,
    required String fullName,
    required String companyName,
  }) async {
    try {
      final response = await remoteDataSource.register({
        'email': email,
        'password': password,
        'full_name': fullName,
        'company_name': companyName,
      });

      final baseResponse = response.data;
      if (baseResponse.data == null) {
        return Left(
          ServerFailure(
            message: baseResponse.error?.message ?? 'Registration failed',
          ),
        );
      }
      final authResponse = baseResponse.data!;

      if (authResponse.accessToken == null ||
          authResponse.refreshToken == null) {
        return Left(ServerFailure(message: 'Missing authentication tokens'));
      }

      if (authResponse.user == null) {
        return Left(ServerFailure(message: 'Missing user data'));
      }

      final tokens = AuthTokens(
        accessToken: authResponse.accessToken!,
        refreshToken: authResponse.refreshToken!,
      );

      await secureStorage.saveAccessToken(authResponse.accessToken!);
      await secureStorage.saveRefreshToken(authResponse.refreshToken!);

      return Right(
        AuthResult(
          tokens: tokens,
          user: authResponse.user!.toEntity(),
          tenants:
              authResponse.tenants?.map((t) => t.toEntity()).toList() ?? [],
          currentTenant: authResponse.currentTenant?.toEntity(),
        ),
      );
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthResult>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await remoteDataSource.login({
        'email': email,
        'password': password,
      });

      dev.log('Login response status: ${response.response.statusCode}');
      dev.log('Login response data: ${response.response.data}');

      final baseResponse = response.data;
      if (baseResponse.data == null) {
        return Left(
          ServerFailure(message: baseResponse.error?.message ?? 'Login failed'),
        );
      }
      final authResponse = baseResponse.data!;
      dev.log(
        'Parsed AuthResponseModel: accessToken=${authResponse.accessToken}, user=${authResponse.user?.email}',
      );

      if (authResponse.accessToken == null ||
          authResponse.refreshToken == null) {
        return Left(ServerFailure(message: 'Missing authentication tokens'));
      }

      if (authResponse.user == null) {
        return Left(ServerFailure(message: 'Missing user data'));
      }

      final tokens = AuthTokens(
        accessToken: authResponse.accessToken!,
        refreshToken: authResponse.refreshToken!,
      );

      await secureStorage.saveAccessToken(authResponse.accessToken!);
      await secureStorage.saveRefreshToken(authResponse.refreshToken!);

      return Right(
        AuthResult(
          tokens: tokens,
          user: authResponse.user!.toEntity(),
          tenants:
              authResponse.tenants?.map((t) => t.toEntity()).toList() ?? [],
          currentTenant: authResponse.currentTenant?.toEntity(),
        ),
      );
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokens>> refreshToken(String refreshToken) async {
    try {
      final response = await remoteDataSource.refreshToken({
        'refresh_token': refreshToken,
      });

      final authResponse = response.data.data!;

      if (authResponse.accessToken == null ||
          authResponse.refreshToken == null) {
        return Left(ServerFailure(message: 'Missing authentication tokens'));
      }

      final tokens = AuthTokens(
        accessToken: authResponse.accessToken!,
        refreshToken: authResponse.refreshToken!,
      );

      await secureStorage.saveAccessToken(tokens.accessToken);
      await secureStorage.saveRefreshToken(tokens.refreshToken);

      return Right(tokens);
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await remoteDataSource.logout();
      await secureStorage.deleteAccessToken();
      await secureStorage.deleteRefreshToken();
      return const Right(null);
    } on DioException catch (e) {
      await secureStorage.deleteAccessToken();
      await secureStorage.deleteRefreshToken();
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserWithTenants>> getCurrentUser() async {
    try {
      final response = await remoteDataSource.getCurrentUser();
      final model = response.data.data!;

      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SwitchTenantResult>> switchTenant(
    String tenantId,
  ) async {
    try {
      final response = await remoteDataSource.switchTenant({
        'tenant_id': tenantId,
      });

      final model = response.data.data!;

      await secureStorage.saveAccessToken(model.accessToken);
      await secureStorage.saveRefreshToken(model.refreshToken);

      return Right(model.toEntity());
    } on DioException catch (e) {
      return Left(_handleDioException(e));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthTokens>> getStoredTokens() async {
    try {
      final accessToken = await secureStorage.getAccessToken();
      final refreshToken = await secureStorage.getRefreshToken();

      if (accessToken == null || refreshToken == null) {
        return const Left(CacheFailure(message: 'No tokens found'));
      }

      return Right(
        AuthTokens(accessToken: accessToken, refreshToken: refreshToken),
      );
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveTokens(AuthTokens tokens) async {
    try {
      await secureStorage.saveAccessToken(tokens.accessToken);
      await secureStorage.saveRefreshToken(tokens.refreshToken);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> clearTokens() async {
    try {
      await secureStorage.deleteAccessToken();
      await secureStorage.deleteRefreshToken();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  Failure _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return const NetworkFailure(message: 'Connection timeout');
    }

    if (e.type == DioExceptionType.connectionError) {
      return const NetworkFailure(message: 'No internet connection');
    }

    final statusCode = e.response?.statusCode;
    final message =
        e.response?.data?['detail'] ??
        e.response?.data?['message'] ??
        e.message ??
        'Unknown error';

    switch (statusCode) {
      case 401:
        return AuthenticationFailure(message: message);
      case 403:
        return AuthorizationFailure(message: message);
      case 404:
        return NotFoundFailure(message: message);
      case 422:
        return ValidationFailure(message: message);
      default:
        return ServerFailure(message: message, statusCode: statusCode);
    }
  }
}
