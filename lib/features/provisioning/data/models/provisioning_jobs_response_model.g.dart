// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provisioning_jobs_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProvisioningJobsResponseModel _$ProvisioningJobsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ProvisioningJobsResponseModel(
  data: (json['data'] as List<dynamic>)
      .map((e) => ProvisioningJobModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProvisioningJobsResponseModelToJson(
  _ProvisioningJobsResponseModel instance,
) => <String, dynamic>{'data': instance.data};
