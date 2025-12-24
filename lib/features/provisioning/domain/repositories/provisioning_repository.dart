import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/provisioning_job_entity.dart';

abstract class ProvisioningRepository {
  Future<Either<Failure, List<ProvisioningJobEntity>>> getJobs({
    int page = 1,
    int size = 20,
  });

  Future<Either<Failure, ProvisioningJobEntity>> getJobById(String id);

  Future<Either<Failure, ProvisioningJobEntity>> createJob({
    required String jobType,
  });

  Future<Either<Failure, ProvisioningJobEntity>> retryJob(String id);

  Future<Either<Failure, void>> cancelJob(String id);
}
