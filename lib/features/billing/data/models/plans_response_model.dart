import 'package:freezed_annotation/freezed_annotation.dart';
import 'plan_model.dart';

part 'plans_response_model.freezed.dart';
part 'plans_response_model.g.dart';

@freezed
abstract class PlansResponseModel with _$PlansResponseModel {
  const PlansResponseModel._();

  const factory PlansResponseModel({required List<PlanModel> data}) =
      _PlansResponseModel;

  factory PlansResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PlansResponseModelFromJson(json);
}
