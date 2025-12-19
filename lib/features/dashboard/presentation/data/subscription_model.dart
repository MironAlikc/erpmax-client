// lib/features/dashboard/presentation/data/subscription_model.dart

class SubscriptionModel {
  final String subNumber,
      client,
      package,
      startDate,
      endDate,
      tags,
      amount,
      paymentStatus;

  const SubscriptionModel({
    required this.subNumber,
    required this.client,
    required this.package,
    required this.startDate,
    required this.endDate,
    required this.tags,
    required this.amount,
    required this.paymentStatus,
  });

  static const List<SubscriptionModel> mockData = [
    SubscriptionModel(
      subNumber: 'SUB-001',
      client: 'Trading Company "Al-Amal"',
      package: 'Full Package',
      startDate: '15/01/2024',
      endDate: '14/01/2025',
      tags: 'Active',
      amount: '₴ 6000',
      paymentStatus: 'Paid',
    ),
    SubscriptionModel(
      subNumber: 'SUB-002',
      client: 'Al-Nur Foundation',
      package: 'Basic Package',
      startDate: '20/02/2024',
      endDate: '19/02/2025',
      tags: 'Active',
      amount: '₴ 3,600',
      paymentStatus: 'Paid',
    ),
    SubscriptionModel(
      subNumber: 'SUB-003',
      client: 'Modern Construction Company',
      package: 'Extended Package',
      startDate: '04/05/2023',
      endDate: '03/09/2025',
      tags: 'Late',
      amount: '₴ 4800',
      paymentStatus: 'Late',
    ),
    SubscriptionModel(
      subNumber: 'SUB-004',
      client: 'Trade Establishment "Al-Safa"',
      package: 'Full Package',
      startDate: '05/12/2023',
      endDate: '04/04/2024',
      tags: 'Expired',
      amount: '₴ 6000',
      paymentStatus: 'Expired',
    ),
    SubscriptionModel(
      subNumber: 'SUB-005',
      client: 'Al Fajr Electronics Company',
      package: 'Extended Package',
      startDate: '03/10/2024',
      endDate: '05/11/2024',
      tags: 'Cancelled',
      amount: '₴ 4800',
      paymentStatus: 'Received',
    ),
  ];
}
