import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InviteUserUseCase {
  final TenantRepository repository;

  InviteUserUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String tenantId,
    required String email,
    required String role,
  }) {
    return repository.inviteUser(tenantId, email: email, role: role);
  }
}
