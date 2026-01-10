// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_token_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SSOTokenValidationModel _$SSOTokenValidationModelFromJson(
  Map<String, dynamic> json,
) => _SSOTokenValidationModel(
  valid: json['valid'] as bool,
  userId: json['user_id'] as String,
  tenantId: json['tenant_id'] as String,
  createdAt: _parseUtcDateTime(json['created_at']),
);

Map<String, dynamic> _$SSOTokenValidationModelToJson(
  _SSOTokenValidationModel instance,
) => <String, dynamic>{
  'valid': instance.valid,
  'user_id': instance.userId,
  'tenant_id': instance.tenantId,
  'created_at': instance.createdAt.toIso8601String(),
};
