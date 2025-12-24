import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_entity.freezed.dart';

@freezed
abstract class PlanEntity with _$PlanEntity {
  const factory PlanEntity({
    required String id,
    required String name,
    required String description,
    required double monthlyPrice,
    required double yearlyPrice,
    required Map<String, dynamic> features,
    required int maxUsers,
    required int maxStorage,
    required bool isActive,
  }) = _PlanEntity;
}
