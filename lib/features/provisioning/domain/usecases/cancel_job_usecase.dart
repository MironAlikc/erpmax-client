import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/provisioning/domain/repositories/provisioning_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CancelJobUseCase {
  final ProvisioningRepository repository;

  CancelJobUseCase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.cancelJob(id);
  }
}
