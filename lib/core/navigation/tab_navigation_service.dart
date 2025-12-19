import 'package:flutter/material.dart';
import '../models/module_tab_item.dart';

class TabNavigationService extends ChangeNotifier {
  List<ModuleTabItem> _currentTabs = [];
  TabController? _controller;

  List<ModuleTabItem> get tabs => _currentTabs;
  TabController? get controller => _controller;

  void updateTabs(List<ModuleTabItem> newTabs, TabController newController) {
    if (_currentTabs == newTabs && _controller == newController) return;

    _currentTabs = newTabs;
    _controller = newController;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      notifyListeners();
    });
  }

  void clear() {
    if (_currentTabs.isNotEmpty) {
      _currentTabs = [];
      _controller = null;
      notifyListeners();
    }
  }
}
