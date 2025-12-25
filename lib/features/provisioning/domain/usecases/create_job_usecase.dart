import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/provisioning_job_entity.dart';
import '../repositories/provisioning_repository.dart';

@injectable
class CreateJobUseCase {
  final ProvisioningRepository repository;

  CreateJobUseCase(this.repository);

  Future<Either<Failure, ProvisioningJobEntity>> call({
    required String jobType,
  }) {
    return repository.createJob(jobType: jobType);
  }
}
