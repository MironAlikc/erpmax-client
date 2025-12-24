import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/app_search_field.dart';
import 'package:flutter/material.dart';

class SaaSModuleHeader extends StatelessWidget {
  final ModuleTabItem currentTab;
  const SaaSModuleHeader({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDesign.pagePadding,
        isMobile ? 12 : 24,
        AppDesign.pagePadding,
        isMobile ? 12 : 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(currentTab.name, style: AppTextStyles.h1),
                    if (!isMobile) ...[
                      const SizedBox(height: 4),
                      Text(
                        currentTab.description ?? '',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: theme.gray500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 24),
                // Expanded(
                //   flex: 1,
                //   child: AppSearchField(
                //     hintText: "Search in ${currentTab.name}...",
                //     onChanged: (val) => debugPrint("Search: $val"),
                //   ),
                // ),
              ],
              if (!isMobile && currentTab.actionType != 'none') ...[
                const SizedBox(width: 24),
                _HeaderActions(currentTab: currentTab),
              ],
            ],
          ),
          if (isMobile)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: AppSearchField(hintText: "Search..."),
            ),
        ],
      ),
    );
  }
}

class _HeaderActions extends StatelessWidget {
  final ModuleTabItem currentTab;
  const _HeaderActions({required this.currentTab});

  @override
  Widget build(BuildContext context) {
    if (currentTab.actionType == 'report') {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ActionButton(
            label: "Print",
            icon: Icons.print_outlined,
            onPressed: () {},
          ),
          const SizedBox(width: 12),
          _ActionButton(
            label: "Export",
            icon: Icons.file_download_outlined,
            isPrimary: true,
            color: context.theme.appColor.success,
            onPressed: () {},
          ),
        ],
      );
    }

    if (currentTab.actionType == 'add' ||
        currentTab.actionType == 'dashboard') {
      return _ActionButton(
        label: _getLabel(currentTab.id),
        icon: _getIcon(currentTab.id),
        isPrimary: true,
        onPressed: () {},
      );
    }

    return const SizedBox.shrink();
  }

  String _getLabel(String id) {
    if (id.contains('module')) return "New Module";
    if (id.contains('package')) return "Create Package";
    if (id.contains('subscriber')) return "Add Subscriber";
    return "Action";
  }

  IconData _getIcon(String id) {
    if (id.contains('subscriber')) return Icons.person_add_alt_1_outlined;
    return Icons.add;
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isPrimary;
  final Color? color;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.isPrimary = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return SizedBox(
      height: 44,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? (color ?? const Color(0xFF12203A))
              : theme.white,
          foregroundColor: isPrimary ? theme.white : theme.textPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: isPrimary ? BorderSide.none : BorderSide(color: theme.gray200),
        ),
      ),
    );
  }
}
