import 'package:erpmax_client/features/auth/domain/entities/user_with_tenants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';
import 'user_tenant_model.dart';

part 'user_with_tenants_model.freezed.dart';
part 'user_with_tenants_model.g.dart';

@freezed
abstract class UserWithTenantsModel with _$UserWithTenantsModel {
  const UserWithTenantsModel._();

  const factory UserWithTenantsModel({
    required String id,
    required String email,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'is_superuser') required bool isSuperuser,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required List<UserTenantModel> tenants,
  }) = _UserWithTenantsModel;

  factory UserWithTenantsModel.fromJson(Map<String, dynamic> json) =>
      _$UserWithTenantsModelFromJson(json);

  UserWithTenants toEntity() => UserWithTenants(
    user: UserModel(
      id: this.id,
      email: this.email,
      fullName: this.fullName ?? '',
      isActive: this.isActive,
      isSuperuser: this.isSuperuser,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
    ).toEntity(),
    tenants: this.tenants.map((t) => t.toEntity()).toList(),
  );
}
