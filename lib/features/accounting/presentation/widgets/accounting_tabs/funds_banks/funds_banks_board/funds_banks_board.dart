import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_board/funds_grid_view.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_board/funds_table_view.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/acc_badge.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FundsBanksBoard extends StatefulWidget {
  final List<FundBankData> data;
  final String? activeFilter;

  const FundsBanksBoard({super.key, required this.data, this.activeFilter});

  @override
  State<FundsBanksBoard> createState() => _FundsBanksBoardState();
}

class _FundsBanksBoardState extends State<FundsBanksBoard> {
  bool isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildBoardHeader(context, widget.data),
        gapH20,
        isGridView
            ? FundGridView(data: widget.data, activeFilter: widget.activeFilter)
            : FundsTableView(
                accounts: widget.data,
                activeFilter: widget.activeFilter,
              ),
      ],
    );
  }

  Widget _buildBoardHeader(BuildContext context, List<FundBankData> data) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      color: theme.gray50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                localizations.title_funds_and_banks,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: theme.textTertiary,
                  letterSpacing: 1.2,
                ),
              ),
              gapW8,
              AccBadge(value: '${data.length}'),
            ],
          ),
          _buildViewSwitcher(context),
        ],
      ),
    );
  }

  Widget _buildViewSwitcher(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p4,
        vertical: Dimens.p2,
      ),
      decoration: BoxDecoration(
        color: theme.primaryLight,
        borderRadius: BorderRadius.circular(Dimens.p6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildSwitcherTab(
            theme,
            isActive: isGridView,
            icon: LucideIcons.layoutGrid,
            label: localizations.view_grid,
            onTap: () => setState(() => isGridView = true),
          ),
          gapW2,
          _buildSwitcherTab(
            theme,
            isActive: !isGridView,
            icon: LucideIcons.table,
            label: localizations.view_table,
            onTap: () => setState(() => isGridView = false),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitcherTab(
    AppColorExtension colors, {
    required bool isActive,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(Dimens.p6),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: Dimens.p16,
              color: isActive ? colors.textTertiary : colors.gray400,
            ),
            gapW6,
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: isActive ? colors.textPrimary : colors.gray500,
                height: 1.0,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
