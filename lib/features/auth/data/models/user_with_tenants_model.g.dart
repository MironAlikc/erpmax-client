// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_tenants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserWithTenantsModel _$UserWithTenantsModelFromJson(
  Map<String, dynamic> json,
) => _UserWithTenantsModel(
  id: json['id'] as String,
  email: json['email'] as String,
  fullName: json['full_name'] as String?,
  isActive: json['is_active'] as bool,
  isSuperuser: json['is_superuser'] as bool,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  tenants: (json['tenants'] as List<dynamic>)
      .map((e) => UserTenantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserWithTenantsModelToJson(
  _UserWithTenantsModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'full_name': instance.fullName,
  'is_active': instance.isActive,
  'is_superuser': instance.isSuperuser,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'tenants': instance.tenants,
};
