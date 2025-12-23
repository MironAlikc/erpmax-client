import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_entity.dart';
import 'user_tenant_entity.dart';

part 'user_with_tenants.freezed.dart';

@freezed
abstract class UserWithTenants with _$UserWithTenants {
  const factory UserWithTenants({
    required UserEntity user,
    required List<UserTenantEntity> tenants,
  }) = _UserWithTenants;
}
