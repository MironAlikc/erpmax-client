// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlanModel _$PlanModelFromJson(Map<String, dynamic> json) => _PlanModel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  monthlyPrice: (json['monthly_price'] as num?)?.toDouble() ?? 0.0,
  yearlyPrice: (json['yearly_price'] as num?)?.toDouble() ?? 0.0,
  features: json['features'],
  maxUsers: (json['max_users'] as num?)?.toInt() ?? 0,
  maxStorage: (json['max_storage'] as num?)?.toInt() ?? 0,
  isActive: json['is_active'] as bool? ?? false,
);

Map<String, dynamic> _$PlanModelToJson(_PlanModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'monthly_price': instance.monthlyPrice,
      'yearly_price': instance.yearlyPrice,
      'features': instance.features,
      'max_users': instance.maxUsers,
      'max_storage': instance.maxStorage,
      'is_active': instance.isActive,
    };
