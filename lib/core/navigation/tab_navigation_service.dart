import 'package:flutter/material.dart';
import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:flutter/scheduler.dart';

class TabNavigationService extends ChangeNotifier {
  List<ModuleTabItem> _currentTabs = [];
  TabController? _controller;

  List<ModuleTabItem> get tabs => _currentTabs;
  TabController? get controller => _controller;

  /// Инициализация или полное обновление вкладок модуля
  void updateTabs(List<ModuleTabItem> newTabs, TabController newController) {
    // Проверка на идентичность, чтобы избежать лишних перерисовок
    if (_currentTabs == newTabs && _controller == newController) return;

    _currentTabs = List.from(newTabs); // Создаем копию списка
    _controller = newController;

    _safeNotify();
  }

  /// ЗАКРЫТИЕ ТАБА
  /// Реализовано с защитой от выхода за границы и управлением контроллером
  void closeTab(int index) {
    if (index < 0 || index >= _currentTabs.length) return;

    // Если это последний таб в списке, обычно его не закрывают
    // или перенаправляют на главную. Здесь просто блокируем закрытие единственного таба.
    if (_currentTabs.length <= 1) return;

    _currentTabs.removeAt(index);

    // Если закрываемый таб был активным или находился слева от активного,
    // нужно скорректировать индекс в контроллере (если он существует)
    if (_controller != null) {
      final int currentIndex = _controller!.index;
      if (index <= currentIndex) {
        final int newIndex = (currentIndex - 1).clamp(
          0,
          _currentTabs.length - 1,
        );
        _controller!.index = newIndex;
      }
    }

    notifyListeners();
  }

  /// ПЕРЕКЛЮЧЕНИЕ ТАБА (например, программно из кода)
  void selectTab(int index) {
    if (_controller != null && index >= 0 && index < _currentTabs.length) {
      _controller!.animateTo(index);
      notifyListeners();
    }
  }

  /// СИНХРОНИЗАЦИЯ С SHELL (GoRouter)
  /// Позволяет найти нужный таб, если пользователь переключился через Sidebar
  void updateActiveTabByShellIndex(int shellIndex) {
    final targetIndex = _currentTabs.indexWhere(
      (t) => t.shellIndex == shellIndex,
    );
    if (targetIndex != -1) {
      selectTab(targetIndex);
    }
  }

  /// ОЧИСТКА
  void clear() {
    if (_currentTabs.isNotEmpty) {
      _currentTabs = [];
      _controller = null;
      _safeNotify();
    }
  }

  /// Безопасный вызов notifyListeners, чтобы избежать ошибок "setState() or markNeedsBuild() called during build"
  void _safeNotify() {
    if (WidgetsBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    } else {
      notifyListeners();
    }
  }
}
