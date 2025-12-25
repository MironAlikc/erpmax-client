import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/domain/entities/tenant_entity.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTenantsUseCase {
  final TenantRepository repository;

  GetTenantsUseCase(this.repository);

  Future<Either<Failure, List<TenantEntity>>> call({
    int page = 1,
    int size = 20,
  }) {
    return repository.getTenants(page: page, size: size);
  }
}
