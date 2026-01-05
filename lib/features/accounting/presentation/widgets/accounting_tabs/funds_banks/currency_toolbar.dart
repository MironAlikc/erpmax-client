import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/fund_bank_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/accounting_header_btn.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CurrencyToolbar extends StatelessWidget {
  final String? selected;

  final List<CurrencyModel> currencies;
  final List<FundBankData> allAccounts;

  final ValueChanged<String?> onChanged;

  const CurrencyToolbar({
    super.key,
    required this.selected,
    required this.currencies,
    required this.allAccounts,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 1000;

        return Container(
          padding: const EdgeInsets.all(Dimens.p12),
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(Dimens.p12),
          ),
          child: isWide
              ? _wideLayout(localizations, theme)
              : _narrowLayout(localizations, theme),
        );
      },
    );
  }

  Widget _wideLayout(AppLocalizations localizations, AppColorExtension colors) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Wrap(
            spacing: Dimens.p8,
            runSpacing: Dimens.p8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _filters(localizations, colors),
              AccountingHeaderBtn(
                icon: LucideIcons.plus,
                label: localizations.label_fund_bank,
                textColor: Colors.white,
                color: colors.sidebarActiveBgLight,
                height: 20,
                onTap: () {},
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Align(
          alignment: Alignment.centerRight,
          child: _Balances(
            allAccounts: allAccounts,
            onChanged: onChanged,
            selectedCurrency: selected,
          ),
        ),
      ],
    );
  }

  Widget _narrowLayout(
    AppLocalizations localizations,
    AppColorExtension colors,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: Dimens.p8,
          runSpacing: Dimens.p8,
          children: [
            _filters(localizations, colors),
            AccountingHeaderBtn(
              icon: LucideIcons.plus,
              label: localizations.label_fund_bank,
              textColor: Colors.white,
              color: colors.sidebarActiveBgLight,
              height: 20,
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        _Balances(
          allAccounts: allAccounts,
          onChanged: onChanged,
          selectedCurrency: selected,
        ),
      ],
    );
  }

  Widget _filters(AppLocalizations localizations, AppColorExtension colors) {
    return Wrap(
      spacing: Dimens.p8,
      runSpacing: Dimens.p8,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: colors.warningLight,
            borderRadius: BorderRadius.circular(Dimens.p8),
          ),
          child: Center(
            child: Icon(
              LucideIcons.coins,
              color: colors.warningText,
              size: Dimens.p20,
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          decoration: BoxDecoration(
            color: colors.primaryLight,
            borderRadius: BorderRadius.circular(Dimens.p6),
          ),
          child: Wrap(
            spacing: Dimens.p8,
            runSpacing: Dimens.p8,
            children: [
              _chip(colors, localizations.label_all, null),
              ...currencies.map(
                (c) => _chip(colors, c.currency, c.currency, c.flag),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _chip(
    AppColorExtension colors,
    String label,
    String? value, [
    String? flag,
  ]) {
    final active = selected == value;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: active ? colors.white : colors.primaryLight,
          borderRadius: BorderRadius.circular(Dimens.p6),
          border: Border.all(
            color: active ? colors.border : Colors.transparent,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (flag != null) ...[
              Text(flag, style: AppTextStyles.tableHeader),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                color: active ? colors.textPrimary : colors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Balances extends StatelessWidget {
  final List<FundBankData> allAccounts;
  final ValueChanged<String?> onChanged;
  final String? selectedCurrency;

  const _Balances({
    required this.allAccounts,
    required this.onChanged,
    this.selectedCurrency,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, double> totals = {};
    final Map<String, String> flags = {};

    for (var acc in allAccounts) {
      for (var detail in acc.currencyDetails) {
        totals[detail.currency] =
            (totals[detail.currency] ?? 0) + detail.amount;
        flags[detail.currency] = detail.flag;
      }
    }

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      children: totals.entries.map((entry) {
        final currencyCode = entry.key;

        final bool isThisActive = selectedCurrency == currencyCode;

        return GestureDetector(
          onTap: () => onChanged(currencyCode),
          child: BalanceCard(
            currency: currencyCode,
            flag: flags[currencyCode] ?? '',
            amount: entry.value.toStringAsFixed(0),
            isActive: isThisActive,
          ),
        );
      }).toList(),
    );
  }
}

class BalanceCard extends StatefulWidget {
  final String currency;
  final String flag;
  final String amount;
  final bool isActive;

  const BalanceCard({
    super.key,
    required this.currency,
    required this.flag,
    required this.amount,
    this.isActive = false,
  });

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool _isHovered = false;

  Color _getBorderColor(AppColorExtension colors) {
    if (widget.isActive) {
      return colors.primaryLight;
    }
    if (_isHovered) {
      return colors.gray400;
    }
    return colors.gray300;
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _getBorderColor(theme), width: 1),
          color: widget.isActive ? theme.primaryFooter : theme.primaryLight,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.flag, style: AppTextStyles.tableHeader),
                const SizedBox(width: 8),
                Text(
                  widget.amount,
                  style: AppTextStyles.sidebarItem.copyWith(
                    color: widget.isActive
                        ? theme.textWhite
                        : theme.textPrimary,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  widget.currency,
                  style: AppTextStyles.label.copyWith(
                    color: widget.isActive
                        ? theme.textWhite
                        : theme.textSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '${widget.amount} ${widget.currency}',
              style: AppTextStyles.caption.copyWith(color: theme.gray500),
            ),
          ],
        ),
      ),
    );
  }
}
