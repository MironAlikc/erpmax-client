import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/tenant_repository.dart';

@injectable
class InviteUserUseCase {
  final TenantRepository repository;

  InviteUserUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String tenantId,
    required String email,
    required String role,
  }) {
    return repository.inviteUser(
      tenantId,
      email: email,
      role: role,
    );
  }
}
