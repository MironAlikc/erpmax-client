import 'package:erpmax_client/features/billing/domain/entities/plan_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'plan_model.freezed.dart';
part 'plan_model.g.dart';

@freezed
abstract class PlanModel with _$PlanModel {
  const PlanModel._();

  const factory PlanModel({
    required String id,
    required String name,
    required String description,
    @JsonKey(name: 'monthly_price', defaultValue: 0.0) double? monthlyPrice,
    @JsonKey(name: 'yearly_price', defaultValue: 0.0) double? yearlyPrice,
    dynamic features,
    @JsonKey(name: 'max_users', defaultValue: 0) int? maxUsers,
    @JsonKey(name: 'max_storage', defaultValue: 0) int? maxStorage,
    @JsonKey(name: 'is_active', defaultValue: false) bool? isActive,
  }) = _PlanModel;

  factory PlanModel.fromJson(Map<String, dynamic> json) =>
      _$PlanModelFromJson(json);

  PlanEntity toEntity() {
    Map<String, dynamic> featuresMap = {};
    if (features != null) {
      if (features is Map) {
        featuresMap = features as Map<String, dynamic>;
      } else if (features is List) {
        final featuresList = features as List;
        // Convert list to map with index as key
        featuresMap = {
          for (var i = 0; i < featuresList.length; i++)
            i.toString(): featuresList[i],
        };
      }
    }

    return PlanEntity(
      id: id,
      name: name,
      description: description,
      monthlyPrice: monthlyPrice ?? 0.0,
      yearlyPrice: yearlyPrice ?? 0.0,
      features: featuresMap,
      maxUsers: maxUsers ?? 0,
      maxStorage: maxStorage ?? 0,
      isActive: isActive ?? false,
    );
  }
}
