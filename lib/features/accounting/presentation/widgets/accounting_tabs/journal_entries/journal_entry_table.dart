import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/journal_entries/journal_entry_data.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class JournalEntryTable extends StatefulWidget {
  const JournalEntryTable({super.key});

  static const double checkboxWidth = 24;
  static const double debitWidth = 100;
  static const double creditWidth = 100;
  static const double refWidth = 100;
  static const double typeWidth = 120;
  static const double entryNoWidth = 120;
  static const double dateWidth = 100;

  @override
  State<JournalEntryTable> createState() => _JournalEntryTableState();
}

class _JournalEntryTableState extends State<JournalEntryTable> {
  bool isTestCheckbox = false;

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
        isSelected: true,
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
        isSelected: false,
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
        isSelected: true,
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
        isSelected: false,
      ),
    ];

    return Column(
      children: [
        _buildToolbar(context),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            const double minTableWidth = 1000;
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
                        ...entries.map(
                          (e) => _JournalTableRow(
                            entry: e,
                            onSelectionChanged: (newValue) {
                              setState(() {
                                e.isSelected = newValue;
                              });
                            },
                          ),
                        ),
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
    final localizations = AppLocalizations.of(context);

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        spacing: 16,
        runSpacing: 12,
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
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
                      hintText: localizations.search_placeholder,
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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildToolBtn(
                    context,
                    LucideIcons.filter,
                    label: localizations.action_filter,
                  ),
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
    final localizations = AppLocalizations.of(context);

    return Container(
      color: theme.error.withValues(alpha: 0.05),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          SizedBox(
            width: JournalEntryTable.checkboxWidth,
            child: Icon(LucideIcons.check, size: 14, color: theme.textPrimary),
          ),
          _cellTitle(
            theme,
            localizations.column_debit,
            width: JournalEntryTable.debitWidth,
            textAlign: TextAlign.center,
          ),
          _cellTitle(
            theme,
            localizations.column_credit,
            width: JournalEntryTable.creditWidth,
            textAlign: TextAlign.center,
          ),
          _cellTitle(
            theme,
            localizations.column_ref,
            width: JournalEntryTable.refWidth,
          ),
          Expanded(child: _cellTitle(theme, localizations.description)),
          _cellTitle(
            theme,
            localizations.type,
            width: JournalEntryTable.typeWidth,
          ),
          _cellTitle(
            theme,
            localizations.column_entry_no,
            width: JournalEntryTable.entryNoWidth,
          ),
          _cellTitle(
            theme,
            localizations.date,
            width: JournalEntryTable.dateWidth,
          ),
        ],
      ),
    );
  }

  Widget _buildTableFooter(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      color: theme.primaryFooter,
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 14, right: 90),
      child: Row(
        children: [
          SizedBox(
            width: JournalEntryTable.checkboxWidth,
            child: Text(
              '0',
              textAlign: TextAlign.center,
              style: AppTextStyles.button.copyWith(color: theme.textWhite),
            ),
          ),
          SizedBox(
            width: JournalEntryTable.debitWidth,
            child: Text(
              '104 270',
              textAlign: TextAlign.center,
              style: AppTextStyles.button.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: theme.success,
              ),
            ),
          ),
          SizedBox(
            width: JournalEntryTable.creditWidth,
            child: Text(
              '104 270',
              textAlign: TextAlign.center,
              style: AppTextStyles.button.copyWith(
                fontWeight: FontWeight.w900,
                fontSize: 15,
                color: theme.error,
              ),
            ),
          ),
          const SizedBox(width: JournalEntryTable.refWidth),
          Expanded(
            child: Text(
              localizations.statusSummary(7, 2, 1),
              style: AppTextStyles.label.copyWith(color: theme.textSecondary),
            ),
          ),
          const SizedBox(width: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: theme.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      localizations.label_count,
                      style: AppTextStyles.label.copyWith(
                        color: theme.textSecondary,
                      ),
                    ),
                    Text(
                      '10',
                      style: AppTextStyles.label.copyWith(
                        color: theme.textWhite,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 46),
              AccCheckbox(
                size: 24,
                value: true,
                onChanged: (_) {},
                color: theme.successText,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cellTitle(
    AppColorExtension colors,
    String text, {
    double? width,
    TextAlign? textAlign,
  }) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        textAlign: textAlign,
        style: AppTextStyles.bodySmallBold.copyWith(color: colors.textPrimary),
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
            Text(
              label,
              style: AppTextStyles.bodySmall.copyWith(color: theme.textPrimary),
            ),
          ],
        ],
      ),
    );
  }
}

class _JournalTableRow extends StatefulWidget {
  final JournalEntry entry;
  final ValueChanged<bool> onSelectionChanged;

  const _JournalTableRow({
    required this.entry,
    required this.onSelectionChanged,
  });

  @override
  State<_JournalTableRow> createState() => _JournalTableRowState();
}

class _JournalTableRowState extends State<_JournalTableRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          color: _isHovered ? theme.gray50 : theme.white,
          border: Border(top: BorderSide(color: theme.border)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          children: [
            AccCheckbox(
              value: widget.entry.isSelected,
              color: theme.successText.withValues(alpha: 0.8),
              onChanged: (newValue) => widget.onSelectionChanged(newValue),
            ),
            _cellText(
              widget.entry.debit,
              width: JournalEntryTable.debitWidth,
              color: theme.successText,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
            ),
            _cellText(
              widget.entry.credit,
              width: JournalEntryTable.creditWidth,
              color: theme.errorText,
              textAlign: TextAlign.center,
              weight: FontWeight.w600,
            ),
            _cellText(
              widget.entry.ref,
              width: JournalEntryTable.refWidth,
              color: theme.textSecondary,
            ),
            Expanded(
              child: _cellText(
                widget.entry.description,
                color: theme.textPrimary,
              ),
            ),
            _buildStatusBadge(widget.entry.type, widget.entry.typeColor),
            _cellText(
              widget.entry.entryNo,
              width: JournalEntryTable.entryNoWidth,
              color: theme.textTertiary,
            ),
            _cellText(
              widget.entry.date,
              width: JournalEntryTable.dateWidth,
              color: theme.textTertiary,
            ),
          ],
        ),
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
      width: JournalEntryTable.typeWidth,
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
            style: AppTextStyles.caption.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
