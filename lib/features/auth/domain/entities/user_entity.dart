import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String email,
    required String fullName,
    required bool isActive,
    required bool isSuperuser,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserEntity;
}
