import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/account_entity.dart';
import '../repositories/accounting_repository.dart';

class GetAccountsWatchlistUseCase
    implements UseCase<List<AccountEntity>, NoParams> {
  final AccountingRepository repository;

  GetAccountsWatchlistUseCase(this.repository);

  @override
  Future<Either<Failure, List<AccountEntity>>> call(NoParams params) async {
    return await repository.getAccountsWatchlist();
  }
}
