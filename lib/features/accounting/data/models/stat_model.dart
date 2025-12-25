import 'package:erpmax_client/features/accounting/domain/entities/stat_entity.dart';

class StatModel extends StatEntity {
  const StatModel({
    required super.title,
    required super.value,
    required super.trend,
    required super.isPositive,
  });

  factory StatModel.fromJson(Map<String, dynamic> json) {
    return StatModel(
      title: json['title'] as String,
      value: json['value'] as String,
      trend: json['trend'] as String,
      isPositive: json['isPositive'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'value': value,
      'trend': trend,
      'isPositive': isPositive,
    };
  }

  StatEntity toEntity() {
    return StatEntity(
      title: title,
      value: value,
      trend: trend,
      isPositive: isPositive,
    );
  }
}
