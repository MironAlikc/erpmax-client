import 'package:freezed_annotation/freezed_annotation.dart';

part 'sso_token_validation_entity.freezed.dart';

@freezed
abstract class SSOTokenValidationEntity with _$SSOTokenValidationEntity {
  const factory SSOTokenValidationEntity({
    required bool valid,
    required String userId,
    required String tenantId,
    required DateTime createdAt,
  }) = _SSOTokenValidationEntity;
}
