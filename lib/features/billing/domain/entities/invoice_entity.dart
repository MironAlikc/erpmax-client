import 'package:freezed_annotation/freezed_annotation.dart';

part 'invoice_entity.freezed.dart';

@freezed
abstract class InvoiceEntity with _$InvoiceEntity {
  const factory InvoiceEntity({
    required String id,
    required String subscriptionId,
    required double amount,
    required String status,
    required DateTime createdAt,
    DateTime? paidAt,
    String? invoiceUrl,
  }) = _InvoiceEntity;
}
