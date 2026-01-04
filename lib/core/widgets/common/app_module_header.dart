import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/theme/app_dimens.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/app_search_field.dart';
import 'package:flutter/material.dart';

class AppModuleHeader extends StatelessWidget {
  final ModuleTabItem currentTab;
  final List<Widget>? extraActions;

  const AppModuleHeader({
    super.key,
    required this.currentTab,
    this.extraActions,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimens.pagePadding,
        isMobile ? 16 : 24,
        AppDimens.pagePadding,
        isMobile ? 12 : 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ModuleHeaderInfo(
                  title: currentTab.name,
                  description: isMobile ? null : currentTab.description,
                ),
              ),
              const SizedBox(width: 12),
              buildActionsRow(context, isMobile),
            ],
          ),
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: AppSearchField(
                hintText: AppLocalizations.of(context).search,
              ),
            ),
        ],
      ),
    );
  }

  Widget buildActionsRow(BuildContext context, bool isMobile) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (extraActions != null) ...[
          ...extraActions!,
          if (currentTab.actionType != 'none')
            SizedBox(width: isMobile ? 8 : 12),
        ],
        if (currentTab.actionType != 'none')
          ModuleHeaderActions(currentTab: currentTab),
      ],
    );
  }
}

class ModuleHeaderInfo extends StatelessWidget {
  final String title;
  final String? description;

  const ModuleHeaderInfo({super.key, required this.title, this.description});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h1.copyWith(
            fontWeight: FontWeight.w800,
            color: const Color(0xFF12203A),
            height: 1.2,
          ),
        ),
        if (description != null && description!.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            description!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
          ),
        ],
      ],
    );
  }
}

class ModuleHeaderActions extends StatelessWidget {
  final ModuleTabItem currentTab;

  const ModuleHeaderActions({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);

    if (currentTab.actionType == 'report') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ModuleActionButton(
            label: l10n.print,
            icon: Icons.print_outlined,
            onPressed: () {},
          ),
          SizedBox(width: isMobile ? 8 : 12),
          ModuleActionButton(
            label: l10n.export,
            icon: Icons.file_download_outlined,
            isPrimary: true,
            color: theme.success,
            onPressed: () {},
          ),
        ],
      );
    }

    if (currentTab.actionType == 'add' ||
        currentTab.actionType == 'dashboard') {
      return ModuleActionButton(
        label: ModuleActionLabelResolver.getLabel(context, currentTab.id),
        icon: ModuleActionLabelResolver.getIcon(currentTab.id),
        isPrimary: true,
        onPressed: () {},
      );
    }

    return const SizedBox.shrink();
  }
}

class ModuleActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const ModuleActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);

    final Color bgColor = isPrimary
        ? (color ?? const Color(0xFF12203A))
        : theme.white;
    final Color contentColor = isPrimary ? theme.white : theme.textPrimary;

    if (isMobile) {
      return Material(
        color: bgColor,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onPressed,
          customBorder: const CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(icon, size: 20, color: contentColor),
          ),
        ),
      );
    }

    return SizedBox(
      height: 40,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: contentColor,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.chipRadius),
          ),
          side: isPrimary ? BorderSide.none : BorderSide(color: theme.gray200),
        ),
      ),
    );
  }
}

abstract class ModuleActionLabelResolver {
  static String getLabel(BuildContext context, String id) {
    final l10n = AppLocalizations.of(context);
    if (id.contains('module')) return l10n.newModule;
    if (id.contains('package')) return l10n.createPackage;
    if (id.contains('subscriber')) return l10n.addSubscriber;
    return l10n.action;
  }

  static IconData getIcon(String id) {
    if (id.contains('subscriber')) return Icons.person_add_alt_1_outlined;
    return Icons.add;
  }
}
