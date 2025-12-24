// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_with_tenants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserWithTenantsModel _$UserWithTenantsModelFromJson(
  Map<String, dynamic> json,
) => _UserWithTenantsModel(
  user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
  tenants: (json['tenants'] as List<dynamic>)
      .map((e) => UserTenantModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$UserWithTenantsModelToJson(
  _UserWithTenantsModel instance,
) => <String, dynamic>{'user': instance.user, 'tenants': instance.tenants};
