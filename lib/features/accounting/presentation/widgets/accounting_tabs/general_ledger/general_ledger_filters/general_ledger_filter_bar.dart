import 'package:erpmax_client/core/extensions/dropdown_ext.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/dropdowns/app_dropdown.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/acc_input.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum OrganizationType { main, branch, distribution }

enum BookType { main, tax, internal }

enum DeptType { centers, headquarters, sales, marketing, operations }

enum ProjectType { all, expansion, development, modernization }

class GeneralLedgerFilterBar extends StatefulWidget {
  const GeneralLedgerFilterBar({super.key});

  @override
  State<GeneralLedgerFilterBar> createState() => _GeneralLedgerFilterBarState();
}

class _GeneralLedgerFilterBarState extends State<GeneralLedgerFilterBar> {
  OrganizationType selectedOrg = OrganizationType.main;
  BookType selectedBook = BookType.main;
  DeptType selectedDept = DeptType.centers;
  ProjectType selectedProject = ProjectType.all;

  final _inputVoucherController = TextEditingController();

  @override
  void dispose() {
    _inputVoucherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        AppDropdown(
          value: selectedOrg,
          items: OrganizationType.values,
          itemLabelBuilder: (val) => val.label(context),
          leadingIcon: LucideIcons.building2,
          onChanged: (OrganizationType newValue) {
            setState(() {
              selectedOrg = newValue;
            });
          },
        ),
        AppDropdown(
          value: selectedBook,
          items: BookType.values,
          itemLabelBuilder: (val) => val.label(context),
          leadingIcon: LucideIcons.book,
          onChanged: (BookType newValue) {
            setState(() {
              selectedBook = newValue;
            });
          },
        ),
        AppDropdown(
          value: selectedDept,
          items: DeptType.values,
          itemLabelBuilder: (val) => val.label(context),
          leadingIcon: LucideIcons.target,
          onChanged: (DeptType newValue) {
            setState(() {
              selectedDept = newValue;
            });
          },
        ),
        AppDropdown(
          value: selectedProject,
          items: ProjectType.values,
          itemLabelBuilder: (val) => val.label(context),
          leadingIcon: LucideIcons.folder,
          onChanged: (ProjectType newValue) {
            setState(() {
              selectedProject = newValue;
            });
          },
        ),
        AccInput(
          hint: 'Voucher No',
          controller: _inputVoucherController,
          onChanged: (value) {},
          height: 10,
        ),

        _buildDivider(theme),

        _buildDateRange(context),

        _buildDivider(theme),

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

  Widget _buildDivider(AppColorExtension theme) {
    return Container(
      height: 24,
      width: 1,
      color: theme.border,
      margin: const EdgeInsets.symmetric(horizontal: 4),
    );
  }
}
