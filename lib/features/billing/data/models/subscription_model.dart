import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/subscription_entity.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const SubscriptionModel._();

  const factory SubscriptionModel({
    String? id,
    @JsonKey(name: 'tenant_id') String? tenantId,
    @JsonKey(name: 'plan_id') String? planId,
    @JsonKey(name: 'plan_name') String? planName,
    String? status,
    @JsonKey(name: 'billing_period') String? billingPeriod,
    @JsonKey(defaultValue: 0.0) double? amount,
    @JsonKey(name: 'current_period_start') DateTime? currentPeriodStart,
    @JsonKey(name: 'current_period_end') DateTime? currentPeriodEnd,
    @JsonKey(name: 'cancel_at_period_end', defaultValue: false)
    bool? cancelAtPeriodEnd,
    @JsonKey(name: 'canceled_at') DateTime? canceledAt,
    @JsonKey(name: 'trial_end') DateTime? trialEnd,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  SubscriptionEntity toEntity() => SubscriptionEntity(
    id: id ?? '',
    tenantId: tenantId ?? '',
    planId: planId ?? '',
    planName: planName ?? '',
    status: status ?? '',
    billingPeriod: billingPeriod ?? '',
    amount: amount ?? 0.0,
    currentPeriodStart: currentPeriodStart ?? DateTime.now(),
    currentPeriodEnd: currentPeriodEnd ?? DateTime.now(),
    cancelAtPeriodEnd: cancelAtPeriodEnd ?? false,
    canceledAt: canceledAt,
    trialEnd: trialEnd,
  );
}
