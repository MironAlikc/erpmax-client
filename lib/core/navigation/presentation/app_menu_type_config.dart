import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

enum AppMenuType {
  dashboard,
  accounting,
  inventory,
  sales,
  customerManagement,
  realEstateAsset,
  pos,
  exchangeAndRemittances,
  purchases,
  manufacturing,
  hrManagement,
  saasControl,
  aiAnalytics,
  authPages,
  settings,
}

class MenuDataItem {
  final AppMenuType type;
  final String Function(AppLocalizations) title;
  final IconData icon;

  const MenuDataItem({
    required this.type,
    required this.title,
    required this.icon,
  });
}

abstract final class AppMenuConfig {
  static List<MenuDataItem> getMenuItems(AppLocalizations l10n) {
    return [
      MenuDataItem(
        type: AppMenuType.dashboard,
        title: (l) => l.menuDashboard,
        icon: LucideIcons.layoutGrid,
      ),
      MenuDataItem(
        type: AppMenuType.accounting,
        title: (l) => l.menuAccounting,
        icon: LucideIcons.calculator,
      ),
      MenuDataItem(
        type: AppMenuType.inventory,
        title: (l) => l.menuInventory,
        icon: LucideIcons.package,
      ),
      MenuDataItem(
        type: AppMenuType.sales,
        title: (l) => l.menuSales,
        icon: LucideIcons.shoppingCart,
      ),
      MenuDataItem(
        type: AppMenuType.customerManagement,
        title: (l) => l.menuCustomerManagement,
        icon: LucideIcons.users,
      ),
      MenuDataItem(
        type: AppMenuType.realEstateAsset,
        title: (l) => l.menuRealEstate,
        icon: LucideIcons.building2,
      ),
      MenuDataItem(
        type: AppMenuType.pos,
        title: (l) => l.menuPOS,
        icon: LucideIcons.scan,
      ),
      MenuDataItem(
        type: AppMenuType.exchangeAndRemittances,
        title: (l) => l.menuExchange,
        icon: LucideIcons.arrowLeftRight,
      ),
      MenuDataItem(
        type: AppMenuType.purchases,
        title: (l) => l.menuPurchases,
        icon: LucideIcons.shoppingBag,
      ),
      MenuDataItem(
        type: AppMenuType.manufacturing,
        title: (l) => l.menuManufacturing,
        icon: LucideIcons.factory,
      ),
      MenuDataItem(
        type: AppMenuType.hrManagement,
        title: (l) => l.menuHR,
        icon: LucideIcons.userCog,
      ),
      MenuDataItem(
        type: AppMenuType.saasControl,
        title: (l) => l.menuSaaS,
        icon: LucideIcons.crown,
      ),
      MenuDataItem(
        type: AppMenuType.aiAnalytics,
        title: (l) => l.menuAI,
        icon: LucideIcons.brain,
      ),
      MenuDataItem(
        type: AppMenuType.authPages,
        title: (l) => l.menuAuthPages,
        icon: LucideIcons.lock,
      ),
      MenuDataItem(
        type: AppMenuType.settings,
        title: (l) => l.menuSettings,
        icon: LucideIcons.settings,
      ),
    ];
  }

  static int getIndexByType(AppMenuType type, AppLocalizations l10n) {
    return getMenuItems(l10n).indexWhere((item) => item.type == type);
  }
}
