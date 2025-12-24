import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/tenant_repository.dart';

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
