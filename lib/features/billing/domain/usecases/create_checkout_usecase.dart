import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/billing/domain/entities/checkout_response_entity.dart';
import 'package:erpmax_client/features/billing/domain/repositories/billing_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCheckoutUseCase {
  final BillingRepository repository;

  CreateCheckoutUseCase(this.repository);

  Future<Either<Failure, CheckoutResponseEntity>> call({
    required String planId,
    required String billingPeriod,
    required String successUrl,
    required String cancelUrl,
  }) {
    return repository.createCheckout(
      planId: planId,
      billingPeriod: billingPeriod,
      successUrl: successUrl,
      cancelUrl: cancelUrl,
    );
  }
}
