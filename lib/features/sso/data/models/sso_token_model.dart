import 'package:erpmax_client/features/sso/domain/entities/sso_token_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sso_token_model.freezed.dart';
part 'sso_token_model.g.dart';

@freezed
abstract class SSOTokenModel with _$SSOTokenModel {
  const SSOTokenModel._();

  const factory SSOTokenModel({
    @JsonKey(name: 'sso_url') required String ssoUrl,
    required String token,
    @JsonKey(name: 'expires_at', fromJson: _parseUtcDateTime)
    required DateTime expiresAt,
  }) = _SSOTokenModel;

  factory SSOTokenModel.fromJson(Map<String, dynamic> json) =>
      _$SSOTokenModelFromJson(json);

  SSOTokenEntity toEntity() =>
      SSOTokenEntity(ssoUrl: ssoUrl, token: token, expiresAt: expiresAt);
}

DateTime _parseUtcDateTime(dynamic value) {
  if (value is String) {
    final dateTime = DateTime.parse(value);
    return dateTime.isUtc
        ? dateTime
        : DateTime.utc(
            dateTime.year,
            dateTime.month,
            dateTime.day,
            dateTime.hour,
            dateTime.minute,
            dateTime.second,
            dateTime.millisecond,
            dateTime.microsecond,
          );
  }
  throw ArgumentError('Invalid datetime value: $value');
}
