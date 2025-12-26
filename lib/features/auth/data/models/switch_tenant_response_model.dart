import 'package:erpmax_client/features/auth/domain/entities/auth_tokens.dart';
import 'package:erpmax_client/features/auth/domain/entities/switch_tenant_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'tenant_model.dart';

part 'switch_tenant_response_model.freezed.dart';
part 'switch_tenant_response_model.g.dart';

@freezed
abstract class SwitchTenantResponseModel with _$SwitchTenantResponseModel {
  const SwitchTenantResponseModel._();

  const factory SwitchTenantResponseModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    required TenantModel tenant,
  }) = _SwitchTenantResponseModel;

  factory SwitchTenantResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SwitchTenantResponseModelFromJson(json);

  SwitchTenantResult toEntity() => SwitchTenantResult(
    tokens: AuthTokens(accessToken: accessToken, refreshToken: refreshToken),
    tenant: tenant.toEntity(),
  );
}
