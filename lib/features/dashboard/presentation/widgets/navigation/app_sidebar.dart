import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
    final theme = context.theme.appColor;
    final menuItems = _menuData(context);

    return AnimatedContainer(
      duration: AppDesign.sidebarDuration,
      curve: AppDesign.defaultCurve,
      width: isExpanded
          ? AppDesign.sidebarExpandedWidth
          : AppDesign.sidebarCollapsedWidth,
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(
          right: BorderSide(
            color: theme.textDisabled.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          _buildLogo(context),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: menuItems.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final item = menuItems[index];
                final l10n = AppLocalizations.of(context);

                return _MenuItem(
                  index: item.index,
                  title: item.title(l10n),
                  icon: item.icon,
                  selectedIndex: selectedIndex,
                  isExpanded: isExpanded,
                  onTap: (targetIndex) {
                    if (onSelect != null) onSelect!(targetIndex);
                  },
                );
              },
            ),
          ),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    final theme = context.theme.appColor;

    if (!isExpanded) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.sidebarActiveBgBase,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'ERP',
                style: AppTextStyles.h2.copyWith(
                  color: theme.success,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 4),
            _buildToggleButton(context),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2D3D52),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ERP ',
                style: AppTextStyles.h2.copyWith(
                  color: theme.success,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                'MAX',
                style: AppTextStyles.h2.copyWith(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Quality you can trust',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          _buildToggleButton(context),
        ],
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    final theme = context.theme.appColor;

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
              color: theme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    final theme = context.theme.appColor;

    if (!isExpanded) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Icon(Icons.help_outline, color: theme.textDisabled, size: 20),
      );
    }

    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(AppDesign.cardRadius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'v1.0.2',
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.textDisabled,
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
                side: BorderSide(
                  color: theme.primaryDark.withValues(alpha: 0.2),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).support,
                style: AppTextStyles.bodySmall.copyWith(fontSize: 11),
              ),
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
    final theme = context.theme.appColor;
    final bool isSelected = widget.selectedIndex == widget.index;

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
                          colors: [
                            theme.sidebarActiveBgLight,
                            theme.sidebarActiveBgBase,
                          ],
                        )
                      : null,
                  color: !isSelected && _isHovered
                      ? theme.textDisabled.withValues(alpha: 0.08)
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
                      color: isSelected ? theme.success : theme.textSecondary,
                      size: 20,
                    ),
                    if (widget.isExpanded) ...[
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          widget.title,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: isSelected
                                ? theme.textPrimary
                                : theme.textSecondary,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w500,
                            letterSpacing: 1.2,
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
                    color: theme.success,
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
  final String Function(AppLocalizations) title;
  final IconData icon;

  _MenuData(this.index, this.title, this.icon);
}

List<_MenuData> _menuData(BuildContext context) {
  return [
    _MenuData(0, (l) => l.menuDashboard, LucideIcons.layoutGrid),
    _MenuData(1, (l) => l.menuAccounting, LucideIcons.calculator),
    _MenuData(2, (l) => l.menuInventory, LucideIcons.package),
    _MenuData(3, (l) => l.menuSales, LucideIcons.shoppingCart),
    _MenuData(4, (l) => l.menuCustomerManagement, LucideIcons.users),
    _MenuData(5, (l) => l.menuRealEstate, LucideIcons.building2),
    _MenuData(6, (l) => l.menuPOS, LucideIcons.scan),
    _MenuData(7, (l) => l.menuExchange, LucideIcons.arrowLeftRight),
    _MenuData(8, (l) => l.menuPurchases, LucideIcons.shoppingBag),
    _MenuData(9, (l) => l.menuManufacturing, LucideIcons.factory),
    _MenuData(10, (l) => l.menuHR, LucideIcons.userCog),
    _MenuData(11, (l) => l.menuSaaS, LucideIcons.crown),
    _MenuData(12, (l) => l.menuAI, LucideIcons.brain),
    _MenuData(13, (l) => l.menuAuthPages, LucideIcons.lock),
    _MenuData(14, (l) => l.menuSettings, LucideIcons.settings),
  ];
}
