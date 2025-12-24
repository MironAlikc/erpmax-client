import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:flutter/material.dart';

abstract class AccountingBaseHeader extends StatelessWidget {
  final ModuleTabItem currentTab;
  const AccountingBaseHeader({super.key, required this.currentTab});
}
