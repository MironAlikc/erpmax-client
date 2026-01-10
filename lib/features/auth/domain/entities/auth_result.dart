import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_tokens.dart';
import 'user_entity.dart';
import 'user_tenant_entity.dart';
import 'tenant_entity.dart';

part 'auth_result.freezed.dart';

@freezed
abstract class AuthResult with _$AuthResult {
  const factory AuthResult({
    required AuthTokens tokens,
    required UserEntity user,
    required List<UserTenantEntity> tenants,
    TenantEntity? currentTenant,
  }) = _AuthResult;
}
