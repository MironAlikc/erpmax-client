import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/provisioning_job_entity.dart';

part 'provisioning_job_model.freezed.dart';
part 'provisioning_job_model.g.dart';

@freezed
abstract class ProvisioningJobModel with _$ProvisioningJobModel {
  const ProvisioningJobModel._();

  const factory ProvisioningJobModel({
    String? id,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'job_type') String? jobType,
    String? status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
    @JsonKey(name: 'error_message') String? errorMessage,
    Map<String, dynamic>? metadata,
  }) = _ProvisioningJobModel;

  factory ProvisioningJobModel.fromJson(Map<String, dynamic> json) =>
      _$ProvisioningJobModelFromJson(json);

  ProvisioningJobEntity toEntity() => ProvisioningJobEntity(
    id: id ?? '',
    tenantId: tenantId ?? '',
    jobType: jobType ?? '',
    status: status ?? '',
    createdAt: createdAt ?? DateTime.now(),
    startedAt: startedAt,
    completedAt: completedAt,
    errorMessage: errorMessage,
    metadata: metadata,
  );
}
