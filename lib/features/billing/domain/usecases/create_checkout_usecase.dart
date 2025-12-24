import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/checkout_response_entity.dart';
import '../repositories/billing_repository.dart';

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
