import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/acc_badge.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_checkbox.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/accounting_header_btn.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SuppliersTableView extends StatefulWidget {
  final List<Supplier> suppliers;

  const SuppliersTableView({super.key, required this.suppliers});

  @override
  State<SuppliersTableView> createState() => _SuppliersTableViewState();
}

class _SuppliersTableViewState extends State<SuppliersTableView> {
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
      padding: EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(Dimens.p12),
        border: Border.all(width: 1, color: theme.border),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Suppliers List',
                style: AppTextStyles.h5.copyWith(
                  color: theme.textTertiary,
                  letterSpacing: 1.2,
                  height: 1.0,
                ),
              ),
              Spacer(),
              AccountingHeaderBtn(
                label: 'Add Supplier',
                icon: LucideIcons.plus,
                iconColor: theme.textSecondary,
                textColor: theme.textTertiary,
                color: theme.sidebarActiveBg,
                onTap: () {},
              ),
            ],
          ),
          gapH16,
          _SuppliersTableHeader(),
          ...widget.suppliers.map(
            (supplier) => SuppliersTableRow(
              supplier: supplier,
              isSelected: _selectedIds.contains(supplier.id),
              onChanged: () => _toggleSelection(supplier.id),
            ),
          ),
          _SuppliersTableFooter(
            suppliers: widget.suppliers,
            selectedCount: _selectedIds.length,
          ),
        ],
      ),
    );
  }
}

class SuppliersTableRow extends StatefulWidget {
  final Supplier supplier;
  final bool isSelected;
  final VoidCallback onChanged;

  const SuppliersTableRow({
    super.key,
    required this.supplier,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  State<SuppliersTableRow> createState() => _SuppliersTableRowState();
}

class _SuppliersTableRowState extends State<SuppliersTableRow> {
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
              start: BorderSide(width: 1, color: theme.border),
              end: BorderSide(width: 1, color: theme.border),
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
                flex: 3,
                child: Padding(
                  padding: EdgeInsetsGeometry.only(left: 8),
                  child: Text(
                    widget.supplier.accountNumber,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.textPrimary,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.supplier.name,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: theme.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _buildTypeBadge(theme, widget.supplier.type),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.supplier.city,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: theme.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.supplier.phoneNumber,
                  style: AppTextStyles.tableHeader.copyWith(
                    color: theme.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  formatNum(widget.supplier.balance),
                  style: AppTextStyles.h4.copyWith(
                    color: theme.successText,
                    height: 1.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
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
    final isCash = type == 'Company';

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
}

class _SuppliersTableHeader extends StatelessWidget {
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
        border: Border.all(width: 1, color: theme.border),
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
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                localizations.labelAccountNumber,
                style: style,
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelName,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.type,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelCity,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelPhoneNumber,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.column_balance,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 46,
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

class _SuppliersTableFooter extends StatelessWidget {
  final List<Supplier> suppliers;
  final int selectedCount;

  const _SuppliersTableFooter({
    required this.suppliers,
    required this.selectedCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final style = AppTextStyles.tableHeader;

    final totalBalance = suppliers.fold<double>(
      0,
      (sum, item) => sum + item.balance,
    );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: Dimens.p12),
      decoration: BoxDecoration(
        color: theme.primaryFooter,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(Dimens.p12),
          bottomRight: Radius.circular(Dimens.p12),
        ),
        border: BoxBorder.fromSTEB(
          bottom: BorderSide(width: 1, color: theme.border),
          start: BorderSide(width: 1, color: theme.border),
          end: BorderSide(width: 1, color: theme.border),
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
            flex: 3,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                gapH8,
                Text(
                  AppLocalizations.of(context).accountsCount,
                  style: AppTextStyles.caption.copyWith(color: theme.textWhite),
                ),
                const SizedBox(width: Dimens.p4),
                AccBadge(
                  fontSize: 14,
                  textColor: theme.textWhite,
                  value: suppliers.length.toString(),
                  backgroundColor: theme.addButton.withValues(alpha: 0.5),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(flex: 2, child: Text('', style: style)),
          Expanded(
            flex: 2,
            child: Text(
              formatNum(totalBalance),
              style: AppTextStyles.buttonLarge.copyWith(color: theme.success),
              textAlign: TextAlign.center,
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
