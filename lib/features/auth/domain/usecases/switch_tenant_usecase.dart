import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/switch_tenant_result.dart';
import '../repositories/auth_repository.dart';

@injectable
class SwitchTenantUseCase {
  final AuthRepository repository;

  SwitchTenantUseCase(this.repository);

  Future<Either<Failure, SwitchTenantResult>> call(String tenantId) {
    return repository.switchTenant(tenantId);
  }
}
