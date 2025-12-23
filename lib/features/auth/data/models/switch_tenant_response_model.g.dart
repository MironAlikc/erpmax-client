// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'switch_tenant_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SwitchTenantResponseModel _$SwitchTenantResponseModelFromJson(
  Map<String, dynamic> json,
) => _SwitchTenantResponseModel(
  accessToken: json['access_token'] as String,
  refreshToken: json['refresh_token'] as String,
  tenant: TenantModel.fromJson(json['tenant'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SwitchTenantResponseModelToJson(
  _SwitchTenantResponseModel instance,
) => <String, dynamic>{
  'access_token': instance.accessToken,
  'refresh_token': instance.refreshToken,
  'tenant': instance.tenant,
};
