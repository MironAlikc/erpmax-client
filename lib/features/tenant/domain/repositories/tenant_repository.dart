import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/domain/entities/tenant_entity.dart';
import 'package:erpmax_client/features/tenant/domain/entities/tenant_user_entity.dart';

abstract class TenantRepository {
  Future<Either<Failure, List<TenantEntity>>> getTenants({
    int page = 1,
    int size = 20,
  });

  Future<Either<Failure, TenantEntity>> getCurrentTenant();

  Future<Either<Failure, TenantEntity>> getTenantById(String id);

  Future<Either<Failure, TenantEntity>> updateTenant(
    String id, {
    String? name,
    Map<String, dynamic>? settings,
  });

  Future<Either<Failure, List<TenantUserEntity>>> getTenantUsers(
    String tenantId, {
    int page = 1,
    int size = 20,
  });

  Future<Either<Failure, void>> inviteUser(
    String tenantId, {
    required String email,
    required String role,
  });

  Future<Either<Failure, void>> updateUserRole(
    String tenantId,
    String userId, {
    required String role,
  });

  Future<Either<Failure, void>> removeUser(String tenantId, String userId);
}
