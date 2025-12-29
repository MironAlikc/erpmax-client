import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/journal_entries/journal_entry_data.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class JournalEntryTable extends StatelessWidget {
  const JournalEntryTable({super.key});

  static const double checkboxWidth = 24;
  static const double debitWidth = 100;
  static const double creditWidth = 100;
  static const double refWidth = 100;
  static const double typeWidth = 120;
  static const double entryNoWidth = 120;
  static const double dateWidth = 100;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final List<JournalEntry> entries = [
      JournalEntry(
        debit: '5 000',
        credit: '5 000',
        ref: 'REF-001',
        description: 'Office Rent Payment',
        type: 'Expense Entry',
        entryNo: 'JV-2024-001',
        date: '2024-03-20',
        typeColor: theme.warningText,
      ),
      JournalEntry(
        debit: '12 500',
        credit: '12 500',
        ref: 'INV-001',
        description: 'HP فاتورة مبيعات - لابتوب',
        type: 'Sales Entry',
        entryNo: 'JV-2024-002',
        date: '2024-03-19',
        typeColor: theme.successText,
      ),
      JournalEntry(
        debit: '5 000',
        credit: '5 000',
        ref: 'REF-001',
        description: 'Office Rent Payment',
        type: 'Expense Entry',
        entryNo: 'JV-2024-001',
        date: '2024-03-20',
        typeColor: theme.warningText,
      ),
      JournalEntry(
        debit: '12 500',
        credit: '12 500',
        ref: 'INV-001',
        description: 'HP فاتورة مبيعات - لابتوب',
        type: 'Sales Entry',
        entryNo: 'JV-2024-002',
        date: '2024-03-19',
        typeColor: theme.successText,
      ),
    ];

    return Column(
      children: [
        // 1. Тулбар
        _buildToolbar(context),
        const SizedBox(height: 16),

        // 2. Таблица с адаптивной шириной
        LayoutBuilder(
          builder: (context, constraints) {
            // Минимальная ширина таблицы
            const double minTableWidth = 1000;
            // Доступная ширина
            final double availableWidth = constraints.maxWidth;

            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: theme.border),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: minTableWidth,
                      maxWidth: availableWidth > minTableWidth
                          ? availableWidth
                          : minTableWidth,
                    ),
                    child: Column(
                      children: [
                        _buildTableHeader(context),
                        ...entries.map((e) => _buildTableRow(context, e)),
                        _buildTableFooter(context),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildToolbar(BuildContext context) {
    final theme = context.theme.appColor;

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // 1. Поиск
          Container(
            width: 350,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: theme.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: theme.border),
            ),
            child: Row(
              children: [
                Icon(LucideIcons.search, size: 18, color: theme.textSecondary),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search entries...',
                      hintStyle: AppTextStyles.bodyMedium.copyWith(
                        color: theme.textSecondary,
                      ),
                      border: InputBorder.none,
                      isDense: true,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2. Кнопки
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildToolBtn(context, LucideIcons.filter, label: 'Filter'),
                  const SizedBox(width: 8),
                  _buildToolBtn(
                    context,
                    LucideIcons.palette,
                    iconColor: theme.successText,
                  ),
                  const SizedBox(width: 8),
                  _buildToolBtn(context, LucideIcons.fileSpreadsheet),
                  const SizedBox(width: 8),
                  _buildToolBtn(context, LucideIcons.printer),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      color: theme.border.withOpacity(0.2),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: checkboxWidth,
            child: const Icon(LucideIcons.check, size: 14),
          ),
          _cellTitle('Debit', width: debitWidth, textAlign: TextAlign.center),
          _cellTitle('Credit', width: creditWidth, textAlign: TextAlign.center),
          _cellTitle('Ref', width: refWidth),
          Expanded(child: _cellTitle('Description')),
          _cellTitle('Type', width: typeWidth),
          _cellTitle('Entry #', width: entryNoWidth),
          _cellTitle('Date', width: dateWidth),
        ],
      ),
    );
  }

  Widget _buildTableRow(BuildContext context, JournalEntry entry) {
    final theme = context.theme.appColor;

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(top: BorderSide(color: theme.border.withOpacity(0.5))),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: checkboxWidth,
            child: Checkbox(
              value: false,
              onChanged: (v) {},
              visualDensity: VisualDensity.compact,
            ),
          ),
          _cellText(
            entry.debit,
            width: debitWidth,
            color: theme.successText,
            textAlign: TextAlign.center,
            weight: FontWeight.bold,
          ),
          _cellText(
            entry.credit,
            width: creditWidth,
            color: theme.errorText,
            textAlign: TextAlign.center,
            weight: FontWeight.bold,
          ),
          _cellText(entry.ref, width: refWidth),
          Expanded(child: _cellText(entry.description)),
          _buildStatusBadge(entry.type, entry.typeColor),
          _cellText(entry.entryNo, width: entryNoWidth),
          _cellText(entry.date, width: dateWidth),
        ],
      ),
    );
  }

  Widget _buildTableFooter(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      color: const Color(0xFF0F172A),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: checkboxWidth,
            child: const Text(
              '0',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          SizedBox(
            width: debitWidth,
            child: Text(
              '104 270',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.successText,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          SizedBox(
            width: creditWidth,
            child: Text(
              '104 270',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: theme.errorText,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          const SizedBox(width: refWidth),

          Expanded(
            child: Text(
              '7 posted · 2 draft · 1 pending',
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 13,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Count: ',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                    Text(
                      '10',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: theme.successText,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  LucideIcons.check,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cellTitle(String text, {double? width, TextAlign? textAlign}) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: textAlign,
        style: AppTextStyles.bodySmall.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _cellText(
    String text, {
    double? width,
    Color? color,
    TextAlign? textAlign,
    FontWeight? weight,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: textAlign,
        style: AppTextStyles.bodyMedium.copyWith(
          color: color,
          fontWeight: weight,
        ),
      ),
    );
  }

  Widget _buildStatusBadge(String text, Color color) {
    return SizedBox(
      width: typeWidth,
      child: UnconstrainedBox(
        alignment: Alignment.centerLeft,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToolBtn(
    BuildContext context,
    IconData icon, {
    String? label,
    Color? iconColor,
  }) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: iconColor ?? theme.textPrimary),
          if (label != null) ...[
            const SizedBox(width: 8),
            Text(label, style: AppTextStyles.bodySmall),
          ],
        ],
      ),
    );
  }
}
