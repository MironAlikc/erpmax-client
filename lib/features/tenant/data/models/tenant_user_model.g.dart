// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenant_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TenantUserModel _$TenantUserModelFromJson(Map<String, dynamic> json) =>
    _TenantUserModel(
      userId: json['user_id'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String,
      role: json['role'] as String,
      isDefault: json['is_default'] as bool,
      joinedAt: DateTime.parse(json['joined_at'] as String),
    );

Map<String, dynamic> _$TenantUserModelToJson(_TenantUserModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'full_name': instance.fullName,
      'role': instance.role,
      'is_default': instance.isDefault,
      'joined_at': instance.joinedAt.toIso8601String(),
    };
