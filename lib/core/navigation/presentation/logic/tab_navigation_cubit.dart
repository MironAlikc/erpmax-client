import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

class TabNavigationState {
  final Map<int, List<ModuleTabItem>> tabsByBranch;
  final Map<int, TabController> controllersByBranch;
  final int currentBranch;

  TabNavigationState({
    Map<int, List<ModuleTabItem>>? tabsByBranch,
    Map<int, TabController>? controllersByBranch,
    this.currentBranch = -1,
  }) : tabsByBranch = tabsByBranch ?? {},
       controllersByBranch = controllersByBranch ?? {};

  List<ModuleTabItem> get tabs => tabsByBranch[currentBranch] ?? [];
  TabController? get controller => controllersByBranch[currentBranch];

  TabNavigationState copyWith({
    Map<int, List<ModuleTabItem>>? tabsByBranch,
    Map<int, TabController>? controllersByBranch,
    int? currentBranch,
  }) {
    return TabNavigationState(
      tabsByBranch: tabsByBranch ?? Map.from(this.tabsByBranch),
      controllersByBranch:
          controllersByBranch ?? Map.from(this.controllersByBranch),
      currentBranch: currentBranch ?? this.currentBranch,
    );
  }
}

@lazySingleton
class TabNavigationCubit extends Cubit<TabNavigationState> {
  TabNavigationCubit() : super(TabNavigationState());

  void clearTabs() {
    final currentBranch = state.currentBranch;
    if (state.tabsByBranch.containsKey(currentBranch)) {
      final newTabsByBranch = Map<int, List<ModuleTabItem>>.from(
        state.tabsByBranch,
      )..remove(currentBranch);
      final newControllersByBranch = Map<int, TabController>.from(
        state.controllersByBranch,
      )..remove(currentBranch);

      emit(
        state.copyWith(
          tabsByBranch: newTabsByBranch,
          controllersByBranch: newControllersByBranch,
        ),
      );
    }
  }

  void setBranch(int branchIndex) {
    if (state.currentBranch == branchIndex) return;

    debugPrint('🔄 Branch switched to: $branchIndex');
    emit(state.copyWith(currentBranch: branchIndex));
  }

  void updateTabs(
    List<ModuleTabItem> newTabs,
    TabController newController, {
    required int branchIndex,
  }) {
    final newTabsByBranch = Map<int, List<ModuleTabItem>>.from(
      state.tabsByBranch,
    )..[branchIndex] = List.unmodifiable(newTabs);

    final newControllersByBranch = Map<int, TabController>.from(
      state.controllersByBranch,
    )..[branchIndex] = newController;

    debugPrint(
      '💾 Tabs updated for branch $branchIndex: ${newTabs.length} tabs',
    );

    emit(
      state.copyWith(
        tabsByBranch: newTabsByBranch,
        controllersByBranch: newControllersByBranch,
      ),
    );
  }

  void selectTab(int index) {
    final currentController = state.controllersByBranch[state.currentBranch];
    if (currentController != null && index >= 0 && index < state.tabs.length) {
      currentController.animateTo(index);
    }
  }

  void clear(int branchIndex) {
    final newTabsByBranch = Map<int, List<ModuleTabItem>>.from(
      state.tabsByBranch,
    )..remove(branchIndex);
    final newControllersByBranch = Map<int, TabController>.from(
      state.controllersByBranch,
    )..remove(branchIndex);

    emit(
      state.copyWith(
        tabsByBranch: newTabsByBranch,
        controllersByBranch: newControllersByBranch,
      ),
    );
  }

  @override
  Future<void> close() {
    state.controllersByBranch.clear();
    state.tabsByBranch.clear();
    return super.close();
  }
}
