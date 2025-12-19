import 'package:flutter/material.dart';

@immutable
class ModuleTabItem {
  final String id;
  final String name;
  final IconData icon;
  final String? description;
  final Widget content;
  final String actionType;
  final List<Widget>? customActions;
  final String? actionLabel;
  final IconData? actionIcon;

  const ModuleTabItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.content,
    this.description,
    this.actionType = 'none',
    this.customActions,
    this.actionLabel,
    this.actionIcon,
  });
}
