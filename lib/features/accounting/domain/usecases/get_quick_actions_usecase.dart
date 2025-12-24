import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/quick_action_entity.dart';
import '../repositories/accounting_repository.dart';

class GetQuickActionsUseCase
    implements UseCase<List<QuickActionEntity>, NoParams> {
  final AccountingRepository repository;

  GetQuickActionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<QuickActionEntity>>> call(NoParams params) async {
    return await repository.getQuickActions();
  }
}
