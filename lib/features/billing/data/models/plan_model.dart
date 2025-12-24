import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/plan_entity.dart';

part 'plan_model.freezed.dart';
part 'plan_model.g.dart';

@freezed
abstract class PlanModel with _$PlanModel {
  const PlanModel._();

  const factory PlanModel({
    required String id,
    required String name,
    required String description,
    @JsonKey(name: 'monthly_price') required double monthlyPrice,
    @JsonKey(name: 'yearly_price') required double yearlyPrice,
    required Map<String, dynamic> features,
    @JsonKey(name: 'max_users') required int maxUsers,
    @JsonKey(name: 'max_storage') required int maxStorage,
    @JsonKey(name: 'is_active') required bool isActive,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  PlanEntity toEntity() => PlanEntity(
    id: id,
    name: name,
    description: description,
    monthlyPrice: monthlyPrice,
    yearlyPrice: yearlyPrice,
    features: features,
    maxUsers: maxUsers,
    maxStorage: maxStorage,
    isActive: isActive,
  );
}
