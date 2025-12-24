import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/subscription_entity.dart';
import '../repositories/billing_repository.dart';

@injectable
class GetSubscriptionUseCase {
  final BillingRepository repository;

  GetSubscriptionUseCase(this.repository);

  Future<Either<Failure, SubscriptionEntity>> call() {
    return repository.getSubscription();
  }
}
