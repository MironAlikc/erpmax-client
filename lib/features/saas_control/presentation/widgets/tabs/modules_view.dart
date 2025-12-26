import 'package:erpmax_client/core/widgets/tables_cards/app_section.dart';
import 'package:erpmax_client/features/saas_control/presentation/widgets/shared/module_card_simple.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ModulesView extends StatelessWidget {
  const ModulesView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> modules = [
      {
        "name": "Accounting",
        "icon": CupertinoIcons.money_dollar,
        "isActive": true,
      },
      {
        "name": "Inventory",
        "icon": CupertinoIcons.archivebox,
        "isActive": true,
      },
      {"name": "Sales", "icon": CupertinoIcons.cart, "isActive": true},
      {"name": "Purchases", "icon": CupertinoIcons.bag, "isActive": true},
      {"name": "HR", "icon": CupertinoIcons.person_2, "isActive": false},
      {"name": "CRM", "icon": CupertinoIcons.group, "isActive": false},
      {
        "name": "AI Analytics",
        "icon": CupertinoIcons.graph_square,
        "isActive": false,
      },
      {
        "name": "SaaS Control",
        "icon": CupertinoIcons.settings,
        "isActive": false,
      },
    ];

    return AppSection(
      title: "Available Modules",
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: modules.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          mainAxisExtent: 64,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final module = modules[index];
          return ModuleCardSimple(
            name: module["name"],
            icon: module["icon"],
            isActive: module["isActive"],
            onTap: () {},
          );
        },
      ),
    );
  }
}
