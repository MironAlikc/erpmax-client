import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/tenant_repository.dart';

@injectable
class UpdateUserRoleUseCase {
  final TenantRepository repository;

  UpdateUserRoleUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String tenantId,
    required String userId,
    required String role,
  }) {
    return repository.updateUserRole(
      tenantId,
      userId,
      role: role,
    );
  }
}
