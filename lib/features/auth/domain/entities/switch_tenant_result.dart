import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_tokens.dart';
import 'tenant_entity.dart';

part 'switch_tenant_result.freezed.dart';

@freezed
abstract class SwitchTenantResult with _$SwitchTenantResult {
  const factory SwitchTenantResult({
    required AuthTokens tokens,
    required TenantEntity tenant,
  }) = _SwitchTenantResult;
}
