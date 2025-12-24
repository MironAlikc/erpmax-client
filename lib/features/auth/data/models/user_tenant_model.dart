import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_tenant_entity.dart';

part 'user_tenant_model.freezed.dart';
part 'user_tenant_model.g.dart';

@freezed
abstract class UserTenantModel with _$UserTenantModel {
  const UserTenantModel._();

  const factory UserTenantModel({
    @JsonKey(name: 'tenant_id') required String tenantId,
    @JsonKey(name: 'tenant_name') required String tenantName,
    required String role,
    @JsonKey(name: 'is_default') required bool isDefault,
  }) = _UserTenantModel;

  factory UserTenantModel.fromJson(Map<String, dynamic> json) =>
      _$UserTenantModelFromJson(json);

  UserTenantEntity toEntity() => UserTenantEntity(
        tenantId: tenantId,
        tenantName: tenantName,
        role: role,
        isDefault: isDefault,
      );
}
