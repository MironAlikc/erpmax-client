import 'package:freezed_annotation/freezed_annotation.dart';
import 'invoice_model.dart';

part 'invoices_response_model.freezed.dart';
part 'invoices_response_model.g.dart';

@freezed
abstract class InvoicesResponseModel with _$InvoicesResponseModel {
  const InvoicesResponseModel._();

  const factory InvoicesResponseModel({required List<InvoiceModel> data}) =
      _InvoicesResponseModel;

  factory InvoicesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$InvoicesResponseModelFromJson(json);
}
