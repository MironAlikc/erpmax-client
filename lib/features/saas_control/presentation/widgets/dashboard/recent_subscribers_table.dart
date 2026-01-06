import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart'; // Путь к вашему ErpMaxTable
import 'package:erpmax_client/features/saas_control/data/models/saas_subscriber_record.dart';
import 'package:flutter/material.dart';

class RecentSubscribersSection extends StatelessWidget {
  const RecentSubscribersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final List<SaasSubscriberRecord> subscribers = [
      const SaasSubscriberRecord(
        id: 'SUB-001',
        company: 'Al-Amal Co.',
        plan: 'Pro',
        status: 'Active',
        date: '2024-03-20',
        startDate: '2024-03-20',
        endDate: '2025-03-20',
        price: '1500',
      ),
      const SaasSubscriberRecord(
        id: 'SUB-002',
        company: 'Al-Noor Est.',
        plan: 'Basic',
        status: 'Trial',
        date: '2024-03-19',
        startDate: '2024-03-19',
        endDate: '2024-03-26',
        price: '0',
      ),
      const SaasSubscriberRecord(
        id: 'SUB-003',
        company: 'Build Corp',
        plan: 'Enterprise',
        status: 'Active',
        date: '2024-03-18',
        startDate: '2024-03-18',
        endDate: '2025-03-18',
        price: '5000',
      ),
      const SaasSubscriberRecord(
        id: 'SUB-004',
        company: 'Tech Group',
        plan: 'Pro',
        status: 'Pending',
        date: '2024-03-17',
        startDate: '2024-03-17',
        endDate: '2025-03-17',
        price: '1500',
      ),
      const SaasSubscriberRecord(
        id: 'SUB-005',
        company: 'Gulf Co.',
        plan: 'Basic',
        status: 'Active',
        date: '2024-03-16',
        startDate: '2024-03-16',
        endDate: '2025-03-16',
        price: '500',
      ),
    ];

    final tableColumns = [
      ErpMaxColumn(title: "ID", weight: 0.15),
      ErpMaxColumn(title: "Company", weight: 0.35),
      ErpMaxColumn(title: "Plan", weight: 0.15),
      ErpMaxColumn(title: "Status", weight: 0.15),
      ErpMaxColumn(title: "Date", weight: 0.20),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Subscribers",
                  style: AppTextStyles.bodySmallBold.copyWith(
                    fontSize: 16,
                    color: theme.gray900,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "View All",
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: theme.gray500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ErpMaxTable(
            minWidth: 800,
            columns: tableColumns,
            rows: subscribers.map((sub) {
              return ErpMaxRow(
                columns: tableColumns,
                cells: [
                  Text(
                    sub.id,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: theme.gray500,
                    ),
                  ),
                  Text(
                    sub.company,
                    style: AppTextStyles.bodySmallBold.copyWith(
                      color: theme.gray900,
                    ),
                  ),
                  Text(
                    sub.plan,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: theme.gray600,
                    ),
                  ),
                  _buildStatusBadge(sub.status, theme),
                  Text(
                    sub.date,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: theme.gray500,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(String status, dynamic theme) {
    Color bgColor;
    Color textColor;

    switch (status.toLowerCase()) {
      case 'active':
        bgColor = const Color(0xFFECFDF3);
        textColor = const Color(0xFF027A48);
        break;
      case 'trial':
        bgColor = const Color(0xFFF2F4F7);
        textColor = const Color(0xFF344054);
        break;
      case 'pending':
        bgColor = const Color(0xFFFFFAEB);
        textColor = const Color(0xFFB54708);
        break;
      default:
        bgColor = theme.gray50;
        textColor = theme.gray600;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: AppTextStyles.bodySmallBold.copyWith(
          color: textColor,
          fontSize: 12,
        ),
      ),
    );
  }
}
