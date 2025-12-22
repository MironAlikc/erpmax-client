import 'package:flutter/material.dart';

class ModuleTabItem {
  final String id;
  final String name;
  final IconData icon;
  final Widget content;

  // Добавляем эти поля для профессиональной навигации:
  final int shellIndex; // Соответствие индексу ветки в GoRouter
  final String? description; // Для подзаголовка в Header
  final String? actionType; // Тип кнопок (dashboard, accounting и т.д.)
  final List<Widget>? customActions; // Кастомные кнопки для этого таба
  final String? actionLabel; // Текст главной кнопки действия
  final IconData? actionIcon; // Иконка главной кнопки действия

  const ModuleTabItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.content,
    required this.shellIndex, // Теперь это обязательное поле
    this.description,
    this.actionType,
    this.customActions,
    this.actionLabel,
    this.actionIcon,
  });

  // Вспомогательный метод для копирования (опционально)
  ModuleTabItem copyWith({
    String? id,
    String? name,
    IconData? icon,
    Widget? content,
    int? shellIndex,
  }) {
    return ModuleTabItem(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      content: content ?? this.content,
      shellIndex: shellIndex ?? this.shellIndex,
      description: description,
      actionType: actionType,
      customActions: customActions,
    );
  }
}
