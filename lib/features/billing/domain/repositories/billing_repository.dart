import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/plan_entity.dart';
import '../entities/subscription_entity.dart';
import '../entities/checkout_response_entity.dart';
import '../entities/invoice_entity.dart';

abstract class BillingRepository {
  Future<Either<Failure, List<PlanEntity>>> getPlans();

  Future<Either<Failure, SubscriptionEntity>> getSubscription();

  Future<Either<Failure, CheckoutResponseEntity>> createCheckout({
    required String planId,
    required String billingPeriod,
    required String successUrl,
    required String cancelUrl,
  });

  Future<Either<Failure, void>> cancelSubscription();

  Future<Either<Failure, List<InvoiceEntity>>> getInvoices({
    int page = 1,
    int size = 20,
  });
}
