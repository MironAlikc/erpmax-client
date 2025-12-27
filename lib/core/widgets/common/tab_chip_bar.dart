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
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(bottom: BorderSide(color: theme.gray200, width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: RawScrollbar(
              controller: _scrollController,
              thumbColor: theme.activeGreen.withValues(alpha: 0.3),
              radius: const Radius.circular(8),
              thickness: 4,
              thumbVisibility: true,
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
                      child: ChoiceChip(
                        showCheckmark: false,
                        avatar: Icon(
                          tab.icon,
                          size: 18,
                          color: isSelected
                              ? theme.activeGreen
                              : theme.textDisabled,
                        ),
                        label: Text(tab.name),
                        labelStyle: AppTextStyles.bodySmall.copyWith(
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.w500,
                          color: isSelected
                              ? theme.textPrimary
                              : theme.textSecondary,
                        ),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) {
                            widget.controller.animateTo(index);
                            widget.onTabSelected?.call(index);
                          }
                        },
                        backgroundColor: Colors.transparent,
                        selectedColor: theme.successBg,
                        elevation: 0,
                        pressElevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            color: isSelected
                                ? theme.activeGreen.withValues(alpha: 0.5)
                                : theme.borderLight,
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
              child: AppSearchField(hintText: "Search here..."),
            ),
          ],
        ],
      ),
    );
  }
}
