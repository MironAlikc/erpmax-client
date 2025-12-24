import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../entities/plan_entity.dart';
import '../repositories/billing_repository.dart';

@injectable
class GetPlansUseCase {
  final BillingRepository repository;

  GetPlansUseCase(this.repository);

  Future<Either<Failure, List<PlanEntity>>> call() {
    return repository.getPlans();
  }
}
