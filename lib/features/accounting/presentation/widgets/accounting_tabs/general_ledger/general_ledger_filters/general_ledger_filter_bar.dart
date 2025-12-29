import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GeneralLedgerFilterBar extends StatelessWidget {
  const GeneralLedgerFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Wrap(
      spacing: 12, // Расстояние между элементами по горизонтали
      runSpacing: 12, // Расстояние между строками при переносе
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // --- Группа селекторов ---
        _buildDropdown(context, LucideIcons.building2, 'Main Company'),
        _buildDropdown(context, LucideIcons.book, 'Main Book'),
        _buildDropdown(context, LucideIcons.target, 'All Cost Centers'),
        _buildDropdown(context, LucideIcons.folder, 'All Projects'),
        _buildInput(context, 'Voucher No'),

        // Вертикальный разделитель (скрывается на мобильных, если нужно)
        _buildDivider(theme),

        // --- Группа Даты ---
        _buildDateRange(context),

        _buildDivider(theme),

        // --- Группа инструментов ---
        _buildIconButton(
          context,
          LucideIcons.palette,
          color: theme.successText,
        ),
        _buildIconButton(context, LucideIcons.fileSpreadsheet),
        _buildIconButton(context, LucideIcons.fileText),
        _buildIconButton(context, LucideIcons.printer),
      ],
    );
  }

  // Виджет выпадающего списка
  Widget _buildDropdown(BuildContext context, IconData icon, String label) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: theme.textSecondary),
          const SizedBox(width: 8),
          Text(label, style: AppTextStyles.bodyMedium),
          const SizedBox(width: 4),
          Icon(LucideIcons.chevronDown, size: 14, color: theme.textSecondary),
        ],
      ),
    );
  }

  // Виджет выбора дат
  Widget _buildDateRange(BuildContext context) {
    final theme = context.theme.appColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildDateTile(context, '2025-12-01'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Icon(
            LucideIcons.arrowRight,
            size: 14,
            color: theme.textSecondary,
          ),
        ),
        _buildDateTile(context, '2025-12-29'),
      ],
    );
  }

  Widget _buildDateTile(BuildContext context, String date) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.calendar, size: 16, color: theme.textSecondary),
          const SizedBox(width: 8),
          Text(date, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }

  // Маленькие кнопки инструментов (печать, экспорт)
  Widget _buildIconButton(BuildContext context, IconData icon, {Color? color}) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 18, color: color ?? theme.textPrimary),
    );
  }

  Widget _buildInput(BuildContext context, String hint) {
    final theme = context.theme.appColor;
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: theme.border),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        hint,
        style: AppTextStyles.bodyMedium.copyWith(color: theme.textSecondary),
      ),
    );
  }

  Widget _buildDivider(AppColorExtension theme) {
    return Container(
      height: 24,
      width: 1,
      color: theme.border,
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
