import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/provisioning_job_entity.dart';
import '../repositories/provisioning_repository.dart';

@injectable
class GetJobsUseCase {
  final ProvisioningRepository repository;

  GetJobsUseCase(this.repository);

  Future<Either<Failure, List<ProvisioningJobEntity>>> call({
    int page = 1,
    int size = 20,
  }) {
    return repository.getJobs(page: page, size: size);
  }
}
