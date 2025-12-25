import 'package:freezed_annotation/freezed_annotation.dart';

part 'sso_token_entity.freezed.dart';

@freezed
abstract class SSOTokenEntity with _$SSOTokenEntity {
  const factory SSOTokenEntity({
    required String ssoUrl,
    required String token,
    required DateTime expiresAt,
  }) = _SSOTokenEntity;
}
