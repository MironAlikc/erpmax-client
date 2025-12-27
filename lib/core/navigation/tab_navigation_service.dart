import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';

class TabNavigationService extends ChangeNotifier {
  final Map<int, List<ModuleTabItem>> _tabsByBranch = {};
  final Map<int, TabController> _controllersByBranch = {};
  int _currentBranch = -1;

  List<ModuleTabItem> get tabs => _tabsByBranch[_currentBranch] ?? [];
  TabController? get controller => _controllersByBranch[_currentBranch];
  void clearTabs() {
    if (_tabsByBranch.containsKey(_currentBranch)) {
      _tabsByBranch.remove(_currentBranch);
      _controllersByBranch.remove(_currentBranch);
      _safeNotify();
    }
  }

  void setBranch(int branchIndex) {
    if (_currentBranch == branchIndex) return;
    _currentBranch = branchIndex;

    debugPrint('🔄 Branch switched to: $branchIndex');
    _safeNotify();
  }

  void updateTabs(
    List<ModuleTabItem> newTabs,
    TabController newController, {
    required int branchIndex,
  }) {
    _tabsByBranch[branchIndex] = List.unmodifiable(newTabs);
    _controllersByBranch[branchIndex] = newController;

    debugPrint('💾 Tabs updated for branch $branchIndex');

    if (_currentBranch == branchIndex) {
      _safeNotify();
    }
  }

  void selectTab(int index) {
    final currentController = _controllersByBranch[_currentBranch];
    if (currentController != null && index >= 0 && index < tabs.length) {
      currentController.animateTo(index);
      _safeNotify();
    }
  }

  void clear(int branchIndex) {
    _tabsByBranch.remove(branchIndex);
    _controllersByBranch.remove(branchIndex);
    _safeNotify();
  }

  void _safeNotify() {
    if (WidgetsBinding.instance.schedulerPhase != SchedulerPhase.idle) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (hasListeners) notifyListeners();
      });
    } else {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _tabsByBranch.clear();
    _controllersByBranch.clear();
    super.dispose();
  }
}
