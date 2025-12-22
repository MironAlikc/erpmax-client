// lib/features/dashboard/presentation/pages/base_module_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/tab_chip_bar.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';

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
    // Инициализируем контроллер
    _tabController = TabController(length: widget.tabs.length, vsync: this);

    // Передаем данные в сервис навигации после отрисовки первого кадра
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationService>().updateTabs(
          widget.tabs,
          _tabController,
        );
      }
    });

    _tabController.addListener(() {
      if (!mounted || _tabController.indexIsChanging) return;
      // Принудительно обновляем UI для перерисовки Header при смене таба
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);
    final tabService = context.watch<TabNavigationService>();

    // Защита: если табы еще не загружены или контроллер в сервисе отличается
    final currentTab = widget.tabs[_tabController.index];

    return Scaffold(
      backgroundColor: AppColors.gray50,
      body: Column(
        children: [
          // Исправленный вызов TabChipBar со всеми нужными параметрами
          TabChipBar(
            controller: _tabController,
            tabs: widget.tabs,
            isMobile: isMobile,
            onTabSelected: (index) {
              // Синхронизация: если нужно выполнить действие при клике на таб
              _tabController.animateTo(index);
            },
          ),

          // Анимированный заголовок страницы (Header)
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
            child: _buildPageHeader(
              currentTab,
              isMobile,
              key: ValueKey(currentTab.id),
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              // На десктопе отключаем свайп для стабильности интерфейса
              physics: isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: widget.tabs
                  .map((t) => KeepAlivePage(child: t.content))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageHeader(ModuleTabItem tab, bool isMobile, {Key? key}) {
    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tab.name, style: AppTextStyles.h1),
                if (!isMobile && tab.description != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    tab.description!,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (!isMobile) _buildActions(tab),
        ],
      ),
    );
  }

  Widget _buildActions(ModuleTabItem tab) {
    // 1. Приоритет кастомным экшенам
    if (tab.customActions != null) {
      return Wrap(spacing: 12, children: tab.customActions!);
    }

    // 2. Пресеты экшенов по типу модуля
    switch (tab.actionType) {
      case 'dashboard':
        return Row(
          children: [
            _actionBtn("Export Report", Icons.ios_share, isPrimary: false),
            const SizedBox(width: 12),
            _actionBtn(
              "Edit Dashboard",
              Icons.grid_view_rounded,
              isPrimary: true,
            ),
          ],
        );
      case 'accounting_dashboard':
        return Wrap(
          spacing: 12,
          runSpacing: 8,
          children: [
            _actionBtn("Export", Icons.ios_share, isPrimary: false),
            _actionBtn("Journal Entry", Icons.add, isPrimary: true),
            _actionBtn(
              "Cash Journal",
              Icons.account_balance_wallet,
              color: const Color(0xFF56D0A0),
            ),
            _actionBtn(
              "Receipts",
              Icons.arrow_downward,
              color: AppColors.success,
            ),
            _actionBtn("Payments", Icons.arrow_upward, color: AppColors.error),
          ],
        );
      default:
        // 3. Стандартная кнопка "Добавить", если задан лейбл
        if (tab.actionLabel != null) {
          return _actionBtn(
            tab.actionLabel!,
            tab.actionIcon ?? Icons.add,
            isPrimary: true,
          );
        }
        return const SizedBox.shrink();
    }
  }

  Widget _actionBtn(
    String label,
    IconData icon, {
    bool isPrimary = true,
    Color? color,
  }) {
    return AppButton(
      text: label,
      icon: icon,
      backgroundColor: color,
      type: isPrimary ? AppButtonType.primaryDark : AppButtonType.outline,
      onPressed: () {
        // Здесь можно добавить callback для действий
      },
    );
  }
}
