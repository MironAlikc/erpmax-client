// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning_job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProvisioningJobModel _$ProvisioningJobModelFromJson(
  Map<String, dynamic> json,
) => _ProvisioningJobModel(
  id: json['id'] as String?,
  tenantId: json['tenant_id'] as String?,
  jobType: json['job_type'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  startedAt: json['started_at'] == null
      ? null
      : DateTime.parse(json['started_at'] as String),
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
  errorMessage: json['error_message'] as String?,
  metadata: json['metadata'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$ProvisioningJobModelToJson(
  _ProvisioningJobModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'tenant_id': instance.tenantId,
  'job_type': instance.jobType,
  'status': instance.status,
  'created_at': instance.createdAt?.toIso8601String(),
  'started_at': instance.startedAt?.toIso8601String(),
  'completed_at': instance.completedAt?.toIso8601String(),
  'error_message': instance.errorMessage,
  'metadata': instance.metadata,
};
