import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/tab_navigation_service.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/accounting/presentation/config/accounting_tabs_config.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_header/accounting_header_dispatcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountingRootPage extends StatefulWidget {
  const AccountingRootPage({super.key});

  @override
  State<AccountingRootPage> createState() => _AccountingRootPageState();
}

class _AccountingRootPageState extends State<AccountingRootPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<ModuleTabItem>? _moduleTabs;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 7, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (_moduleTabs == null) {
      _moduleTabs = AccountingTabsConfig.getTabs(
        context,
        (name) => _PlaceholderView(name: name),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<TabNavigationService>().updateTabs(
            _moduleTabs!,
            _tabController,
            branchIndex: 1,
          );
        }
      });
    }
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
    final tabs = _moduleTabs;
    if (tabs == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;
        final currentTab = tabs[_tabController.index];

        return Scaffold(
          backgroundColor: context.theme.appColor.gray50,
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
                  children: tabs
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
    final theme = context.theme.appColor;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction_rounded, size: 48, color: theme.gray300),
          const SizedBox(height: 16),
          Text(
            "$name\nComing Soon",
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyLarge.copyWith(color: theme.gray400),
          ),
        ],
      ),
    );
  }
}
