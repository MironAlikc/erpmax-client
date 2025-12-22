import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/design/app_design.dart';

class TopNavigationBar extends StatelessWidget {
  final bool isMobile;
  final bool isSidebarExpanded;
  final VoidCallback? onToggleSidebar;

  const TopNavigationBar({
    super.key,
    required this.isMobile,
    required this.isSidebarExpanded,
    this.onToggleSidebar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDesign.headerHeight,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 24),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border(bottom: BorderSide(color: AppColors.gray100, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildToggleButton(context),

          if (!isMobile) const SizedBox(width: 16),
          if (!isMobile)
            const Expanded(
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _QuickActionButton(
                        icon: Icons.groups_outlined,
                        label: "Customers",
                      ),
                      _QuickActionButton(
                        icon: Icons.shopping_cart_outlined,
                        label: "Sales",
                      ),
                      _QuickActionButton(
                        icon: Icons.local_mall_outlined,
                        label: "Purchases",
                      ),
                      _QuickActionButton(
                        icon: Icons.account_balance_wallet_outlined,
                        label: "Funds",
                      ),
                      _QuickActionButton(
                        icon: Icons.description_outlined,
                        label: "Journal",
                      ),
                    ],
                  ),
                ),
              ),
            )
          else
            const Spacer(),
          _UserSection(isMobile: isMobile),
        ],
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    if (isMobile) {
      return IconButton(
        icon: const Icon(Icons.menu, color: AppColors.textPrimary),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
    }

    return InkWell(
      onTap: onToggleSidebar,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: AnimatedRotation(
          turns: isSidebarExpanded ? 0 : 0.5,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          // child: const Icon(
          //   Icons.arrow_back_ios_new_rounded,
          //   color: AppColors.textPrimary,
          //   size: 20,
          // ),
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _QuickActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
        child: Container(
          width: 90,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.textPrimary, size: 22),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyles.labelStyle.copyWith(
                  fontSize: 11,
                  color: AppColors.gray500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserSection extends StatelessWidget {
  final bool isMobile;
  const _UserSection({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isMobile) ...[
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Good Morning",
                style: TextStyle(color: AppColors.gray400, fontSize: 11),
              ),
              Text(
                "07:22 AM",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          Text(
            "AR",
            style: AppTextStyles.bodyMediumBold.copyWith(fontSize: 13),
          ),
          const SizedBox(width: 20),
          const _NotificationBadge(),
          const SizedBox(width: 20),
          Container(height: 32, width: 1, color: AppColors.gray200),
          const SizedBox(width: 20),
        ],
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Ahmed Mohamed",
              style: AppTextStyles.bodyMediumBold.copyWith(fontSize: 13),
            ),
            Text(
              "System Admin",
              style: TextStyle(color: AppColors.gray400, fontSize: 11),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.gray100, width: 1),
          ),
          child: const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.gray100,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=42'),
          ),
        ),
      ],
    );
  }
}

class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(
          Icons.notifications_none_rounded,
          color: AppColors.gray500,
          size: 24,
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: AppColors.success,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
