import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/presentation/app_menu_type_config.dart';
import 'package:erpmax_client/core/navigation/presentation/logic/tab_navigation_cubit.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/saas_control/presentation/config/saas_tabs_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaaSAdminRootPage extends StatefulWidget {
  const SaaSAdminRootPage({super.key});

  @override
  State<SaaSAdminRootPage> createState() => _SaaSAdminRootPageState();
}

class _SaaSAdminRootPageState extends State<SaaSAdminRootPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<ModuleTabItem>? _moduleTabs;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newTabs = SaasTabsConfig.getTabs(
      context,
      (name) => _PlaceholderView(name: name),
    );

    if (_tabController == null || _moduleTabs?.length != newTabs.length) {
      _tabController?.dispose();

      _tabController = TabController(length: newTabs.length, vsync: this);
      _tabController!.addListener(_handleTabSelection);
      _moduleTabs = newTabs;

      final saasIndex = AppMenuConfig.getIndexByType(
        AppMenuType.saasControl,
        AppLocalizations.of(context),
      );

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<TabNavigationCubit>().updateTabs(
            _moduleTabs!,
            _tabController!,
            branchIndex: saasIndex,
          );
        }
      });
    }
  }

  void _handleTabSelection() {
    if (mounted && _tabController != null && !_tabController!.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController?.removeListener(_handleTabSelection);
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
