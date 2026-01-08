import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/side_panel/side_panel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FundsDetailsPanel extends StatelessWidget {
  final FundBankData account;

  const FundsDetailsPanel({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      children: [
        _buildHeader(context, theme),

        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildStatsGrid(theme),
                const SizedBox(height: 32),
                Text(
                  "Transaction History",
                  style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context, dynamic theme) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 24, 32),
      color: const Color(0xFF1E6AF3),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  context.read<SidePanelCubit>().hide();
                },
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      account.accountNumber ?? "Cash Fund",
                      style: TextStyle(color: Colors.white.withOpacity(0.7)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(dynamic theme) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2.5,
          children: [
            _buildStatCard(
              "Total Balance",
              "SAR 1,240,000.00",
              theme,
              progress: 0.7,
            ),
            _buildStatCard("Total Deposits", "SAR 850,000.00", theme),
            _buildStatCard("Total Withdrawals", "SAR 210,000.00", theme),
            _buildStatCard("Pending", "SAR 45,000.00", theme),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    dynamic theme, {
    double? progress,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: theme.textSecondary, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              color: theme.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (progress != null)
            LinearProgressIndicator(
              value: progress,
              backgroundColor: theme.gray100,
              color: Colors.green,
              minHeight: 4,
            ),
        ],
      ),
    );
  }
}
