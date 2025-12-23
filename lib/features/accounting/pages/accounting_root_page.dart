import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/features/accounting/config/accounting_tabs_config.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/accounting_header_dispatcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/design/app_colors.dart';
import '../../../../core/design/app_text_styles.dart';
import '../../../../core/navigation/tab_navigation_service.dart';
import '../../../../core/widgets/common/keep_alive_page.dart';

class AccountingRootPage extends StatefulWidget {
  const AccountingRootPage({super.key});

  @override
  State<AccountingRootPage> createState() => _AccountingRootPageState();
}

class _AccountingRootPageState extends State<AccountingRootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final List<ModuleTabItem> _moduleTabs;

  @override
  void initState() {
    super.initState();

    _moduleTabs = AccountingTabsConfig.getTabs(
      (name) => _PlaceholderView(name: name),
    );

    _tabController = TabController(length: _moduleTabs.length, vsync: this);
    _tabController.addListener(_handleTabChange);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationService>().updateTabs(
          _moduleTabs,
          _tabController,
        );
      }
    });
  }

  void _handleTabChange() {
    if (!mounted) return;
    if (!_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;
        final currentTab = _moduleTabs[_tabController.index];

        return Scaffold(
          backgroundColor: AppColors.gray50,
          body: Column(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: AccountingHeaderDispatcher(
                  key: ValueKey(currentTab.id),
                  currentTab: currentTab,
                ),
              ),

              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: isMobile
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  children: _moduleTabs
                      .map((t) => KeepAlivePage(child: t.content))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PlaceholderView extends StatelessWidget {
  final String name;
  const _PlaceholderView({required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.construction_rounded,
            size: 48,
            color: AppColors.gray300,
          ),
          const SizedBox(height: 16),
          Text(
            "$name\nComing Soon",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(color: AppColors.gray400),
          ),
        ],
      ),
    );
  }
}
