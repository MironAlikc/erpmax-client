import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/stat_entity.dart';
import '../entities/transaction_entity.dart';
import '../entities/quick_action_entity.dart';
import '../entities/account_entity.dart';

abstract class AccountingRepository {
  Future<Either<Failure, List<StatEntity>>> getDashboardStats();
  Future<Either<Failure, List<TransactionEntity>>> getRecentTransactions();
  Future<Either<Failure, List<QuickActionEntity>>> getQuickActions();
  Future<Either<Failure, List<AccountEntity>>> getAccountsWatchlist();
}
