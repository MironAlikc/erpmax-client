import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserRoleUseCase {
  final TenantRepository repository;

  UpdateUserRoleUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String tenantId,
    required String userId,
    required String role,
  }) {
    return repository.updateUserRole(tenantId, userId, role: role);
  }
}
