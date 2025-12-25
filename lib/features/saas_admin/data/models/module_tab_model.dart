import 'package:erpmax_client/features/saas_admin/domain/entities/module_tab_entity.dart';
import 'package:flutter/material.dart';

class ModuleTabModel extends ModuleTabEntity {
  final IconData icon;

  const ModuleTabModel({required super.name, required this.icon});

  factory ModuleTabModel.fromEntity(
    ModuleTabEntity entity, {
    required IconData icon,
  }) {
    return ModuleTabModel(name: entity.name, icon: icon);
  }

  ModuleTabEntity toEntity() {
    return ModuleTabEntity(name: name);
  }
}
