import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/tenant_entity.dart';
import '../repositories/tenant_repository.dart';

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
