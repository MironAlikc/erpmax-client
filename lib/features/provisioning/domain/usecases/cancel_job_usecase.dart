import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/provisioning_repository.dart';

@injectable
class CancelJobUseCase {
  final ProvisioningRepository repository;

  CancelJobUseCase(this.repository);

  Future<Either<Failure, void>> call(String id) {
    return repository.cancelJob(id);
  }
}
