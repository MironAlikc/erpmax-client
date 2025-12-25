import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/domain/entities/tenant_entity.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentTenantUseCase {
  final TenantRepository repository;

  GetCurrentTenantUseCase(this.repository);

  Future<Either<Failure, TenantEntity>> call() {
    return repository.getCurrentTenant();
  }
}
