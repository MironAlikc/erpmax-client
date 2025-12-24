import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_entity.freezed.dart';

@freezed
abstract class SubscriptionEntity with _$SubscriptionEntity {
  const factory SubscriptionEntity({
    required String id,
    required String tenantId,
    required String planId,
    required String planName,
    required String status,
    required String billingPeriod,
    required double amount,
    required DateTime currentPeriodStart,
    required DateTime currentPeriodEnd,
    required bool cancelAtPeriodEnd,
    DateTime? canceledAt,
    DateTime? trialEnd,
  }) = _SubscriptionEntity;
}
