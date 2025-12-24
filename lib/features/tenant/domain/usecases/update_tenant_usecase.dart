import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/tenant_entity.dart';
import '../repositories/tenant_repository.dart';

@injectable
class UpdateTenantUseCase {
  final TenantRepository repository;

  UpdateTenantUseCase(this.repository);

  Future<Either<Failure, TenantEntity>> call({
    required String id,
    String? name,
    Map<String, dynamic>? settings,
  }) {
    return repository.updateTenant(
      id,
      name: name,
      settings: settings,
    );
  }
}
