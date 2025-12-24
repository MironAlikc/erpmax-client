import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/auth_tokens.dart';
import '../entities/auth_result.dart';
import '../entities/user_with_tenants.dart';
import '../entities/switch_tenant_result.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthResult>> register({
    required String email,
    required String password,
    required String fullName,
    required String companyName,
  });

  Future<Either<Failure, AuthResult>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, AuthTokens>> refreshToken(String refreshToken);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, UserWithTenants>> getCurrentUser();

  Future<Either<Failure, SwitchTenantResult>> switchTenant(String tenantId);

  Future<Either<Failure, AuthTokens>> getStoredTokens();

  Future<Either<Failure, void>> saveTokens(AuthTokens tokens);

  Future<Either<Failure, void>> clearTokens();
}
