import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/features/dashboard/presentation/data/models/menu_data.dart';

class AppSidebar extends StatelessWidget {
  final bool isExpanded;
  final int selectedIndex;
  final ValueChanged<int>? onSelect;
  final VoidCallback onToggle;

  const AppSidebar({
    super.key,
    required this.isExpanded,
    required this.selectedIndex,
    required this.onToggle,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppColorExtension.of(context);
    final menuItems = MenuData.getAllMenuItems();

    return AnimatedContainer(
      duration: AppDesign.sidebarDuration,
      curve: AppDesign.defaultCurve,
      width: isExpanded
          ? AppDesign.sidebarExpandedWidth
          : AppDesign.sidebarCollapsedWidth,
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: Border(
          right: BorderSide(
            color: colors.textDisabled.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildLogo(context, colors),
          Divider(
            height: 1,
            thickness: 1,
            color: colors.textDisabled.withValues(alpha: 0.05),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                final item = menuItems[index];
                return _MenuItem(
                  index: index,
                  title: item.title,
                  icon: item.icon,
                  selectedIndex: selectedIndex,
                  isExpanded: isExpanded,
                  onTap: onSelect,
                );
              },
            ),
          ),
          _buildBottomSection(context, colors),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context, AppColorExtension colors) {
    return Container(
      width: double.infinity,
      height: AppDesign.headerHeight,
      padding: EdgeInsets.symmetric(horizontal: isExpanded ? 16 : 0),
      child: isExpanded
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.blur_on, color: colors.success, size: 28),
                    const SizedBox(width: 10),
                    Text(
                      'ERP Max',
                      style: AppTextStyles.h2.copyWith(
                        fontSize: 16,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ],
                ),
                _buildToggleButton(colors),
              ],
            )
          : Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.blur_on, color: colors.success, size: 28),
                Positioned(bottom: 4, child: _buildToggleButton(colors)),
              ],
            ),
    );
  }

  Widget _buildToggleButton(AppColorExtension colors) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onToggle,
        borderRadius: BorderRadius.circular(6),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: AnimatedRotation(
            turns: isExpanded ? 0 : 0.5,
            duration: AppDesign.fastDuration,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 14,
              color: colors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context, AppColorExtension colors) {
    if (!isExpanded) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Icon(Icons.help_outline, color: colors.textDisabled, size: 20),
      );
    }

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.backgroundLight,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'v1.0.2',
            style: AppTextStyles.bodySmall.copyWith(
              color: colors.textDisabled,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(0, 32),
                side: BorderSide(color: colors.primaryDark.withOpacity(0.2)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: const Text('Support', style: TextStyle(fontSize: 11)),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final IconData icon;
  final String title;
  final bool isExpanded;
  final ValueChanged<int>? onTap;

  const _MenuItem({
    super.key,
    required this.index,
    required this.selectedIndex,
    required this.icon,
    required this.title,
    required this.isExpanded,
    this.onTap,
  });

  @override
  State<_MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<_MenuItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppColorExtension.of(context);
    final bool isSelected = widget.selectedIndex == widget.index;
    final Color activeBgBase = const Color(0xFF12203A);
    final Color activeBgLight = const Color(0xFF1A2D4D);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: Stack(
          children: [
            InkWell(
              onTap: widget.onTap != null
                  ? () => widget.onTap!(widget.index)
                  : null,
              borderRadius: BorderRadius.circular(10),
              hoverColor: Colors.transparent,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 50,
                padding: EdgeInsets.symmetric(
                  horizontal: widget.isExpanded ? 16 : 0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: isSelected
                      ? LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [activeBgLight, activeBgBase],
                        )
                      : null,
                  color: !isSelected && _isHovered
                      ? colors.textDisabled.withValues(alpha: 0.08)
                      : (isSelected ? null : Colors.transparent),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.25),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: widget.isExpanded
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      color: isSelected ? colors.success : colors.textSecondary,
                      size: 24,
                    ),
                    if (widget.isExpanded) ...[
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : colors.textPrimary,
                            fontSize: 14,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w500,
                            letterSpacing: 0.2,
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
            if (isSelected)
              Positioned(
                left: 0,
                top: 12,
                bottom: 12,
                child: Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: colors.success,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
              ),
          ],
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
