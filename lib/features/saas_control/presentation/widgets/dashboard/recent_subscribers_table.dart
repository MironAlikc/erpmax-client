import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart';

class SaasSubscriberRecord {
  final String id;
  final String company;
  final String plan;
  final String status;
  final String date;
  final String startDate;
  final String endDate;
  final String price;

  const SaasSubscriberRecord({
    required this.id,
    required this.company,
    required this.plan,
    required this.status,
    required this.date,
    required this.startDate,
    required this.endDate,
    required this.price,
  });
}

class RecentSubscribersSection extends StatefulWidget {
  const RecentSubscribersSection({super.key});

  @override
  State<RecentSubscribersSection> createState() =>
      _RecentSubscribersSectionState();
}

class _RecentSubscribersSectionState extends State<RecentSubscribersSection> {
  // Состояние для выбранных элементов
  Set<String> _selectedSubscriberIds = {};

  final List<SaasSubscriberRecord> _subscribers = [
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

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    // Определяем колонки
    final List<ErpMaxColumn<SaasSubscriberRecord>> columns = [
      ErpMaxColumn(
        id: 'id',
        title: "ID",
        weight: 1.2,
        valueGetter: (i) => i.id,
        customCell: (item) => Text(
          item.id,
          style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
        ),
      ),
      ErpMaxColumn(
        id: 'company',
        title: "Company",
        weight: 3.0,
        valueGetter: (i) => i.company,
        customCell: (item) => Text(
          item.company,
          style: AppTextStyles.bodySmallBold.copyWith(color: theme.gray900),
        ),
      ),
      ErpMaxColumn(
        id: 'plan',
        title: "Plan",
        weight: 1.2,
        valueGetter: (i) => i.plan,
        customCell: (item) => Text(
          item.plan,
          style: AppTextStyles.bodySmall.copyWith(color: theme.gray600),
        ),
      ),
      ErpMaxColumn(
        id: 'price',
        title: "Price",
        weight: 1.2,
        textAlign: TextAlign.right,
        valueGetter: (i) => i.price,
        customCell: (item) => Text(
          "${item.price} \$",
          style: AppTextStyles.bodySmall.copyWith(color: theme.textPrimary),
        ),
      ),
      ErpMaxColumn(
        id: 'status',
        title: "Status",
        weight: 1.5,
        valueGetter: (i) => i.status,
        customCell: (item) => _buildStatusBadge(item.status, theme),
      ),
      ErpMaxColumn(
        id: 'date',
        title: "Date",
        weight: 1.8,
        valueGetter: (i) => i.date,
        customCell: (item) => Text(
          item.date,
          style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
        ),
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header section
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

          // Universal Table implementation
          UniversalErpTable<SaasSubscriberRecord>(
            items: _subscribers,
            columns: columns,
            minWidth: 850,
            idGetter: (item) => item.id,
            selectedIds: _selectedSubscriberIds,
            onSelectionChanged: (newSelection) {
              setState(() => _selectedSubscriberIds = newSelection);
            },
            // АКТИВАЦИЯ ВЕРТИКАЛЬНЫХ ПОЛОСОК
            showVerticalLines: true,
            onRowTap: (item) {
              debugPrint("Selected subscriber: ${item.company}");
            },
            totals: {
              'company': 'Total Count: ${_subscribers.length}',
              'price':
                  'Sum: ${_subscribers.fold(0, (sum, i) => sum + int.parse(i.price))} \$',
            },
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
