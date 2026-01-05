import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/l10n/locale_cubit.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/theme_cubit.dart';
import 'package:erpmax_client/core/widgets/common/greeting_time_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

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
      height: Dimens.p64,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 12 : 24),
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(
          top: BorderSide(color: theme.success, width: 4),
          bottom: BorderSide(color: theme.border, width: 1),
        ),
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
                            icon: LucideIcons.users,
                            label: localizations.customers,
                          ),
                          _QuickActionButton(
                            icon: LucideIcons.shoppingCart,
                            label: localizations.sales,
                          ),
                          _QuickActionButton(
                            icon: LucideIcons.shoppingBag,
                            label: localizations.purchases,
                          ),
                          _QuickActionButton(
                            icon: LucideIcons.wallet,
                            label: localizations.funds,
                          ),
                          _QuickActionButton(
                            icon: LucideIcons.fileText,
                            label: localizations.accJournal,
                          ),
                          _QuickActionButton(
                            icon: LucideIcons.book,
                            label: localizations.accLedger,
                          ),
                          _QuickActionButton(
                            icon: LucideIcons.package,
                            label: localizations.label_materials,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ] else
                const Spacer(),

              if (showGreeting) ...[
                GreetingTimeSection(),
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

class _QuickActionButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const _QuickActionButton({required this.icon, required this.label});

  @override
  State<_QuickActionButton> createState() => _QuickActionButtonState();
}

class _QuickActionButtonState extends State<_QuickActionButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4, left: 6, right: 6),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            hoverColor: theme.gray50,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            borderRadius: BorderRadius.circular(Dimens.p6),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    transform: Matrix4.translationValues(
                      0,
                      _isHovered ? -2 : 0,
                      0,
                    ),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 200),
                      scale: _isHovered ? 1.2 : 1.0,
                      child: Icon(
                        widget.icon,
                        color: _isHovered
                            ? theme.textPrimary
                            : theme.textTertiary,
                        size: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    widget.label,
                    style: AppTextStyles.label.copyWith(
                      fontSize: 11,
                      color: _isHovered ? theme.textPrimary : theme.gray600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
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
    final localizations = AppLocalizations.of(context);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, currentMode) {
        return PopupMenuButton<UserMenuItem>(
          offset: const Offset(0, 44),
          elevation: 4,
          color: theme.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          constraints: const BoxConstraints(minWidth: 260),
          onSelected: (item) => _handleSelection(context, item),
          itemBuilder: (_) => [
            _userHeader(theme),
            _divider(theme),

            _sectionLabel(theme, localizations.theme_title),
            _radioItem(
              theme,
              label: localizations.theme_light,
              icon: LucideIcons.sun,
              value: UserMenuItem.themeLight,
              selected: currentMode == ThemeMode.light,
            ),
            _radioItem(
              theme,
              label: localizations.theme_dark,
              icon: LucideIcons.moon,
              value: UserMenuItem.themeDark,
              selected: currentMode == ThemeMode.dark,
            ),
            _radioItem(
              theme,
              label: localizations.theme_system,
              icon: LucideIcons.laptop,
              value: UserMenuItem.themeSystem,
              selected: currentMode == ThemeMode.system,
            ),

            _divider(theme),

            _sectionLabel(theme, localizations.setting_nav_style),
            _radioItem(
              theme,
              label: localizations.sidebar,
              icon: LucideIcons.panelLeft,
              value: UserMenuItem.navigationSidebar,
            ),
            _radioItem(
              theme,
              label: localizations.layout_topbar,
              icon: LucideIcons.panelTop,
              value: UserMenuItem.navigationTopbar,
            ),

            _divider(theme),

            PopupMenuItem(
              value: UserMenuItem.signOut,
              padding: EdgeInsets.only(top: 6, left: 12, right: 12),
              height: 32,
              child: Row(
                children: [
                  Icon(LucideIcons.logOut, color: theme.errorText, size: 18),
                  const SizedBox(width: 12),
                  Text(
                    localizations.action_sign_out,
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.errorText,
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

  PopupMenuItem<UserMenuItem> _divider(AppColorExtension colors) {
    return PopupMenuItem<UserMenuItem>(
      enabled: false,
      height: 1,
      padding: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Divider(color: colors.borderLight, height: 1, thickness: 1),
      ),
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
      height: 32,
      child: Row(
        children: [
          Icon(icon, size: 18, color: theme.textPrimary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: AppTextStyles.bodyMedium.copyWith(
                fontSize: 13,
                color: theme.textPrimary,
              ),
            ),
          ),
          if (selected)
            Icon(LucideIcons.check, size: 18, color: theme.textPrimary),
        ],
      ),
    );
  }

  PopupMenuItem<UserMenuItem> _sectionLabel(
    AppColorExtension colors,
    String text,
  ) {
    return PopupMenuItem(
      enabled: false,
      height: 36,
      child: Text(
        text,
        style: AppTextStyles.bodySmall.copyWith(color: colors.textSecondary),
      ),
    );
  }

  PopupMenuItem<UserMenuItem> _userHeader(AppColorExtension theme) {
    return PopupMenuItem(
      enabled: false,
      height: 32,
      child: Text(
        'User',
        style: AppTextStyles.bodyMediumBold.copyWith(color: theme.textPrimary),
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

class _LanguageToggleButton extends StatelessWidget {
  const _LanguageToggleButton();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        hoverColor: theme.gray50,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
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
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'omelchenkoaleks',
              style: AppTextStyles.bodySmallBold.copyWith(
                color: theme.textPrimary,
              ),
            ),
            Text(
              'user',
              style: AppTextStyles.caption.copyWith(color: theme.textSecondary),
            ),
          ],
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            color: theme.gray400,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: theme.sidebarBackground,
            child: Text(
              'OM',
              style: AppTextStyles.bodyMediumBold.copyWith(color: Colors.white),
            ),
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
    final theme = context.theme.appColor;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(LucideIcons.bell, color: theme.gray600, size: 22),
        Positioned(
          right: 2,
          top: 1,
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: theme.success,
              shape: BoxShape.circle,
              border: Border.all(color: theme.white, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
