import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String title;
  final String? route; // Для навигации
  final List<MenuItemModel>? children;

  const MenuItemModel({
    required this.icon,
    required this.title,
    this.route,
    this.children,
  });
}
