import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/auth/domain/entities/tenant_entity.dart';
import 'package:erpmax_client/features/tenant/domain/repositories/tenant_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTenantUseCase {
  final TenantRepository repository;

  UpdateTenantUseCase(this.repository);

  Future<Either<Failure, TenantEntity>> call({
    required String id,
    String? name,
    Map<String, dynamic>? settings,
  }) {
    return repository.updateTenant(id, name: name, settings: settings);
  }
}
