// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sso_token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SSOTokenModel _$SSOTokenModelFromJson(Map<String, dynamic> json) =>
    _SSOTokenModel(
      ssoUrl: json['sso_url'] as String,
      token: json['token'] as String,
      expiresAt: _parseUtcDateTime(json['expires_at']),
    );

Map<String, dynamic> _$SSOTokenModelToJson(_SSOTokenModel instance) =>
    <String, dynamic>{
      'sso_url': instance.ssoUrl,
      'token': instance.token,
      'expires_at': instance.expiresAt.toIso8601String(),
    };
