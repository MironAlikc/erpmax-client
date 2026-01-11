import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/sso_token_validation_entity.dart';

part 'sso_token_validation_model.freezed.dart';
part 'sso_token_validation_model.g.dart';

@freezed
abstract class SSOTokenValidationModel with _$SSOTokenValidationModel {
  const SSOTokenValidationModel._();

  const factory SSOTokenValidationModel({
    required bool valid,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'tenant_id') required String tenantId,
    @JsonKey(name: 'created_at', fromJson: _parseUtcDateTime)
    required DateTime createdAt,
  }) = _SSOTokenValidationModel;

  factory SSOTokenValidationModel.fromJson(Map<String, dynamic> json) =>
      _$SSOTokenValidationModelFromJson(json);

  SSOTokenValidationEntity toEntity() => SSOTokenValidationEntity(
    valid: valid,
    userId: userId,
    tenantId: tenantId,
    createdAt: createdAt,
  );
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
