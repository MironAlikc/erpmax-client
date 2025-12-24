import '../../domain/entities/account_entity.dart';
import '../../domain/entities/quick_action_entity.dart';
import '../../domain/entities/stat_entity.dart';
import '../../domain/entities/transaction_entity.dart';

abstract class AccountingDashboardState {
  const AccountingDashboardState();
}

class AccountingDashboardInitial extends AccountingDashboardState {
  const AccountingDashboardInitial();
}

class AccountingDashboardLoading extends AccountingDashboardState {
  const AccountingDashboardLoading();
}

class AccountingDashboardLoaded extends AccountingDashboardState {
  final List<StatEntity> stats;
  final List<TransactionEntity> transactions;
  final List<QuickActionEntity> quickActions;
  final List<AccountEntity> accounts;

  const AccountingDashboardLoaded({
    required this.stats,
    required this.transactions,
    required this.quickActions,
    required this.accounts,
  });
}

class AccountingDashboardError extends AccountingDashboardState {
  final String message;

  const AccountingDashboardError({required this.message});
}
