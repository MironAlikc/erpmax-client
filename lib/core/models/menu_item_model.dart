// lib/core/models/menu_item_model.dart
import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final String? route;
  final List<MenuItemModel>? children;

  const MenuItemModel({
    required this.icon,
    required this.title,
    this.route,
    this.children,
  });
}
