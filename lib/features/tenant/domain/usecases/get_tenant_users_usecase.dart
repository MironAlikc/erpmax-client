import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/tenant_user_entity.dart';
import '../repositories/tenant_repository.dart';

@injectable
class GetTenantUsersUseCase {
  final TenantRepository repository;

  GetTenantUsersUseCase(this.repository);

  Future<Either<Failure, List<TenantUserEntity>>> call({
    required String tenantId,
    int page = 1,
    int size = 20,
  }) {
    return repository.getTenantUsers(
      tenantId,
      page: page,
      size: size,
    );
  }
}
