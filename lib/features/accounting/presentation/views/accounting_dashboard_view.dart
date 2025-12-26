import 'package:erpmax_client/features/dashboard/presentation/widgets/components/dashboard_summary_grid.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounts_watchlist.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/quick_actions_panel.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/recent_transactions_table.dart';

class AccountingDashboardView extends StatelessWidget {
  const AccountingDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем ширину экрана один раз для всех дочерних виджетов
    final double screenWidth = MediaQuery.of(context).size.width;

    // Используем стандартный брейкпоинт из AppDesign
    final bool isMobile = screenWidth < AppDesign.desktopBreakpoint;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDesign.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Используем наш переиспользуемый грид с карточками AppStatCard
          DashboardSummaryGrid(screenWidth: screenWidth),

          const SizedBox(height: 32),

          // 2. Адаптивная раскладка для таблиц и панелей
          if (isMobile)
            Column(
              children: const [
                RecentTransactionsTable(),
                SizedBox(height: 24),
                QuickActionsPanel(),
                SizedBox(height: 24),
                AccountsWatchlist(),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Основной контент (Таблица транзакций)
                const Expanded(flex: 2, child: RecentTransactionsTable()),

                const SizedBox(width: 24),

                // Боковая панель (Действия и Вотчлист)
                const Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      QuickActionsPanel(),
                      SizedBox(height: 24),
                      AccountsWatchlist(),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
