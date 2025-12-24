import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../repositories/billing_repository.dart';

@injectable
class CancelSubscriptionUseCase {
  final BillingRepository repository;

  CancelSubscriptionUseCase(this.repository);

  Future<Either<Failure, void>> call() {
    return repository.cancelSubscription();
  }
}
