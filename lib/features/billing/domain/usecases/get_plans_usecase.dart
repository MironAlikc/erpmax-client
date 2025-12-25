import 'package:dartz/dartz.dart';
import 'package:erpmax_client/core/error/failures.dart';
import 'package:erpmax_client/features/billing/domain/entities/plan_entity.dart';
import 'package:erpmax_client/features/billing/domain/repositories/billing_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPlansUseCase {
  final BillingRepository repository;

  GetPlansUseCase(this.repository);

  Future<Either<Failure, List<PlanEntity>>> call() {
    return repository.getPlans();
  }
}
