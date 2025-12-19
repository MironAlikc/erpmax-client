import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:flutter/material.dart';
import '../models/summary_model.dart';
import '../models/menu_item_model.dart';

abstract final class DashboardMocks {
  static const List<SummaryModel> summaryData = [
    SummaryModel(
      icon: Icons.attach_money,
      title: 'Total Revenue',
      value: 12450.75,
      changePercentage: 12.5,
      iconColor: AppColors.primary,
      iconBgColor: AppColors.primaryLight,
    ),
    // Остальные данные...
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
          route: '/journal',
        ),
      ],
    ),
  ];
}
