// lib/features/subscription/presentation/pages/subscription_management_view.dart

import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

enum SubscriberStatus { active, expired, pending }

class SubscriberModel {
  final String companyName;
  final String planName;
  final SubscriberStatus status;
  final String date;
  final int users;

  const SubscriberModel({
    required this.companyName,
    required this.planName,
    required this.status,
    required this.date,
    required this.users,
  });
}

class SubscribersContent extends StatelessWidget {
  const SubscribersContent({super.key});
  static const List<SubscriberModel> _subscribers = [
    SubscriberModel(
      companyName: "Tech Solutions Co.",
      planName: "Enterprise",
      status: SubscriberStatus.active,
      date: "2024-12-01",
      users: 45,
    ),
    SubscriberModel(
      companyName: "Al-Amal Trading",
      planName: "Professional",
      status: SubscriberStatus.active,
      date: "2024-11-15",
      users: 12,
    ),
    SubscriberModel(
      companyName: "Future Vision",
      planName: "Starter",
      status: SubscriberStatus.expired,
      date: "2024-01-20",
      users: 3,
    ),
    SubscriberModel(
      companyName: "Global Logistics",
      planName: "Enterprise",
      status: SubscriberStatus.active,
      date: "2025-03-10",
      users: 120,
    ),
    SubscriberModel(
      companyName: "Smart Retail",
      planName: "Professional",
      status: SubscriberStatus.pending,
      date: "2024-06-01",
      users: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppDesign.cardRadius),
          border: Border.all(color: AppColors.gray200),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text("Subscribers", style: AppTextStyles.h2),
            ),
            ErpMaxDataTable<SubscriberModel>(
              items: _subscribers, // Теперь имя определено выше
              minWidth: 1100,
              columns: [
                ErpMaxColumn(
                  title: "Company Name",
                  weight: 0.35,
                  isSortable: true,
                  sortKey: 'company',
                ),
                ErpMaxColumn(
                  title: "Plan Name",
                  weight: 0.15,
                  isSortable: true,
                  sortKey: 'plan',
                ),
                ErpMaxColumn(
                  title: "Status",
                  weight: 0.20,
                  isSortable: true,
                  sortKey: 'status',
                ),
                ErpMaxColumn(
                  title: "Date",
                  weight: 0.15,
                  isSortable: true,
                  sortKey: 'date',
                ),
                ErpMaxColumn(
                  title: "Users",
                  weight: 0.10,
                  isSortable: true,
                  sortKey: 'users',
                  textAlign: TextAlign.center,
                ),
                ErpMaxColumn(
                  title: "Actions",
                  weight: 0.05,
                  textAlign: TextAlign.right,
                ),
              ],
              rowBuilder: (item) => [
                Text(
                  item.companyName,
                  style: AppTextStyles.labelStyle.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1E293B),
                  ),
                ),
                Text(item.planName, style: AppTextStyles.bodyMedium),
                _SubscriptionStatusBadge(status: item.status),
                Text(item.date, style: AppTextStyles.bodyMedium),
                Text(
                  item.users.toString(),
                  style: AppTextStyles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const Icon(Icons.more_horiz, color: AppColors.gray400),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- Бейдж статуса ---
class _SubscriptionStatusBadge extends StatelessWidget {
  final SubscriberStatus status;
  const _SubscriptionStatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    String label;

    switch (status) {
      case SubscriberStatus.active:
        bgColor = const Color(0xFF0F172A);
        textColor = Colors.white;
        label = "Active";
        break;
      case SubscriberStatus.expired:
        bgColor = const Color(0xFFFEE2E2);
        textColor = const Color(0xFFEF4444);
        label = "Expired";
        break;
      case SubscriberStatus.pending:
        bgColor = const Color(0xFFF1F5F9);
        textColor = const Color(0xFF64748B);
        label = "Pending";
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
