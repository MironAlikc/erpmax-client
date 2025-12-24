import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_accounts_watchlist_usecase.dart';
import '../../domain/usecases/get_dashboard_stats_usecase.dart';
import '../../domain/usecases/get_quick_actions_usecase.dart';
import '../../domain/usecases/get_recent_transactions_usecase.dart';
import 'accounting_dashboard_event.dart';
import 'accounting_dashboard_state.dart';

class AccountingDashboardBloc
    extends Bloc<AccountingDashboardEvent, AccountingDashboardState> {
  final GetDashboardStatsUseCase getDashboardStats;
  final GetRecentTransactionsUseCase getRecentTransactions;
  final GetQuickActionsUseCase getQuickActions;
  final GetAccountsWatchlistUseCase getAccountsWatchlist;

  AccountingDashboardBloc({
    required this.getDashboardStats,
    required this.getRecentTransactions,
    required this.getQuickActions,
    required this.getAccountsWatchlist,
  }) : super(const AccountingDashboardInitial()) {
    on<LoadDashboardData>(_onLoadDashboardData);
    on<RefreshDashboardData>(_onRefreshDashboardData);
  }

  Future<void> _onLoadDashboardData(
    LoadDashboardData event,
    Emitter<AccountingDashboardState> emit,
  ) async {
    emit(const AccountingDashboardLoading());
    await _loadData(emit);
  }

  Future<void> _onRefreshDashboardData(
    RefreshDashboardData event,
    Emitter<AccountingDashboardState> emit,
  ) async {
    await _loadData(emit);
  }

  Future<void> _loadData(Emitter<AccountingDashboardState> emit) async {
    try {
      final statsResult = await getDashboardStats(NoParams());
      final transactionsResult = await getRecentTransactions(NoParams());
      final actionsResult = await getQuickActions(NoParams());
      final accountsResult = await getAccountsWatchlist(NoParams());

      statsResult.fold(
        (failure) => emit(AccountingDashboardError(message: failure.message)),
        (stats) {
          transactionsResult.fold(
            (failure) =>
                emit(AccountingDashboardError(message: failure.message)),
            (transactions) {
              actionsResult.fold(
                (failure) =>
                    emit(AccountingDashboardError(message: failure.message)),
                (actions) {
                  accountsResult.fold(
                    (failure) => emit(
                      AccountingDashboardError(message: failure.message),
                    ),
                    (accounts) {
                      emit(
                        AccountingDashboardLoaded(
                          stats: stats,
                          transactions: transactions,
                          quickActions: actions,
                          accounts: accounts,
                        ),
                      );
                    },
                  );
                },
              );
            },
          );
        },
      );
    } catch (e) {
      emit(AccountingDashboardError(message: e.toString()));
    }
  }
}
