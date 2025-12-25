import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/billing/domain/repositories/billing_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class CancelSubscriptionUseCase {
  final BillingRepository repository;

  CancelSubscriptionUseCase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.cancelSubscription();
  }
}
