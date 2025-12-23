import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenant_user_entity.freezed.dart';

@freezed
abstract class TenantUserEntity with _$TenantUserEntity {
  const factory TenantUserEntity({
    required String userId,
    required String email,
    required String fullName,
    required String role,
    required bool isDefault,
    required DateTime joinedAt,
  }) = _TenantUserEntity;
}
