import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/funds_banks/widgets/acc_badge.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/parties/parties_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class PartiesBoardSwitcher extends StatefulWidget {
  const PartiesBoardSwitcher({super.key});

  @override
  State<PartiesBoardSwitcher> createState() => _PartiesBoardSwitcherState();
}

class _PartiesBoardSwitcherState extends State<PartiesBoardSwitcher> {
  PartiesType currentType = PartiesType.customers;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.theme.appColor.border),
        borderRadius: BorderRadius.circular(Dimens.p12),
      ),
      padding: EdgeInsets.all(Dimens.p4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _PartiesSwitcherTab(
            isActive: currentType == PartiesType.customers,
            icon: LucideIcons.users,
            count: '156',
            label: 'Castomers',
            onTap: () => setState(() => currentType = PartiesType.customers),
          ),
          _PartiesSwitcherTab(
            isActive: currentType == PartiesType.suppliers,
            icon: LucideIcons.users,
            count: '45',
            label: 'Suppliers',
            onTap: () => setState(() => currentType = PartiesType.suppliers),
          ),
        ],
      ),
    );
  }
}

class _PartiesSwitcherTab extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final String count;

  const _PartiesSwitcherTab({
    required this.isActive,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? theme.white : Colors.transparent,
          borderRadius: BorderRadius.circular(Dimens.p10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.p12,
          vertical: Dimens.p6,
        ),
        child: Row(
          children: [
            Icon(icon, color: theme.textSecondary, size: 16),
            gapW8,
            Text(
              label,
              style: AppTextStyles.tableHeader.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.textPrimary,
                height: 1.2,
              ),
            ),
            gapW8,
            AccBadge(
              value: '156',
              isBold: true,
              backgroundColor: theme.infoText.withValues(alpha: 0.1),
            ),
          ],
        ),
      ),
    );
  }
}
