import 'package:flutter/material.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';

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

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleTabSelection);
  }

  @override
  void didUpdateWidget(covariant TabChipBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller.removeListener(_handleTabSelection);
      widget.controller.addListener(_handleTabSelection);
    }
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
      setState(() {});
      _scrollToActiveTab();
    }
  }

  void _scrollToActiveTab() {
    if (!_scrollController.hasClients) return;
    double offset = widget.controller.index * 100.0;
    _scrollController.animateTo(
      offset.clamp(0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9), width: 1)),
      ),
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: widget.tabs.length,
        itemBuilder: (context, index) {
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
                    ? const Color(0xFF00C58D)
                    : const Color(0xFF94A3B8),
              ),
              label: Text(tab.name),
              labelStyle: TextStyle(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF64748B),
              ),
              selected: isSelected,
              onSelected: (selected) {
                if (selected) {
                  widget.controller.animateTo(index);
                  widget.onTabSelected?.call(index);
                }
              },
              backgroundColor: Colors.transparent,
              selectedColor: const Color(0xFFF0FDF4),
              elevation: 0,
              pressElevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isSelected
                      ? const Color(0xFF00C58D).withOpacity(0.5)
                      : const Color(0xFFE2E8F0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
