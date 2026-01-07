import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/funds_banks_board/funds_detail_panel.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/acc_badge.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/side_panel/side_panel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

class FundsTableView extends StatefulWidget {
  final List<FundBankData> accounts;
  final String? activeFilter;

  const FundsTableView({super.key, required this.accounts, this.activeFilter});

  @override
  State<FundsTableView> createState() => _FundsTableViewState();
}

class _FundsTableViewState extends State<FundsTableView> {
  final ScrollController _horizontalController = ScrollController();
  final double minWidth = 600;

  @override
  void dispose() {
    _horizontalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      margin: EdgeInsets.only(bottom: Dimens.p24),
      decoration: BoxDecoration(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final contentWidth = constraints.maxWidth < minWidth
              ? minWidth
              : constraints.maxWidth;

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Scrollbar(
                controller: _horizontalController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _horizontalController,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(bottom: Dimens.p12),
                  child: SizedBox(
                    width: contentWidth,
                    child: Column(
                      children: [
                        _FundsTableHeader(activeFilter: widget.activeFilter),

                        Divider(height: 1, color: theme.border),
                        ...widget.accounts.map(
                          (account) => FundsRow(
                            account: account,
                            activeFilter: widget.activeFilter,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Divider(height: 1, color: theme.border),
              _FundsTableFooter(
                accounts: widget.accounts,
                activeFilter: widget.activeFilter,
              ),
            ],
          );
        },
      ),
    );
  }
}

class FundsRow extends StatefulWidget {
  final FundBankData account;
  final String? activeFilter;

  const FundsRow({super.key, required this.account, this.activeFilter});

  @override
  State<FundsRow> createState() => _FundsRowState();
}

class _FundsRowState extends State<FundsRow> {
  bool _isHovered = false;

  double getAmountForCurrency(String targetCurrency) {
    final double targetRate = exchangeRates[targetCurrency] ?? 1.0;
    double totalEquivalent = 0;

    for (var detail in widget.account.currencyDetails) {
      double currentCurrencyRate = exchangeRates[detail.currency] ?? 1.0;

      totalEquivalent += (detail.amount / currentCurrencyRate) * targetRate;
    }

    if (totalEquivalent == 0 && widget.account.balance > 0) {
      double accountBaseRate = exchangeRates[widget.account.currency] ?? 1.0;
      totalEquivalent = (widget.account.balance / accountBaseRate) * targetRate;
    }

    return totalEquivalent;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final String currentDisplayCurrency = widget.activeFilter ?? 'SAR';

    final double currentDisplayAmount = getAmountForCurrency(
      currentDisplayCurrency,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: () {
          context.read<SidePanelCubit>().open(
            FundsDetailsPanel(account: widget.account),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: _isHovered
                ? theme.primaryLight.withValues(alpha: 0.8)
                : theme.white,
            border: BoxBorder.fromSTEB(
              start: BorderSide(width: 1, color: theme.border),
              end: BorderSide(width: 1, color: theme.border),
              bottom: BorderSide(width: 1, color: theme.border),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.p12,
            vertical: Dimens.p12,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    _buildBankIcon(theme, widget.account),
                    gapW12,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.account.name,
                            style: AppTextStyles.tableHeader.copyWith(
                              color: theme.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            widget.account.accountNumber ??
                                AppLocalizations.of(context).labelCashFund,
                            style: AppTextStyles.caption.copyWith(
                              color: theme.textSecondary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Center(child: _buildTypeBadge(theme, widget.account)),
              ),
              Expanded(
                flex: 2,
                child: _buildBalanceInfo(
                  theme,
                  widget.account,
                  currentDisplayAmount,
                  currentDisplayCurrency,
                ),
              ),
              Expanded(
                flex: 3,
                child: _buildCurrencyList(theme, widget.account),
              ),
              Expanded(
                flex: 2,
                child: _buildChangeIndicator(theme, widget.account),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.account.lastActivity,
                  style: AppTextStyles.caption.copyWith(
                    letterSpacing: 1.2,
                    color: theme.textTertiary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      theme,
                      LucideIcons.arrowDownRight,
                      localizations.actionWithdraw,
                    ),
                    _buildActionButton(
                      theme,
                      LucideIcons.arrowUpRight,
                      localizations.actionDeposit,
                    ),
                    _buildActionButton(
                      theme,
                      LucideIcons.moreHorizontal,
                      localizations.actionDeposit,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _getDisplayAmount() {
    final filter = widget.activeFilter;

    if (filter == null) return widget.account.balance;

    final existingDetail = widget.account.currencyDetails.firstWhere(
      (d) => d.currency == filter,
      orElse: () => CurrencyModel(flag: '', amount: -1, currency: ''),
    );

    if (existingDetail.amount != -1) return existingDetail.amount;

    double rate = exchangeRates[filter] ?? 1.0;
    return widget.account.balance * rate;
  }

  Widget _buildBankIcon(AppColorExtension colors, FundBankData account) {
    final isCash = account.type == 'Cash';

    return Container(
      padding: const EdgeInsets.all(Dimens.p6),
      decoration: BoxDecoration(
        color: isCash
            ? colors.successText.withValues(alpha: 0.08)
            : colors.infoText.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        isCash ? LucideIcons.wallet : LucideIcons.landmark,
        color: isCash ? colors.successText : colors.infoText,
        size: 16,
      ),
    );
  }

  Widget _buildTypeBadge(AppColorExtension colors, FundBankData account) {
    final isCash = account.type == 'Cash';
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p8,
        vertical: Dimens.p4,
      ),
      decoration: BoxDecoration(
        color: isCash
            ? colors.successText.withValues(alpha: 0.08)
            : colors.infoText.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(Dimens.p6),
      ),
      child: Text(
        account.type,
        style: AppTextStyles.caption.copyWith(
          color: isCash ? colors.successText : colors.infoText,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButton(
    AppColorExtension colors,
    IconData icon,
    String tooltip,
  ) {
    return SizedBox(
      width: 24,
      child: IconButton(
        icon: Icon(icon, size: Dimens.p12),
        onPressed: () {},
        color: colors.textSecondary,
        padding: EdgeInsets.zero,
        tooltip: tooltip,
      ),
    );
  }

  Widget _buildBalanceInfo(
    AppColorExtension colors,
    FundBankData account,
    double amount,
    String currency,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          formatNum(amount),
          style: AppTextStyles.h4.copyWith(
            color: colors.successText,
            height: 1.0,
          ),
        ),
        Visibility(
          visible:
              widget.activeFilter != null &&
              account.currencyDetails.any(
                (d) => d.currency == widget.activeFilter,
              ),
          child: Padding(
            padding: const EdgeInsets.only(top: Dimens.p4),
            child: Text(
              AppLocalizations.of(context).labelConverted,
              style: AppTextStyles.caption.copyWith(
                color: colors.warning,
                fontSize: 9,
                fontWeight: FontWeight.bold,
                height: 1.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyList(AppColorExtension colors, FundBankData account) {
    final filter = widget.activeFilter;

    if (filter == null) {
      return Wrap(
        spacing: Dimens.p4,
        runSpacing: Dimens.p4,
        children: account.currencyDetails
            .map((detail) => _miniBadge(colors, detail, false))
            .toList(),
      );
    }

    bool existsInDetails = account.currencyDetails.any(
      (d) => d.currency == filter,
    );

    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        if (!existsInDetails)
          _miniBadge(
            colors,
            CurrencyModel(
              flag: getFlagFor(filter),
              amount: _getDisplayAmount(),
              currency: filter,
            ),
            true,
            isConverted: true,
          ),

        ...account.currencyDetails.map((detail) {
          final isHighlighted = detail.currency == filter;
          return _miniBadge(colors, detail, isHighlighted);
        }),
      ],
    );
  }

  Widget _miniBadge(
    AppColorExtension colors,
    CurrencyModel detail,
    bool isHighlighted, {
    bool isConverted = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p6,
        vertical: Dimens.p2,
      ),
      decoration: BoxDecoration(
        color: isHighlighted
            ? colors.border
            : colors.border.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isHighlighted ? colors.border : Colors.transparent,
        ),
      ),
      child: Text(
        '${detail.flag} ${formatNum(detail.amount)} ${detail.currency}${isConverted ? '*' : ''}',
        style: AppTextStyles.caption.copyWith(
          fontSize: 10,
          height: 1.0,
          fontWeight: isHighlighted ? FontWeight.w500 : FontWeight.normal,
          color: isHighlighted ? colors.textTertiary : colors.textSecondary,
        ),
      ),
    );
  }

  Widget _buildChangeIndicator(AppColorExtension colors, FundBankData account) {
    final isPositive = account.todayChange >= 0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isPositive ? LucideIcons.trendingUp : LucideIcons.trendingDown,
          color: isPositive ? colors.successText : colors.errorText,
          size: Dimens.p14,
        ),
        gapW6,
        Text(
          '${isPositive ? '+' : ''}${account.todayChange}',
          style: AppTextStyles.h4.copyWith(
            color: isPositive ? colors.successText : colors.errorText,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class _FundsTableHeader extends StatelessWidget {
  final String? activeFilter;

  const _FundsTableHeader({this.activeFilter});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

    final String currentCurrency = activeFilter ?? 'SAR';

    return Container(
      decoration: BoxDecoration(
        color: theme.primaryLight,
        border: BoxBorder.fromSTEB(
          top: BorderSide(width: 1, color: theme.border),
          start: BorderSide(width: 1, color: theme.border),
          end: BorderSide(width: 1, color: theme.border),
        ),
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p12,
        vertical: Dimens.p14,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              localizations.labelFundBank,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.type,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.balanceWithCurrency(currentCurrency),
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              localizations.currencyDetails,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.todaysChange,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.lastActivity,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),

          SizedBox(
            width: 90,
            child: Text(
              localizations.actions,
              style: style,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _FundsTableFooter extends StatelessWidget {
  final List<FundBankData> accounts;
  final String? activeFilter;

  const _FundsTableFooter({required this.accounts, this.activeFilter});

  double _calculateGrandTotal() {
    final targetCurrency = activeFilter ?? 'SAR';
    final double targetRate = exchangeRates[targetCurrency] ?? 1.0;

    double grandTotal = 0;

    for (var account in accounts) {
      for (var detail in account.currencyDetails) {
        double currentCurrencyRate = exchangeRates[detail.currency] ?? 1.0;
        grandTotal += (detail.amount / currentCurrencyRate) * targetRate;
      }
    }
    return grandTotal;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final style = AppTextStyles.tableHeader;

    final totalAmount = _calculateGrandTotal();
    final displayCurrency = activeFilter ?? 'SAR';

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: Dimens.p12),
      decoration: BoxDecoration(color: theme.primaryFooter),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppLocalizations.of(context).accountsCount,
                  style: AppTextStyles.caption.copyWith(color: theme.textWhite),
                ),
                const SizedBox(width: Dimens.p4),
                AccBadge(
                  fontSize: 14,
                  textColor: theme.textWhite,
                  value: accounts.length.toString(),
                  backgroundColor: theme.addButton.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(
            flex: 3,
            child: Text(
              formatNum(totalAmount),
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '8 500',
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          SizedBox(
            width: 90,
            child: Text(
              displayCurrency,
              style: AppTextStyles.tableHeader.copyWith(
                color: theme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
