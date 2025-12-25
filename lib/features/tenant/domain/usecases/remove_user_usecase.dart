import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveUserUseCase {
  final TenantRepository repository;

  RemoveUserUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String tenantId,
    required String userId,
  }) {
    return repository.removeUser(tenantId, userId);
  }
}
