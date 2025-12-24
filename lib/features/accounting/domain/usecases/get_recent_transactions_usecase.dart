import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/transaction_entity.dart';
import '../repositories/accounting_repository.dart';

class GetRecentTransactionsUseCase
    implements UseCase<List<TransactionEntity>, NoParams> {
  final AccountingRepository repository;

  GetRecentTransactionsUseCase(this.repository);

  @override
  Future<Either<Failure, List<TransactionEntity>>> call(NoParams params) async {
    return await repository.getRecentTransactions();
  }
}
