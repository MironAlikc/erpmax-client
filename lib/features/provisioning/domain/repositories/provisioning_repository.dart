import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/provisioning/domain/entities/provisioning_job_entity.dart';

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
