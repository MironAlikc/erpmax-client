import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_tenant_entity.freezed.dart';

@freezed
abstract class UserTenantEntity with _$UserTenantEntity {
  const factory UserTenantEntity({
    required String tenantId,
    required String tenantName,
    required String role,
    required bool isDefault,
  }) = _UserTenantEntity;
}
