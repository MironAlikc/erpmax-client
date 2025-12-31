import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/l10n/locale_cubit.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum UserMenuItem {
  themeLight,
  themeDark,
  themeSystem,
  navigationSidebar,
  navigationTopbar,
  signOut,
}

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
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      height: AppDesign.headerHeight,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 24),
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(bottom: BorderSide(color: theme.gray100, width: 1)),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;

          final showQuickActions = width > 1100;
          final showGreeting = width > 900;
          final showLanguage = width > 820;

          return Row(
            children: [
              _buildToggleButton(context),

              if (showQuickActions) ...[
                const SizedBox(width: 16),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          _QuickActionButton(
                            icon: Icons.groups_outlined,
                            label: localizations.customers,
                          ),
                          _QuickActionButton(
                            icon: Icons.shopping_cart_outlined,
                            label: localizations.sales,
                          ),
                          _QuickActionButton(
                            icon: Icons.local_mall_outlined,
                            label: localizations.purchases,
                          ),
                          _QuickActionButton(
                            icon: Icons.account_balance_wallet_outlined,
                            label: localizations.funds,
                          ),
                          _QuickActionButton(
                            icon: Icons.description_outlined,
                            label: localizations.journal,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ] else
                const Spacer(),

              if (showGreeting) ...[
                const _GreetingTimeSection(),
                const SizedBox(width: 20),
              ],

              if (showLanguage) ...[
                const _LanguageToggleButton(),
                const SizedBox(width: 20),
              ],

              const _NotificationBadge(),
              const SizedBox(width: 20),

              Container(height: 32, width: 1, color: theme.gray200),
              const SizedBox(width: 20),

              _UserAccountMenu(isMobile: isMobile),
            ],
          );
        },
      ),
    );
  }

  Widget _buildToggleButton(BuildContext context) {
    final theme = context.theme.appColor;

    if (isMobile) {
      return IconButton(
        icon: Icon(Icons.menu, color: theme.textPrimary),
        onPressed: () => Scaffold.of(context).openDrawer(),
      );
    }

    return InkWell(
      onTap: onToggleSidebar,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: AnimatedRotation(
          turns: isSidebarExpanded ? 0 : 0.5,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
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
    final theme = context.theme.appColor;

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
              Icon(icon, color: theme.textPrimary, size: 22),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyles.label.copyWith(
                  fontSize: 11,
                  color: theme.gray500,
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

class _UserAccountMenu extends StatelessWidget {
  final bool isMobile;

  const _UserAccountMenu({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentMode) {
        return PopupMenuButton<UserMenuItem>(
          offset: const Offset(0, 12),
          elevation: 8,
          color: theme.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: const BoxConstraints(minWidth: 260),
          onSelected: (item) => _handleSelection(context, item),
          itemBuilder: (_) => [
            _userHeader(theme),
            const PopupMenuDivider(),

            _sectionLabel('Theme'),
            _radioItem(
              theme,
              label: 'Light',
              icon: Icons.light_mode_outlined,
              value: UserMenuItem.themeLight,
              selected: currentMode == ThemeMode.light,
            ),
            _radioItem(
              theme,
              label: 'Dark',
              icon: Icons.dark_mode_outlined,
              value: UserMenuItem.themeDark,
              selected: currentMode == ThemeMode.dark,
            ),
            _radioItem(
              theme,
              label: 'System',
              icon: Icons.settings_suggest_outlined,
              value: UserMenuItem.themeSystem,
              selected: currentMode == ThemeMode.system,
            ),

            const PopupMenuDivider(),

            _sectionLabel('Navigation Style'),
            _radioItem(
              theme,
              label: 'Sidebar',
              icon: Icons.view_sidebar_outlined,
              value: UserMenuItem.navigationSidebar,
            ),
            _radioItem(
              theme,
              label: 'Topbar',
              icon: Icons.view_day_outlined,
              value: UserMenuItem.navigationTopbar,
            ),

            const PopupMenuDivider(),

            PopupMenuItem(
              value: UserMenuItem.signOut,
              child: Row(
                children: [
                  Icon(Icons.logout, color: theme.error, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'Sign out',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.error,
                    ),
                  ),
                ],
              ),
            ),
          ],
          child: _UserAccountButton(),
        );
      },
    );
  }

  PopupMenuItem<UserMenuItem> _radioItem(
    AppColorExtension theme, {
    required String label,
    required IconData icon,
    required UserMenuItem value,
    bool selected = false,
  }) {
    return PopupMenuItem(
      value: value,
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.gray600),
          const SizedBox(width: 12),
          Expanded(child: Text(label, style: AppTextStyles.bodyMedium)),
          if (selected) Icon(Icons.check, size: 18, color: theme.primary),
        ],
      ),
    );
  }

  PopupMenuItem<UserMenuItem> _sectionLabel(String text) {
    return PopupMenuItem(
      enabled: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  PopupMenuItem<UserMenuItem> _userHeader(AppColorExtension theme) {
    return PopupMenuItem(
      enabled: false,
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=42'),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('omelchenkoaleks', style: AppTextStyles.bodyMediumBold),
              Text(
                'omelchenkoaleks@gmail.com',
                style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _handleSelection(BuildContext context, UserMenuItem item) {
    final themeCubit = context.read<ThemeCubit>();

    switch (item) {
      case UserMenuItem.themeLight:
        themeCubit.setLight();
        break;
      case UserMenuItem.themeDark:
        themeCubit.setDark();
        break;
      case UserMenuItem.themeSystem:
        themeCubit.setSystem();
        break;
      case UserMenuItem.navigationSidebar:
        break;
      case UserMenuItem.navigationTopbar:
        break;
      case UserMenuItem.signOut:
        break;
    }
  }
}

class _GreetingTimeSection extends StatelessWidget {
  const _GreetingTimeSection();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Good Morning',
          style: AppTextStyles.bodySmall.copyWith(
            color: theme.gray400,
            fontSize: 11,
          ),
        ),
        Text(
          '07:22 AM',
          style: AppTextStyles.base.copyWith(
            color: theme.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _LanguageToggleButton extends StatelessWidget {
  const _LanguageToggleButton();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () {
          context.read<LocaleCubit>().toggleLanguage();
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'AR',
            style: AppTextStyles.bodyMediumBold.copyWith(
              fontSize: 13,
              color: theme.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

class _UserAccountButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('omelchenkoaleks', style: AppTextStyles.bodyMediumBold),
        const SizedBox(width: 12),
        CircleAvatar(
          radius: 18,
          backgroundColor: theme.gray100,
          child: Text('OM', style: AppTextStyles.bodyMediumBold),
        ),
      ],
    );
  }
}

class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(Icons.notifications_none_rounded, color: theme.gray500, size: 24),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: theme.success,
              shape: BoxShape.circle,
              border: Border.all(color: theme.white, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
