import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/tenant/domain/entities/tenant_user_entity.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTenantUsersUseCase {
  final TenantRepository repository;

  GetTenantUsersUseCase(this.repository);

  Future<Either<Failure, List<TenantUserEntity>>> call({
    required String tenantId,
    int page = 1,
    int size = 20,
  }) {
    return repository.getTenantUsers(tenantId, page: page, size: size);
  }
}
