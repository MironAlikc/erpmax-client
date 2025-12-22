import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import '../models/summary_model.dart';
import 'package:erpmax_client/core/models/menu_item_model.dart';

abstract final class DashboardMocks {
  static const List<SummaryModel> summaryData = [
    SummaryModel(
      icon: Icons.attach_money_rounded,
      title: 'Total Revenue',
      value: 12450.75,
      changePercentage: 12.5,
      iconColor: AppColors.primary,
      iconBgColor: AppColors.primaryLight,
    ),
    SummaryModel(
      icon: Icons.shopping_bag_outlined,
      title: 'Active Orders',
      value: 85.0,
      changePercentage: 8.2,
      iconColor: AppColors.success,
      iconBgColor: AppColors.successBg,
    ),
    SummaryModel(
      icon: Icons.people_outline_rounded,
      title: 'New Customers',
      value: 12.0,
      changePercentage: -2.4,
      iconColor: Color(0xFF6366F1),
      iconBgColor: Color(0xFFEEF2FF),
    ),
    SummaryModel(
      icon: Icons.account_balance_wallet_outlined,
      title: 'Total Expenses',
      value: 4320.50,
      changePercentage: 5.1,
      iconColor: AppColors.error,
      iconBgColor: AppColors.errorBg,
    ),
  ];

  static const List<MenuItemModel> menuItems = [
    MenuItemModel(
      title: 'Dashboards',
      icon: Icons.dashboard_outlined,
      route: '/dashboard',
    ),
    MenuItemModel(
      title: 'Accounting',
      icon: Icons.account_balance_wallet_outlined,
      children: [
        MenuItemModel(
          title: 'Journal Entries',
          icon: Icons.receipt_long_outlined,
          route: '/accounting/journal',
        ),
        MenuItemModel(
          title: 'Funds & Banks',
          icon: Icons.account_balance_outlined,
          route: '/accounting/funds',
        ),
        MenuItemModel(
          title: 'Chart of Accounts',
          icon: Icons.account_tree_outlined,
          route: '/accounting/chart',
        ),
      ],
    ),
    MenuItemModel(
      title: 'Sales',
      icon: Icons.shopping_cart_outlined,
      children: [
        MenuItemModel(
          title: 'Invoices',
          icon: Icons.description_outlined,
          route: '/sales/invoices',
        ),
        MenuItemModel(
          title: 'Customers',
          icon: Icons.people_outline,
          route: '/sales/customers',
        ),
      ],
    ),
    MenuItemModel(
      title: 'Inventory',
      icon: Icons.inventory_2_outlined,
      route: '/inventory',
    ),
    MenuItemModel(
      title: 'Settings',
      icon: Icons.settings_outlined,
      route: '/settings',
    ),
  ];
}
