import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/acc_badge.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/widgets/app_avatar.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class CustomersTableView extends StatefulWidget {
  final List<Customer> customers;

  const CustomersTableView({super.key, required this.customers});

  @override
  State<CustomersTableView> createState() => _CustomersTableViewState();
}

class _CustomersTableViewState extends State<CustomersTableView> {
  final Set<String> _selectedIds = {};

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

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
          ...widget.customers.map(
            (customer) => CustomersTableRow(
              customer: customer,
              isSelected: _selectedIds.contains(customer.id),
              onChanged: () => _toggleSelection(customer.id),
            ),
          ),
          _CustomersTableFooter(
            customers: widget.customers,
            selectedCount: _selectedIds.length,
          ),
        ],
      ),
    );
  }
}

class CustomersTableRow extends StatefulWidget {
  final Customer customer;
  final bool isSelected;
  final VoidCallback onChanged;

  const CustomersTableRow({
    super.key,
    required this.customer,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  State<CustomersTableRow> createState() => _CustomersTableHeader();
}

class _CustomersTableHeader extends State<CustomersTableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onChanged,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected
                ? theme.primaryLight.withValues(alpha: 0.8)
                : (_isHovered
                      ? theme.primaryLight.withValues(alpha: 0.8)
                      : theme.white),
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
                child: Center(
                  child: AccCheckbox(
                    value: widget.isSelected,
                    color: theme.successText.withValues(alpha: 0.8),
                    onChanged: (_) => widget.onChanged(),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    gapW6,
                    AppAvatar(initials: 'CA', radius: 14),
                    gapW8,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.customer.name,
                          style: AppTextStyles.tableHeader.copyWith(
                            color: theme.textPrimary,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        gapH4,
                        Text(
                          widget.customer.id,
                          style: AppTextStyles.caption.copyWith(
                            color: theme.textSecondary,
                            height: 1.0,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _buildTypeBadge(theme, widget.customer.group),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          LucideIcons.phone,
                          size: 12,
                          color: theme.textSecondary,
                        ),
                        gapW6,
                        Flexible(
                          child: Text(
                            widget.customer.phone,
                            style: AppTextStyles.tableHeader.copyWith(
                              color: theme.textPrimary,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          LucideIcons.mapPin,
                          size: 12,
                          color: theme.textSecondary,
                        ),
                        gapW6,
                        Flexible(
                          child: Text(
                            widget.customer.city,
                            style: AppTextStyles.caption.copyWith(
                              color: theme.textTertiary,
                              height: 1.2,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatNum(widget.customer.balance),
                      style: AppTextStyles.h4.copyWith(
                        color: theme.successText,
                        height: 1.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    gapH4,
                    Text(
                      formatNum(widget.customer.limit),
                      style: AppTextStyles.caption.copyWith(
                        color: theme.textSecondary,
                        height: 1.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formatNum(widget.customer.lastActivityAmount),
                      style: AppTextStyles.h4.copyWith(
                        color: theme.successText,
                        height: 1.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    gapH4,
                    Text(
                      widget.customer.lastActivityDate,
                      style: AppTextStyles.caption.copyWith(
                        color: theme.textSecondary,
                        height: 1.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _buildStatusBadge(theme, widget.customer.isActive),
                ),
              ),
              SizedBox(
                width: 46,
                child: Icon(
                  LucideIcons.moreHorizontal,
                  color: theme.textTertiary,
                ),
              ),
            ],
          ),
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

  Widget _buildStatusBadge(AppColorExtension colors, bool status) {
    final isActive = status == true;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p8,
        vertical: Dimens.p4,
      ),
      decoration: BoxDecoration(
        color: isActive
            ? colors.successText.withValues(alpha: 0.08)
            : colors.infoText.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(Dimens.p6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              'Active',
              style: AppTextStyles.caption.copyWith(
                color: isActive ? colors.successText : colors.infoText,
                height: 1.0,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          gapW2,
          Icon(LucideIcons.check, size: 10, color: colors.successText),
        ],
      ),
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
          SizedBox(
            width: 28,
            child: Icon(LucideIcons.check, size: 16, color: theme.gray600),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                localizations.labelNameId,
                style: style,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelGroup,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              localizations.contactInfo,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.column_balance,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelActivity,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.status,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),

          SizedBox(
            width: 46,
            child: Text(
              localizations.actions,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomersTableFooter extends StatelessWidget {
  final List<Customer> customers;
  final int selectedCount;

  const _CustomersTableFooter({
    required this.customers,
    required this.selectedCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader;

    final totalBalance = customers.fold<double>(
      0,
      (sum, item) => sum + item.balance,
    );

    final totalLastActivityAmount = customers.fold<double>(
      0,
      (sum, item) => sum + item.lastActivityAmount,
    );

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
          SizedBox(
            width: 28,
            child: Text(
              selectedCount.toString(),
              style: AppTextStyles.buttonLarge.copyWith(color: theme.textWhite),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                gapW8,
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
              formatNum(totalBalance),
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              formatNum(totalLastActivityAmount),
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  localizations.labelActiveWithColon,
                  style: AppTextStyles.caption.copyWith(color: theme.textWhite),
                ),
                const SizedBox(width: Dimens.p4),
                AccBadge(
                  fontSize: 14,
                  textColor: theme.success,
                  value: customers.length.toString(),
                  backgroundColor: theme.addButton.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
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
