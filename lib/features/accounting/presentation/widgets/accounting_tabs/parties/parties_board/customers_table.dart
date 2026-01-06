import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/acc_badge.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomersTableView extends StatelessWidget {
  final List<Customer> customers;

  const CustomersTableView({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.p12),
        border: Border.all(width: 1, color: theme.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _FundsTableHeader(),
          Divider(height: 1, color: theme.border),
          ...customers.map((customer) => CustomersTableRow(customer: customer)),
          _CustomersTableFooter(),
        ],
      ),
    );
  }
}

class CustomersTableRow extends StatefulWidget {
  final Customer customer;

  const CustomersTableRow({super.key, required this.customer});

  @override
  State<CustomersTableRow> createState() => _CustomersTableHeader();
}

class _CustomersTableHeader extends State<CustomersTableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Container(
        decoration: BoxDecoration(
          color: _isHovered
              ? theme.primaryLight.withValues(alpha: 0.8)
              : theme.white,
          border: BoxBorder.fromSTEB(
            bottom: BorderSide(width: 1, color: theme.border),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.p12,
          vertical: Dimens.p12,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 28,
              child: AccCheckbox(value: true, onChanged: (_) {}),
            ),
            Expanded(
              flex: 4,
              child: Text(
                'Name',
                style: AppTextStyles.tableHeader.copyWith(
                  color: theme.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(child: _buildTypeBadge(theme, 'VIP')),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'Name',
                style: AppTextStyles.tableHeader.copyWith(
                  color: theme.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(flex: 2, child: _buildBalanceInfo(theme, '12 000')),
            Expanded(flex: 2, child: _buildBalanceInfo(theme, '12 000')),
            Expanded(
              flex: 1,
              child: Center(child: _buildTypeBadge(theme, 'VIP')),
            ),
            SizedBox(width: 46, child: Icon(LucideIcons.moreHorizontal)),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeBadge(AppColorExtension colors, String type) {
    final isCash = type == 'VIP';
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
        type,
        style: AppTextStyles.caption.copyWith(
          color: isCash ? colors.successText : colors.infoText,
          height: 1.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildBalanceInfo(AppColorExtension colors, String amount) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          amount,
          style: AppTextStyles.h4.copyWith(
            color: colors.successText,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}

class _FundsTableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

    return Container(
      decoration: BoxDecoration(
        color: theme.primaryLight,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Dimens.p12),
          topRight: Radius.circular(Dimens.p12),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p12,
        vertical: Dimens.p14,
      ),
      child: Row(
        children: [
          gapW28,
          Expanded(
            flex: 4,
            child: Text('Name / ID', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 2,
            child: Text('Group', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Contact Info',
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text('Balance', style: style, textAlign: TextAlign.start),
          ),
          Expanded(
            flex: 2,
            child: Text('Activity', style: style, textAlign: TextAlign.center),
          ),
          Expanded(
            flex: 1,
            child: Text('Status', style: style, textAlign: TextAlign.center),
          ),

          SizedBox(
            width: 46,
            child: Text('Actions', style: style, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}

class _CustomersTableFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final style = AppTextStyles.tableHeader;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: Dimens.p12),
      decoration: BoxDecoration(
        color: theme.primaryFooter,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.p12),
          bottomRight: Radius.circular(Dimens.p12),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 28, child: Text('0')),
          Expanded(
            flex: 4,
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
                  value: '1',
                  backgroundColor: theme.addButton.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 3, child: Text('', style: style)),
          Expanded(
            flex: 2,
            child: Text(
              '5 000',
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'активный: 2',
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(flex: 1, child: Text('', style: style)),
          SizedBox(
            width: 46,
            child: Text(
              'SAR',
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
