import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/app_module_header.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/saas_tabs_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SaaSAdminRootPage extends StatefulWidget {
  const SaaSAdminRootPage({super.key});

  @override
  State<SaaSAdminRootPage> createState() => _SaaSAdminRootPageState();
}

class _SaaSAdminRootPageState extends State<SaaSAdminRootPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final List<ModuleTabItem> _moduleTabs;

  @override
  void initState() {
    super.initState();
    _moduleTabs = SaasTabsConfig.getTabs(context);
    _tabController = TabController(length: _moduleTabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationService>().updateTabs(
          _moduleTabs,
          _tabController,
          branchIndex: SaasTabsConfig.saasShellIndex,
        );
      }
    });

    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (mounted && !_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTab = _moduleTabs[_tabController.index];
    final bool isMobile = Responsive.isMobile(context);
    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),
          child: AppModuleHeader(
            key: ValueKey('header_${currentTab.id}'),
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
                .map((tab) => KeepAlivePage(child: tab.content))
                .toList(),
          ),
        ),
      ],
    );
  }
}
