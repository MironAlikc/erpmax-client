import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import '../models/summary_model.dart';
import '../models/subscription_model.dart';

abstract class DashboardLocalDataSource {
  List<SummaryModel> getSummaryData();
  List<SubscriptionModel> getSubscriptions();
}

class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  @override
  List<SummaryModel> getSummaryData() {
    return const [
      SummaryModel(
        icon: Icons.attach_money_rounded,
        title: 'Total Revenue',
        value: 12450.75,
        changePercentage: 12.5,
        iconColor: AppColors.primary,
        iconBgColor: AppColors.primaryLight,
      ),
      SummaryModel(
        icon: Icons.shopping_bag_outlined,
        title: 'Active Orders',
        value: 85.0,
        changePercentage: 8.2,
        iconColor: AppColors.success,
        iconBgColor: AppColors.successBg,
      ),
      SummaryModel(
        icon: Icons.people_outline_rounded,
        title: 'New Customers',
        value: 12.0,
        changePercentage: -2.4,
        iconColor: Color(0xFF6366F1),
        iconBgColor: Color(0xFFEEF2FF),
      ),
      SummaryModel(
        icon: Icons.account_balance_wallet_outlined,
        title: 'Total Expenses',
        value: 4320.50,
        changePercentage: 5.1,
        iconColor: AppColors.error,
        iconBgColor: AppColors.errorBg,
      ),
    ];
  }

  @override
  List<SubscriptionModel> getSubscriptions() {
    return const [
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
}
