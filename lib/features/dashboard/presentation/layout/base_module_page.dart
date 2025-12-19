import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/features/saas_admin/presentation/widgets/tab_chip_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseModulePage extends StatefulWidget {
  final List<ModuleTabItem> tabs;
  final String moduleTitle;

  const BaseModulePage({
    super.key,
    required this.tabs,
    required this.moduleTitle,
  });

  @override
  State<BaseModulePage> createState() => _BaseModulePageState();
}

class _BaseModulePageState extends State<BaseModulePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TabNavigationService>().updateTabs(
        widget.tabs,
        _tabController,
      );
    });
    _tabController.addListener(() {
      if (!mounted) return;
      if (!_tabController.indexIsChanging) {
        setState(() {}); // Перерисовываем Header
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = widget.tabs[_tabController.index];
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFC),
      body: Column(
        children: [
          // Виджет Табов
          TabChipBar(
            controller: _tabController,
            tabs: widget.tabs,
            isMobile: isMobile,
          ),

          // Хедер страницы
          _buildPageHeader(currentTab, isMobile),

          // Контентная область
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: widget.tabs.map((t) => t.content).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader(ModuleTabItem tab, bool isMobile) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tab.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tab.description ?? '',
                  style: const TextStyle(color: Color(0xFF64748B)),
                ),
              ],
            ),
          ),
          if (!isMobile) _buildActions(tab),
        ],
      ),
    );
  }

  Widget _buildActions(ModuleTabItem tab) {
    return Row(
      children: [
        if (tab.customActions != null) ...tab.customActions!,
        if (tab.actionLabel != null) ...[
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(tab.actionIcon ?? Icons.add),
            label: Text(tab.actionLabel!),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F172A),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

Widget _primaryButton(String label, IconData icon) {
  return ElevatedButton.icon(
    onPressed: () {
      // Добавь логику или передавай callback в ModuleTabItem
    },
    icon: Icon(icon, size: 18),
    label: Text(label),
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF0F172A),
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
    ),
  );
}
