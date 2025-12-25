import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/provisioning/domain/entities/provisioning_job_entity.dart';
import 'package:erpmax_client/features/provisioning/domain/repositories/provisioning_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RetryJobUseCase {
  final ProvisioningRepository repository;

  RetryJobUseCase(this.repository);

  Future<Either<Failure, ProvisioningJobEntity>> call(String id) {
    return repository.retryJob(id);
  }
}
