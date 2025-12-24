import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_response_entity.freezed.dart';

@freezed
abstract class CheckoutResponseEntity with _$CheckoutResponseEntity {
  const factory CheckoutResponseEntity({
    required String sessionId,
    required String checkoutUrl,
  }) = _CheckoutResponseEntity;
}
