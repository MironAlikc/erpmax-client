import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/billing/domain/entities/subscription_entity.dart';
import 'package:erpmax_client/features/billing/domain/repositories/billing_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubscriptionUseCase {
  final BillingRepository repository;

  GetSubscriptionUseCase(this.repository);

  Future<Either<Failure, SubscriptionEntity>> call() {
    return repository.getSubscription();
  }
}
