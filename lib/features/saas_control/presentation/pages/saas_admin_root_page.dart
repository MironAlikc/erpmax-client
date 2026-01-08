import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:erpmax_client/core/navigation/presentation/logic/tab_navigation_cubit.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/keep_alive_page.dart';
import 'package:erpmax_client/features/saas_control/presentation/config/saas_tabs_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons/lucide_icons.dart';

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

    final newTabs = SaasTabsConfig.getTabs(context);

    if (_tabController == null || _moduleTabs?.length != newTabs.length) {
      _tabController?.dispose();

      _tabController = TabController(length: newTabs.length, vsync: this);
      _tabController!.addListener(_handleTabSelection);
      _moduleTabs = newTabs;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<TabNavigationCubit>().updateTabs(
            _moduleTabs!,
            _tabController!,
            branchIndex: SaasTabsConfig.saasShellIndex,
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
    if (_tabController == null || _moduleTabs == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final int currentIndex = _tabController!.index;
    final currentTab = _moduleTabs![currentIndex];
    final bool isMobile = Responsive.isMobile(context);
    final theme = context.theme.appColor;

    return Material(
      color: theme.gray50,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 32, 32, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentTab.name,
                  style: AppTextStyles.h3.copyWith(
                    color: const Color(0xFF101828),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (currentTab.id == 'dashboard')
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildActionBtn(
                            "Customize",
                            LucideIcons.slidersHorizontal,
                            false,
                          ),
                          const SizedBox(width: 12),
                          _buildActionBtn(
                            "Subscribers",
                            LucideIcons.users,
                            false,
                          ),
                          const SizedBox(width: 12),
                          _buildActionBtn(
                            "Packages",
                            LucideIcons.package,
                            false,
                          ),
                          const SizedBox(width: 12),
                          _buildActionBtn(
                            "Billing",
                            LucideIcons.creditCard,
                            false,
                          ),
                          const SizedBox(width: 12),
                          _buildActionBtn(
                            "New Subscriber",
                            LucideIcons.plus,
                            true,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              children: _moduleTabs!
                  .map((tab) => KeepAlivePage(child: tab.content))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(String label, IconData icon, bool isPrimary) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        backgroundColor: isPrimary ? const Color(0xFFECFDF5) : Colors.white,
        side: BorderSide(
          color: isPrimary ? const Color(0xFFD1FAE5) : const Color(0xFFEAECF0),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: isPrimary
                ? const Color(0xFF10B981)
                : const Color(0xFF667085),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyles.bodySmallBold.copyWith(
              fontSize: 14,
              color: isPrimary
                  ? const Color(0xFF065F46)
                  : const Color(0xFF344054),
            ),
          ),
        ],
      ),
    );
  }
}
