import 'package:erpmax_client/core/navigation/presentation/layout/app_sidebar.dart';
import 'package:erpmax_client/core/navigation/presentation/layout/mobile_drawer.dart';
import 'package:erpmax_client/core/navigation/presentation/layout/top_nav_bar.dart';
import 'package:erpmax_client/core/navigation/presentation/logic/tab_navigation_cubit.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/tab_chip_bar.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/side_panel/side_panel_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardShell extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const DashboardShell({super.key, required this.navigationShell});

  @override
  State<DashboardShell> createState() => _DashboardShellState();
}

class _DashboardShellState extends State<DashboardShell>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;
  late AnimationController _panelController;
  late Animation<Offset> _panelSlideAnimation;

  @override
  void initState() {
    super.initState();
    _panelController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _panelSlideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(parent: _panelController, curve: Curves.easeOutCubic),
        );
  }

  @override
  void dispose() {
    _panelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final bool isDesktop = Responsive.isDesktop(context);
    final int currentIndex = widget.navigationShell.currentIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<TabNavigationCubit>().setBranch(currentIndex);
      }
    });

    return Scaffold(
      backgroundColor: theme.gray50,
      drawer: !isDesktop
          ? MobileDrawer(
              selectedIndex: currentIndex,
              onSelect: (index) => _onBranchSelected(index),
            )
          : null,
      body: BlocListener<SidePanelCubit, SidePanelState>(
        listener: (context, state) {
          if (state.isOpen) {
            _panelController.forward();
          } else {
            _panelController.reverse();
          }
        },
        child: BlocBuilder<SidePanelCubit, SidePanelState>(
          builder: (context, panelState) {
            final screenWidth = MediaQuery.of(context).size.width;
            final bool isMobile = screenWidth < 600;
            final double panelWidth = isMobile
                ? screenWidth
                : (screenWidth * 0.5).clamp(450.0, 1100.0);

            return Stack(
              children: [
                Row(
                  children: [
                    if (isDesktop)
                      AppSidebar(
                        isExpanded: _isExpanded,
                        selectedIndex: currentIndex,
                        onToggle: () =>
                            setState(() => _isExpanded = !_isExpanded),
                        onSelect: (index) => _onBranchSelected(index),
                      ),
                    Expanded(
                      child: Column(
                        children: [
                          TopNavigationBar(
                            isMobile: !isDesktop,
                            isSidebarExpanded: _isExpanded,
                            onToggleSidebar: () {
                              if (isDesktop) {
                                setState(() => _isExpanded = !_isExpanded);
                              } else {
                                Scaffold.of(context).openDrawer();
                              }
                            },
                          ),
                          BlocBuilder<TabNavigationCubit, TabNavigationState>(
                            builder: (context, tabState) {
                              if (tabState.tabs.isEmpty ||
                                  tabState.controller == null) {
                                return const SizedBox.shrink();
                              }
                              return TabChipBar(
                                key: ValueKey(
                                  'branch_${tabState.currentBranch}',
                                ),
                                controller: tabState.controller!,
                                tabs: tabState.tabs,
                                isMobile: !isDesktop,
                                onTabSelected: (index) {
                                  context.read<TabNavigationCubit>().selectTab(
                                    index,
                                  );
                                },
                              );
                            },
                          ),
                          Expanded(
                            child: ClipRect(child: widget.navigationShell),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                FadeTransition(
                  opacity: _panelController,
                  child: _panelController.value > 0
                      ? GestureDetector(
                          onTap: () => context.read<SidePanelCubit>().hide(),
                          child: Container(
                            color: theme.black.withValues(alpha: 0.3),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),

                SlideTransition(
                  position: _panelSlideAnimation,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: RepaintBoundary(
                      child: GestureDetector(
                        onHorizontalDragEnd: (details) {
                          if (details.primaryVelocity! > 500) {
                            context.read<SidePanelCubit>().hide();
                          }
                        },
                        child: Material(
                          elevation: 16,
                          color: theme.gray50,
                          clipBehavior: Clip.hardEdge,
                          child: SizedBox(
                            width: panelWidth,
                            height: MediaQuery.of(context).size.height,
                            child:
                                panelState.content ?? const SizedBox.shrink(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _onBranchSelected(int index) {
    context.read<TabNavigationCubit>().setBranch(index);
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
    if (!Responsive.isDesktop(context)) {
      Navigator.of(context).pop();
    }
    context.read<SidePanelCubit>().hide();
  }
}
