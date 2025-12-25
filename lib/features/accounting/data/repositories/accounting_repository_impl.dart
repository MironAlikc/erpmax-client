import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/entities/quick_action_entity.dart';
import '../../domain/entities/stat_entity.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/accounting_repository.dart';
import '../datasources/accounting_remote_datasource.dart';

class AccountingRepositoryImpl implements AccountingRepository {
  final AccountingRemoteDataSource remoteDataSource;

  AccountingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<StatEntity>>> getDashboardStats() async {
    try {
      final stats = await remoteDataSource.getDashboardStats();
      return Right(stats.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TransactionEntity>>>
  getRecentTransactions() async {
    try {
      final transactions = await remoteDataSource.getRecentTransactions();
      return Right(transactions.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<QuickActionEntity>>> getQuickActions() async {
    try {
      final actions = await remoteDataSource.getQuickActions();
      return Right(actions.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<AccountEntity>>> getAccountsWatchlist() async {
    try {
      final accounts = await remoteDataSource.getAccountsWatchlist();
      return Right(accounts.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
