import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/buttons/app_icon_button.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/tools/tools.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/invoices_mock_data.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/status_badge.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BillingTableView extends StatefulWidget {
  final List<Invoice> invoices;
  final String? activeFilter;

  const BillingTableView({
    super.key,
    required this.invoices,
    this.activeFilter,
  });

  @override
  State<BillingTableView> createState() => _BillingTableViewState();
}

class _BillingTableViewState extends State<BillingTableView> {
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
                        _BillingTableHeader(activeFilter: widget.activeFilter),

                        Divider(height: 1, color: theme.border),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget.invoices.length,
                          itemBuilder: (context, index) {
                            return BillingTableRow(
                              invoice: widget.invoices[index],
                              activeFilter: widget.activeFilter,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BillingTableRow extends StatefulWidget {
  final Invoice invoice;
  final String? activeFilter;

  const BillingTableRow({super.key, required this.invoice, this.activeFilter});

  @override
  State<BillingTableRow> createState() => _BillingTableRowState();
}

class _BillingTableRowState extends State<BillingTableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: InkWell(
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
                    Icon(
                      LucideIcons.fileText,
                      size: 16,
                      color: theme.textSecondary,
                    ),
                    gapW6,
                    Flexible(
                      child: Text(
                        widget.invoice.invoiceNumber,
                        style: AppTextStyles.bodyMediumBold.copyWith(
                          color: theme.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.building,
                      size: 16,
                      color: theme.textSecondary,
                    ),
                    gapW6,
                    Flexible(
                      child: Text(
                        widget.invoice.tenantName,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _buildTypeBadge(theme, widget.invoice),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.invoice.period,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: theme.textSecondary,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  formatNum(widget.invoice.amount),
                  style: AppTextStyles.h4.copyWith(
                    color: theme.textPrimary,
                    height: 1.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.calendar,
                      size: 16,
                      color: theme.textSecondary,
                    ),
                    gapW6,
                    Flexible(
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(widget.invoice.dueDate),
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: theme.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: StatusBadge(status: widget.invoice.status),
                ),
              ),
              SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIconButton(
                      icon: LucideIcons.view,
                      onTap: () {},
                      iconSize: 16,
                    ),
                    gapW2,
                    AppIconButton(
                      icon: LucideIcons.download,
                      iconSize: 16,
                      onTap: () {},
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

  Widget _buildTypeBadge(AppColorExtension colors, Invoice invoice) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p8,
        vertical: Dimens.p4,
      ),
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(Dimens.p6),
        border: Border.all(color: colors.border, width: 1),
      ),
      child: Text(
        invoice.plan.name.toString(),
        style: AppTextStyles.caption.copyWith(
          color: colors.textTertiary,
          height: 1.0,
        ),
      ),
    );
  }
}

class _BillingTableHeader extends StatelessWidget {
  final String? activeFilter;

  const _BillingTableHeader({this.activeFilter});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final style = AppTextStyles.tableHeader.copyWith(color: theme.gray600);

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
              localizations.labelInvoiceNumber,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              localizations.columnTenant,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.columnPlan,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelPeriod,
              style: style,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.amount,
              style: style,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              localizations.labelDueDate,
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
