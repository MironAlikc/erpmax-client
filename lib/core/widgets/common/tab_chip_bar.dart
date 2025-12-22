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
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() => setState(() {}));
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
              onSelected: (_) {
                widget.controller.animateTo(index);
                widget.onTabSelected?.call(index);
              },
              backgroundColor: Colors.transparent,
              selectedColor: const Color(0xFFF0FDF4),
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
