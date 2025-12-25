import 'package:erpmax_client/features/tenant/domain/entities/tenant_user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_user_model.freezed.dart';
part 'tenant_user_model.g.dart';

@freezed
abstract class TenantUserModel with _$TenantUserModel {
  const TenantUserModel._();

  const factory TenantUserModel({
    @JsonKey(name: 'user_id') required String userId,
    required String email,
    @JsonKey(name: 'full_name') required String fullName,
    required String role,
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'joined_at') required DateTime joinedAt,
  }) = _TenantUserModel;

  factory TenantUserModel.fromJson(Map<String, dynamic> json) =>
      _$TenantUserModelFromJson(json);

  TenantUserEntity toEntity() => TenantUserEntity(
    userId: userId,
    email: email,
    fullName: fullName,
    role: role,
    isDefault: isDefault,
    joinedAt: joinedAt,
  );
}
