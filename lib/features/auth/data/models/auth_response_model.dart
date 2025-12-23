import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';
import 'tenant_model.dart';
import 'user_tenant_model.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';

@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    required UserModel user,
    required List<UserTenantModel> tenants,
    @JsonKey(name: 'current_tenant') required TenantModel currentTenant,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseModelFromJson(json);
}
