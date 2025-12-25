import '../../domain/entities/quick_action_entity.dart';

class QuickActionModel extends QuickActionEntity {
  const QuickActionModel({
    required super.id,
    required super.label,
    required super.iconName,
    super.route,
  });

  factory QuickActionModel.fromJson(Map<String, dynamic> json) {
    return QuickActionModel(
      id: json['id'] as String,
      label: json['label'] as String,
      iconName: json['iconName'] as String,
      route: json['route'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'label': label,
      'iconName': iconName,
      if (route != null) 'route': route,
    };
  }

  QuickActionEntity toEntity() {
    return QuickActionEntity(
      id: id,
      label: label,
      iconName: iconName,
      route: route,
    );
  }
}
