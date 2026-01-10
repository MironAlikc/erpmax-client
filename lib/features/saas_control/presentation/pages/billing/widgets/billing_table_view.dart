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
import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart'; // Ваша новая таблица

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
  Set<String> _selectedInvoiceIds = {};

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    // 1. Определяем конфигурацию колонок
    final List<ErpMaxColumn<Invoice>> columns = [
      ErpMaxColumn(
        id: 'invoice_number',
        title: localizations.labelInvoiceNumber,
        weight: 3.0,
        valueGetter: (i) => i.invoiceNumber,
        customCell: (invoice) => Row(
          children: [
            Icon(LucideIcons.fileText, size: 16, color: theme.textSecondary),
            gapW6,
            Text(
              invoice.invoiceNumber,
              style: AppTextStyles.bodyMediumBold.copyWith(
                color: theme.textPrimary,
              ),
            ),
          ],
        ),
      ),
      ErpMaxColumn(
        id: 'tenant',
        title: localizations.columnTenant,
        weight: 3.0,
        valueGetter: (i) => i.tenantName,
        customCell: (invoice) => Row(
          children: [
            Icon(LucideIcons.building, size: 16, color: theme.textSecondary),
            gapW6,
            Flexible(
              child: Text(
                invoice.tenantName,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
      ErpMaxColumn(
        id: 'plan',
        title: localizations.columnPlan,
        weight: 2.0,
        valueGetter: (i) => i.plan.name.toString(),
        customCell: (invoice) => Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.p8,
            vertical: Dimens.p4,
          ),
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(Dimens.p6),
            border: Border.all(color: theme.border),
          ),
          child: Text(
            invoice.plan.name.toString(),
            style: AppTextStyles.caption.copyWith(
              color: theme.textTertiary,
              height: 1.0,
            ),
          ),
        ),
      ),
      ErpMaxColumn(
        id: 'period',
        title: localizations.labelPeriod,
        weight: 2.0,
        valueGetter: (i) => i.period,
      ),
      ErpMaxColumn(
        id: 'amount',
        title: localizations.amount,
        weight: 2.0,
        textAlign: TextAlign.center,
        valueGetter: (i) => i.amount.toString(),
        customCell: (invoice) => Text(
          formatNum(invoice.amount),
          style: AppTextStyles.h4.copyWith(
            color: theme.textPrimary,
            height: 1.0,
          ),
        ),
      ),
      ErpMaxColumn(
        id: 'due_date',
        title: localizations.labelDueDate,
        weight: 2.0,
        valueGetter: (i) => DateFormat('yyyy-MM-dd').format(i.dueDate),
        customCell: (invoice) => Row(
          children: [
            Icon(LucideIcons.calendar, size: 16, color: theme.textSecondary),
            gapW6,
            Text(DateFormat('yyyy-MM-dd').format(invoice.dueDate)),
          ],
        ),
      ),
      ErpMaxColumn(
        id: 'status',
        title: localizations.status,
        weight: 2.0,
        valueGetter: (i) => i.status.toString(),
        customCell: (invoice) => StatusBadge(status: invoice.status),
      ),
      ErpMaxColumn(
        id: 'actions',
        title: localizations.actions,
        weight: 1.5,
        textAlign: TextAlign.center,
        isSortable: false,
        hasFilter: false,
        customCell: (invoice) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIconButton(icon: LucideIcons.view, onTap: () {}, iconSize: 16),
            gapW2,
            AppIconButton(
              icon: LucideIcons.download,
              iconSize: 16,
              onTap: () {},
            ),
          ],
        ),
      ),
    ];

    // 2. Возвращаем новую универсальную таблицу
    return Padding(
      padding: const EdgeInsets.only(bottom: Dimens.p24),
      child: UniversalErpTable<Invoice>(
        items: widget.invoices,
        columns: columns,
        minWidth: 1000,
        idGetter: (invoice) => invoice.invoiceNumber, // ID инвойса
        selectedIds: _selectedInvoiceIds,
        onSelectionChanged: (newSelection) {
          setState(() => _selectedInvoiceIds = newSelection);
        },
        // Пример итогов в футере
        totals: {
          'invoice_number': 'Total: ${widget.invoices.length}',
          'amount': formatNum(
            widget.invoices.fold(0, (sum, i) => sum + i.amount.toInt()),
          ),
        },
        onRowTap: (invoice) {
          debugPrint("Opening invoice: ${invoice.invoiceNumber}");
        },
      ),
    );
  }
}
