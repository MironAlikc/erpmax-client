import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/subscription_entity.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const SubscriptionModel._();

  const factory SubscriptionModel({
    required String id,
    @JsonKey(name: 'tenant_id') required String tenantId,
    @JsonKey(name: 'plan_id') required String planId,
    @JsonKey(name: 'plan_name') required String planName,
    required String status,
    @JsonKey(name: 'billing_period') required String billingPeriod,
    required double amount,
    @JsonKey(name: 'current_period_start') required DateTime currentPeriodStart,
    @JsonKey(name: 'current_period_end') required DateTime currentPeriodEnd,
    @JsonKey(name: 'cancel_at_period_end') required bool cancelAtPeriodEnd,
    @JsonKey(name: 'canceled_at') DateTime? canceledAt,
    @JsonKey(name: 'trial_end') DateTime? trialEnd,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  SubscriptionEntity toEntity() => SubscriptionEntity(
    id: id,
    tenantId: tenantId,
    planId: planId,
    planName: planName,
    status: status,
    billingPeriod: billingPeriod,
    amount: amount,
    currentPeriodStart: currentPeriodStart,
    currentPeriodEnd: currentPeriodEnd,
    cancelAtPeriodEnd: cancelAtPeriodEnd,
    canceledAt: canceledAt,
    trialEnd: trialEnd,
  );
}
