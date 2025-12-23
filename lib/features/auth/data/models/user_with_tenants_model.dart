import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import 'user_tenant_model.dart';
import '../../domain/entities/user_with_tenants.dart';

part 'user_with_tenants_model.freezed.dart';
part 'user_with_tenants_model.g.dart';

@freezed
abstract class UserWithTenantsModel with _$UserWithTenantsModel {
  const UserWithTenantsModel._();

  const factory UserWithTenantsModel({
    required UserModel user,
    required List<UserTenantModel> tenants,
  }) = _UserWithTenantsModel;

  factory UserWithTenantsModel.fromJson(Map<String, dynamic> json) =>
      _$UserWithTenantsModelFromJson(json);

  UserWithTenants toEntity() => UserWithTenants(
    user: user.toEntity(),
    tenants: tenants.map((t) => t.toEntity()).toList(),
  );
}
