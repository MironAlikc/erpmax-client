// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantModel _$TenantModelFromJson(Map<String, dynamic> json) => _TenantModel(
  id: json['id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  status: $enumDecode(_$TenantStatusEnumMap, json['status']),
  erpnextSiteUrl: json['erpnext_site_url'] as String?,
  settings: json['settings'] as Map<String, dynamic>?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TenantModelToJson(_TenantModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'status': _$TenantStatusEnumMap[instance.status]!,
      'erpnext_site_url': instance.erpnextSiteUrl,
      'settings': instance.settings,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

const _$TenantStatusEnumMap = {
  TenantStatus.pending: 'pending',
  TenantStatus.provisioning: 'provisioning',
  TenantStatus.active: 'active',
  TenantStatus.suspended: 'suspended',
  TenantStatus.cancelled: 'cancelled',
};
