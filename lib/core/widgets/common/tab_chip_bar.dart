import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/theme/app_design.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_search_field.dart';
import 'package:flutter/material.dart';

class TabChipBar extends StatefulWidget {
  final TabController controller;
  final List<ModuleTabItem> tabs;
  final bool isMobile;
  final Function(int)? onTabSelected;

  const TabChipBar({
    super.key,
    required this.controller,
    required this.tabs,
    required this.isMobile,
    this.onTabSelected,
  });

  @override
  State<TabChipBar> createState() => _TabChipBarState();
}

class _TabChipBarState extends State<TabChipBar> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _keys = [];

  @override
  void initState() {
    super.initState();
    _keys.addAll(List.generate(widget.tabs.length, (index) => GlobalKey()));
    widget.controller.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleTabSelection);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    if (!mounted) return;
    if (!widget.controller.indexIsChanging) {
      _scrollToSelected();
      setState(() {});
    }
  }

  void _scrollToSelected() {
    final index = widget.controller.index;
    if (index >= _keys.length) return;

    final context = _keys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: 0.5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: AppDesign.pagePadding),
      decoration: BoxDecoration(color: theme.white),
      child: Row(
        children: [
          Expanded(
            child: RawScrollbar(
              padding: EdgeInsets.only(top: 6),
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 6,
              radius: const Radius.circular(8),
              child: SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: List.generate(widget.tabs.length, (index) {
                    final isSelected = widget.controller.index == index;
                    final tab = widget.tabs[index];

                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            widget.controller.animateTo(index);
                            widget.onTabSelected?.call(index);
                          },
                          borderRadius: BorderRadius.circular(8),
                          hoverColor: theme.gray50,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? theme.gray50
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? theme.activeGreen.withValues(alpha: 0.3)
                                    : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  tab.icon,
                                  size: 16,
                                  color: isSelected
                                      ? theme.activeGreen
                                      : theme.textDisabled,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  tab.name,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    fontSize: 13,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: isSelected
                                        ? theme.textPrimary
                                        : theme.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16),

          if (!widget.isMobile) ...[
            const SizedBox(width: 24),
            SizedBox(
              width: 280,
              height: 40,
              child: AppSearchField(
                hintText: AppLocalizations.of(context).commonSearchPlaceholder,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
