class QuickActionEntity {
  final String id;
  final String label;
  final String iconName;
  final String? route;

  const QuickActionEntity({
    required this.id,
    required this.label,
    required this.iconName,
    this.route,
  });
}
