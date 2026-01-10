// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plans_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlansResponseModel _$PlansResponseModelFromJson(Map<String, dynamic> json) =>
    _PlansResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => PlanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PlansResponseModelToJson(_PlansResponseModel instance) =>
    <String, dynamic>{'data': instance.data};
