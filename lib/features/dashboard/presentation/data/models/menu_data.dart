// lib/features/dashboard/presentation/data/models/menu_data.dart

import 'package:flutter/material.dart';
import 'package:erpmax_client/features/dashboard/presentation/data/models/menu_item_model.dart';

abstract final class MenuData {
  // --- Основные Модули ---
  static final List<MenuItemModel> coreModules = [
    MenuItemModel(title: 'Dashboards', icon: Icons.dashboard_outlined),
    MenuItemModel(title: 'Sales', icon: Icons.shopping_cart_outlined),
    MenuItemModel(
      title: 'Currency Exchange',
      icon: Icons.currency_exchange_outlined,
    ),
    MenuItemModel(title: 'Purchases', icon: Icons.local_mall_outlined),
    MenuItemModel(title: 'Inventory', icon: Icons.inventory_2_outlined),
    MenuItemModel(
      title: 'Manufacturing',
      icon: Icons.precision_manufacturing_outlined,
      children: [
        MenuItemModel(title: 'BOM', icon: Icons.check_box_outline_blank),
        MenuItemModel(title: 'Work Orders', icon: Icons.list_alt_outlined),
      ],
    ),
    MenuItemModel(
      title: 'Accounting',
      icon: Icons.account_balance_wallet_outlined,
      children: [
        MenuItemModel(
          title: 'Journal Entries',
          icon: Icons.receipt_long_outlined,
        ),
        MenuItemModel(
          title: 'Funds & Banks',
          icon: Icons.account_balance_outlined,
        ),
      ],
    ),
  ];
  // --- Управление Бизнесом ---
  static final List<MenuItemModel> businessManagement = [
    MenuItemModel(title: 'Customer Management', icon: Icons.people_outline),
    MenuItemModel(title: 'Human Resources', icon: Icons.badge_outlined),
    MenuItemModel(title: 'Projects', icon: Icons.work_outline),
  ];

  // --- Системные Инструменты ---
  static final List<MenuItemModel> systemTools = [
    MenuItemModel(
      title: 'Workflow & Automation',
      icon: Icons.auto_mode_outlined,
    ),
    MenuItemModel(title: 'Calendar', icon: Icons.calendar_today_outlined),
    MenuItemModel(title: 'SaaS Admin', icon: Icons.cloud_queue_outlined),
  ];

  // --- Настройки и Прочее ---
  static final List<MenuItemModel> settings = [
    MenuItemModel(title: 'Setting', icon: Icons.settings_outlined),
    MenuItemModel(title: 'Help', icon: Icons.help_outline),
    MenuItemModel(title: 'Logout', icon: Icons.logout_outlined),
  ];

  static List<MenuItemModel> getAllMenuItems() {
    final flatList = <MenuItemModel>[];
    flatList.addAll(coreModules);
    flatList.addAll(businessManagement);
    flatList.addAll(systemTools);
    flatList.addAll(settings);
    return flatList;
  }
}
