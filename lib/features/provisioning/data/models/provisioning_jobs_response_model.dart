import 'package:freezed_annotation/freezed_annotation.dart';
import 'provisioning_job_model.dart';

part 'provisioning_jobs_response_model.freezed.dart';
part 'provisioning_jobs_response_model.g.dart';

@freezed
abstract class ProvisioningJobsResponseModel
    with _$ProvisioningJobsResponseModel {
  const ProvisioningJobsResponseModel._();

  const factory ProvisioningJobsResponseModel({
    required List<ProvisioningJobModel> data,
  }) = _ProvisioningJobsResponseModel;

  factory ProvisioningJobsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningJobsResponseModelFromJson(json);
}
