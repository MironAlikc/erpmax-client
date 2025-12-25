import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/checkout_response_entity.dart';

part 'checkout_response_model.freezed.dart';
part 'checkout_response_model.g.dart';

@freezed
abstract class CheckoutResponseModel with _$CheckoutResponseModel {
  const CheckoutResponseModel._();

  const factory CheckoutResponseModel({
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'checkout_url') required String checkoutUrl,
  }) = _CheckoutResponseModel;

  factory CheckoutResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseModelFromJson(json);

  CheckoutResponseEntity toEntity() =>
      CheckoutResponseEntity(sessionId: sessionId, checkoutUrl: checkoutUrl);
}
