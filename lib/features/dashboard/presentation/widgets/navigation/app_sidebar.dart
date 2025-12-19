import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';

class AppSidebar extends StatelessWidget {
  final bool isExpanded;
  final int selectedIndex;
  final ValueChanged<int>? onSelect;

  const AppSidebar({
    super.key,
    required this.isExpanded,
    required this.selectedIndex,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: AppDesign.sidebarDuration,
      curve: AppDesign.defaultCurve,
      width: isExpanded
          ? AppDesign.sidebarExpandedWidth
          : AppDesign.sidebarCollapsedWidth,
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(
          right: BorderSide(color: theme.dividerColor, width: 0.8),
        ),
      ),
      child: Column(
        children: [
          _buildLogo(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: _menuData.map((data) {
                  return _MenuItem(
                    index: data.index,
                    title: data.title,
                    icon: data.icon,
                    selectedIndex: selectedIndex,
                    isExpanded: isExpanded,
                    onTap: onSelect,
                  );
                }).toList(),
              ),
            ),
          ),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppColorExtension>();
    final successColor = themeColors?.success ?? Colors.green;

    return Container(
      height: AppDesign.headerHeight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: isExpanded
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          Icon(Icons.blur_on, color: successColor, size: 32),
          if (isExpanded) ...[
            const SizedBox(width: 12),
            Expanded(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: 1.0,
                child: Text(
                  'ERP Max',
                  style: AppTextStyles.h2.copyWith(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    if (!isExpanded) return const SizedBox(height: 16);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: 1.0,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(
              context,
            ).colorScheme.surfaceVariant.withOpacity(0.5),
            borderRadius: BorderRadius.circular(AppDesign.cardRadius),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Need Help?',
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 36),
                  side: BorderSide(color: Theme.of(context).dividerColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
                  ),
                ),
                child: const Text('Support', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuItem extends StatelessWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String title;
  final bool isExpanded;
  final ValueChanged<int>? onTap;

  const _MenuItem({
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.title,
    required this.isExpanded,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).extension<AppColorExtension>();
    final bool isSelected = selectedIndex == index;

    // Цвета из темы (возвращены как было)
    final activeBg =
        themeColors?.sidebarActiveBg ?? Colors.blue.withOpacity(0.1);
    final activeIcon = themeColors?.sidebarActiveIcon ?? Colors.blue;
    final activeText = themeColors?.sidebarActiveText ?? Colors.blue;
    final inactiveText = themeColors?.sidebarInactiveText ?? Colors.grey;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap != null ? () => onTap!(index) : null,
          borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
          child: AnimatedContainer(
            duration: AppDesign.fastDuration,
            height: 48,
            padding: EdgeInsets.symmetric(horizontal: isExpanded ? 12 : 0),
            decoration: BoxDecoration(
              color: isSelected ? activeBg : Colors.transparent,
              borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
            ),
            child: Row(
              mainAxisAlignment: isExpanded
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: isSelected ? activeIcon : inactiveText,
                  size: AppDesign.iconSize,
                ),
                if (isExpanded) ...[
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      title,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: isSelected ? activeText : inactiveText,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuData {
  final int index;
  final String title;
  final IconData icon;
  const _MenuData(this.index, this.title, this.icon);
}

// Порядок строго соответствует branches в AppRouter
const List<_MenuData> _menuData = [
  _MenuData(0, 'Dashboard', Icons.grid_view_rounded),
  _MenuData(1, 'Accounting', Icons.calculate_outlined),
  _MenuData(2, 'Inventory', Icons.layers_outlined),
  _MenuData(3, 'Sales', Icons.shopping_cart_outlined),
  _MenuData(4, 'Customer Management', Icons.people_outline_rounded),
  _MenuData(5, 'Real Estate Asset', Icons.domain_rounded),
  _MenuData(6, 'POS', Icons.crop_free_rounded),
  _MenuData(7, 'Exchange & Remittances', Icons.swap_horiz_rounded),
  _MenuData(8, 'Purchases', Icons.shopping_bag_outlined),
  _MenuData(9, 'Manufacturing', Icons.analytics_outlined),
  _MenuData(10, 'HR Management', Icons.manage_accounts_outlined),
  _MenuData(11, 'SaaS Control', Icons.workspace_premium_outlined),
  _MenuData(12, 'AI Analytics', Icons.psychology_outlined),
  _MenuData(13, 'authPages', Icons.lock_outline_rounded),
  _MenuData(14, 'Settings', Icons.settings_outlined),
];
