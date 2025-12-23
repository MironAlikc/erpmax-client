import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/tenant_entity.dart';
import '../repositories/tenant_repository.dart';

@injectable
class GetCurrentTenantUseCase {
  final TenantRepository repository;

  GetCurrentTenantUseCase(this.repository);

  Future<Either<Failure, TenantEntity>> call() {
    return repository.getCurrentTenant();
  }
}
