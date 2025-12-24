// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _SubscriptionModel(
      id: json['id'] as String,
      tenantId: json['tenant_id'] as String,
      planId: json['plan_id'] as String,
      planName: json['plan_name'] as String,
      status: json['status'] as String,
      billingPeriod: json['billing_period'] as String,
      amount: (json['amount'] as num).toDouble(),
      currentPeriodStart: DateTime.parse(
        json['current_period_start'] as String,
      ),
      currentPeriodEnd: DateTime.parse(json['current_period_end'] as String),
      cancelAtPeriodEnd: json['cancel_at_period_end'] as bool,
      canceledAt: json['canceled_at'] == null
          ? null
          : DateTime.parse(json['canceled_at'] as String),
      trialEnd: json['trial_end'] == null
          ? null
          : DateTime.parse(json['trial_end'] as String),
    );

Map<String, dynamic> _$SubscriptionModelToJson(_SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'plan_id': instance.planId,
      'plan_name': instance.planName,
      'status': instance.status,
      'billing_period': instance.billingPeriod,
      'amount': instance.amount,
      'current_period_start': instance.currentPeriodStart.toIso8601String(),
      'current_period_end': instance.currentPeriodEnd.toIso8601String(),
      'cancel_at_period_end': instance.cancelAtPeriodEnd,
      'canceled_at': instance.canceledAt?.toIso8601String(),
      'trial_end': instance.trialEnd?.toIso8601String(),
    };
