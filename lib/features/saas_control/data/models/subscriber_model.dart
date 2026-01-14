enum SubscriberStatus { active, expired, trial, suspended }

class SubscriberModel {
  final String company;
  final String email;
  final String plan;
  final SubscriberStatus status;
  final String startDate;
  final String endDate;
  final double currentStorage;
  final double maxStorage;
  final String price;
  final int currentUsers;
  final int maxUsers;

  const SubscriberModel({
    required this.company,
    required this.email,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.currentStorage,
    required this.maxStorage,
    required this.price,
    this.currentUsers = 0,
    this.maxUsers = 0,
  });
}
