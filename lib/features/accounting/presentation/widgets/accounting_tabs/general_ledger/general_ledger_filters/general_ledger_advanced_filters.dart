import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum CurrencyType { sar, usd, eur, aed }

class GeneralLedgerAdvancedFilters extends StatefulWidget {
  const GeneralLedgerAdvancedFilters({super.key});

  @override
  State<GeneralLedgerAdvancedFilters> createState() =>
      _GeneralLedgerAdvancedFiltersState();
}

class _GeneralLedgerAdvancedFiltersState
    extends State<GeneralLedgerAdvancedFilters> {
  CurrencyType selectedCurrency = CurrencyType.sar;

  final List<CurrencyType> currencyItems = CurrencyType.values;

  String currencyItemLabelBuilder(CurrencyType type) {
    switch (type) {
      case CurrencyType.sar:
        return 'SAR';
      case CurrencyType.usd:
        return 'USD';
      case CurrencyType.eur:
        return 'EUR';
      case CurrencyType.aed:
        return 'AED';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: [
        // Левая группа: Аккаунт, Валюта и Быстрые даты
        Wrap(
          spacing: 12,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildAccountSelector(context),
            AccDropdown(
              value: selectedCurrency,
              items: currencyItems,
              itemLabelBuilder: currencyItemLabelBuilder,
              leadingIcon: LucideIcons.coins,
              onChanged: (CurrencyType newValue) {
                setState(() {
                  selectedCurrency = newValue;
                });
              },
            ),
            // _buildCurrencySelector(context),
            _buildDivider(theme),
            _buildQuickPeriodLinks(context),
            _buildDivider(theme),
          ],
        ),

        // Правая группа: Чекбокс и Кнопки действий
        Wrap(
          spacing: 16,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildCheckbox(context, 'Show Cancelled Entries'),
            _buildResetButton(context),
            _buildSearchButton(context),
          ],
        ),
      ],
    );
  }

  // Селектор аккаунта (широкий)
  Widget _buildAccountSelector(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      width: 200, // Фиксированная ширина для стабильности
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Занимать минимум места
        children: [
          Icon(LucideIcons.chevronDown, size: 16, color: theme.textSecondary),
          const SizedBox(width: 8),
          Text(
            'Account',
            style: AppTextStyles.bodyMedium.copyWith(
              color: theme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // Селектор валюты
  // Widget _buildCurrencySelector(BuildContext context) {
  //   final theme = context.theme.appColor;
  //   return Container(
  //     // Убираем ширину или ставим небольшую, чтобы SAR не растягивался
  //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //     decoration: BoxDecoration(
  //       border: Border.all(color: theme.border),
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Row(
  //       mainAxisSize: MainAxisSize.min, // КЛЮЧЕВОЙ МОМЕНТ: не дает расширяться
  //       children: [
  //         Icon(LucideIcons.coins, size: 16, color: theme.textSecondary),
  //         const SizedBox(width: 8),
  //         Text('SAR', style: AppTextStyles.bodyMedium),
  //         const SizedBox(width: 8),
  //         Icon(
  //           LucideIcons.chevronsUpDown,
  //           size: 14,
  //           color: theme.textSecondary,
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildActions(BuildContext context) {
  Widget _buildQuickPeriodLinks(BuildContext context) {
    final labels = [
      'Today',
      'Yesterday',
      'This Week',
      'Last Week',
      'This Month',
    ];
    return Wrap(
      spacing: 12,
      children: labels
          .map(
            (label) => InkWell(
              onTap: () {},
              child: Text(
                label,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: context.theme.appColor.textPrimary,
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCheckbox(BuildContext context, String label) {
    final theme = context.theme.appColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            border: Border.all(color: theme.border, width: 2),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: AppTextStyles.bodyMedium),
      ],
    );
  }

  Widget _buildResetButton(BuildContext context) {
    final theme = context.theme.appColor;
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(LucideIcons.rotateCcw, size: 16, color: theme.textPrimary),
      label: Text(
        'Reset',
        style: AppTextStyles.bodyMedium.copyWith(color: theme.textPrimary),
      ),
    );
  }

  Widget _buildSearchButton(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: theme.successText.withOpacity(0.5), // Светло-зеленый как на фото
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.search, size: 18, color: theme.white),
          const SizedBox(width: 8),
          Text(
            'Search',
            style: AppTextStyles.bodyMedium.copyWith(
              color: theme.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(dynamic theme) {
    return Container(
      height: 20,
      width: 1,
      color: theme.border.withOpacity(0.5),
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
