import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/provisioning/domain/entities/provisioning_job_entity.dart';
import 'package:erpmax_client/features/provisioning/domain/repositories/provisioning_repository.dart';
import 'package:injectable/injectable.dart';

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
