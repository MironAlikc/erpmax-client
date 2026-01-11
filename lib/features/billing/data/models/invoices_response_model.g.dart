// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoicesResponseModel _$InvoicesResponseModelFromJson(
  Map<String, dynamic> json,
) => _InvoicesResponseModel(
  data: (json['data'] as List<dynamic>)
      .map((e) => InvoiceModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$InvoicesResponseModelToJson(
  _InvoicesResponseModel instance,
) => <String, dynamic>{'data': instance.data};
