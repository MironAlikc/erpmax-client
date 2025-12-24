import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/provisioning_job_entity.dart';
import '../repositories/provisioning_repository.dart';

@injectable
class RetryJobUseCase {
  final ProvisioningRepository repository;

  RetryJobUseCase(this.repository);

  Future<Either<Failure, ProvisioningJobEntity>> call(String id) {
    return repository.retryJob(id);
  }
}
