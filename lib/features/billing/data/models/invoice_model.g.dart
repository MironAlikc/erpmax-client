// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoiceModel _$InvoiceModelFromJson(Map<String, dynamic> json) =>
    _InvoiceModel(
      id: json['id'] as String,
      subscriptionId: json['subscription_id'] as String,
      amount: (json['amount'] as num).toDouble(),
      status: json['status'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      paidAt: json['paid_at'] == null
          ? null
          : DateTime.parse(json['paid_at'] as String),
      invoiceUrl: json['invoice_url'] as String?,
    );

Map<String, dynamic> _$InvoiceModelToJson(_InvoiceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscription_id': instance.subscriptionId,
      'amount': instance.amount,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'paid_at': instance.paidAt?.toIso8601String(),
      'invoice_url': instance.invoiceUrl,
    };
