import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/presentation/logic/tab_navigation_cubit.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/accounting/presentation/config/accounting_tabs_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountingRootPage extends StatefulWidget {
  const AccountingRootPage({super.key});

  @override
  State<AccountingRootPage> createState() => _AccountingRootPageState();
}

class _AccountingRootPageState extends State<AccountingRootPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<ModuleTabItem>? _moduleTabs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newTabs = AccountingTabsConfig.getTabs(
      context,
      (name) => _PlaceholderView(name: name),
    );

    if (_tabController == null || _moduleTabs?.length != newTabs.length) {
      _tabController?.dispose();
      _tabController = TabController(length: newTabs.length, vsync: this);
      _tabController!.addListener(_handleTabChange);

      _moduleTabs = newTabs;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<TabNavigationCubit>().updateTabs(
            _moduleTabs!,
            _tabController!,
            branchIndex: 1,
          );
        }
      });
    }
  }

  void _handleTabChange() {
    if (!mounted || _tabController == null) return;
    if (!_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabChange);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_moduleTabs == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;

        return Material(
          color: context.theme.appColor.gray50,
          child: TabBarView(
            controller: _tabController,
            physics: isMobile
                ? const BouncingScrollPhysics()
                : const NeverScrollableScrollPhysics(),
            children: _moduleTabs!
                .map((t) => KeepAlivePage(child: t.content))
                .toList(),
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
