import 'package:flutter/material.dart';
import '../../domain/entities/module_tab_entity.dart';

class ModuleTabModel extends ModuleTabEntity {
  final IconData icon;

  const ModuleTabModel({
    required super.name,
    required this.icon,
  });

  factory ModuleTabModel.fromEntity(
    ModuleTabEntity entity, {
    required IconData icon,
  }) {
    return ModuleTabModel(
      name: entity.name,
      icon: icon,
    );
  }

  ModuleTabEntity toEntity() {
    return ModuleTabEntity(name: name);
  }
}
