// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutResponseModel _$CheckoutResponseModelFromJson(
  Map<String, dynamic> json,
) => _CheckoutResponseModel(
  sessionId: json['session_id'] as String,
  checkoutUrl: json['checkout_url'] as String,
);

Map<String, dynamic> _$CheckoutResponseModelToJson(
  _CheckoutResponseModel instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'checkout_url': instance.checkoutUrl,
};
