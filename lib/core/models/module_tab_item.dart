import 'package:flutter/material.dart';

class ModuleTabItem {
  final String id;
  final String name;
  final IconData icon;
  final Widget content;
  final int shellIndex;
  final String? description;
  final String? actionType;
  final List<Widget>? customActions;
  final String? actionLabel;
  final IconData? actionIcon;

  const ModuleTabItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.content,
    required this.shellIndex,
    this.description,
    this.actionType,
    this.customActions,
    this.actionLabel,
    this.actionIcon,
  });

  ModuleTabItem copyWith({
    String? id,
    String? name,
    IconData? icon,
    Widget? content,
    int? shellIndex,
    String? description,
    String? actionType,
    List<Widget>? customActions,
    String? actionLabel,
    IconData? actionIcon,
  }) {
    return ModuleTabItem(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      content: content ?? this.content,
      shellIndex: shellIndex ?? this.shellIndex,
      description: description ?? this.description,
      actionType: actionType ?? this.actionType,
      customActions: customActions ?? this.customActions,
      actionLabel: actionLabel ?? this.actionLabel,
      actionIcon: actionIcon ?? this.actionIcon,
    );
  }
}
