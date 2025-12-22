import 'package:flutter/material.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:flutter/scheduler.dart';

class TabNavigationService extends ChangeNotifier {
  List<ModuleTabItem> _currentTabs = [];
  TabController? _controller;

  List<ModuleTabItem> get tabs => _currentTabs;
  TabController? get controller => _controller;

  void updateTabs(List<ModuleTabItem> newTabs, TabController newController) {
    if (_currentTabs == newTabs && _controller == newController) return;

    _currentTabs = List.from(newTabs);
    _controller = newController;

    _safeNotify();
  }

  void selectTab(int index) {
    if (_controller != null && index >= 0 && index < _currentTabs.length) {
      _controller!.animateTo(index);
      notifyListeners();
    }
  }

  void clear() {
    if (_currentTabs.isNotEmpty) {
      _currentTabs = [];
      _controller = null;
      _safeNotify();
    }
  }

  void _safeNotify() {
    if (WidgetsBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    } else {
      notifyListeners();
    }
  }
}
