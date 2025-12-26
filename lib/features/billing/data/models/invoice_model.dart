import 'package:erpmax_client/features/billing/domain/entities/invoice_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_model.freezed.dart';
part 'invoice_model.g.dart';

@freezed
abstract class InvoiceModel with _$InvoiceModel {
  const InvoiceModel._();

  const factory InvoiceModel({
    required String id,
    @JsonKey(name: 'subscription_id') required String subscriptionId,
    required double amount,
    required String status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'paid_at') DateTime? paidAt,
    @JsonKey(name: 'invoice_url') String? invoiceUrl,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceModelFromJson(json);

  InvoiceEntity toEntity() => InvoiceEntity(
    id: id,
    subscriptionId: subscriptionId,
    amount: amount,
    status: status,
    createdAt: createdAt,
    paidAt: paidAt,
    invoiceUrl: invoiceUrl,
  );
}
