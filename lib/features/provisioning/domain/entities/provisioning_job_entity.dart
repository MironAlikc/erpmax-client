import 'package:freezed_annotation/freezed_annotation.dart';

part 'provisioning_job_entity.freezed.dart';

@freezed
abstract class ProvisioningJobEntity with _$ProvisioningJobEntity {
  const factory ProvisioningJobEntity({
    required String id,
    required String tenantId,
    required String jobType,
    required String status,
    required DateTime createdAt,
    DateTime? startedAt,
    DateTime? completedAt,
    String? errorMessage,
    Map<String, dynamic>? metadata,
  }) = _ProvisioningJobEntity;
}
