// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_tenant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserTenantModel _$UserTenantModelFromJson(Map<String, dynamic> json) =>
    _UserTenantModel(
      tenantId: json['tenant_id'] as String,
      tenantName: json['tenant_name'] as String,
      role: json['role'] as String,
      isDefault: json['is_default'] as bool,
    );

Map<String, dynamic> _$UserTenantModelToJson(_UserTenantModel instance) =>
    <String, dynamic>{
      'tenant_id': instance.tenantId,
      'tenant_name': instance.tenantName,
      'role': instance.role,
      'is_default': instance.isDefault,
    };
