// lib/features/subscription/presentation/pages/subscription_management_view.dart

import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

class SubscriptionData {
  final String company, package, endDate, tag, amount, paymentStatus;
  SubscriptionData({
    required this.company,
    required this.package,
    required this.endDate,
    required this.tag,
    required this.amount,
    required this.paymentStatus,
  });
}

class SubscriptionManagementView extends StatefulWidget {
  const SubscriptionManagementView({super.key});

  @override
  State<SubscriptionManagementView> createState() =>
      _SubscriptionManagementViewState();
}

class _SubscriptionManagementViewState
    extends State<SubscriptionManagementView> {
  final List<SubscriptionData> _data = [
    SubscriptionData(
      company: 'Trading Company "Al-Amal"',
      package: 'Full Package',
      endDate: '14/01/2025',
      tag: 'Active',
      amount: '6000',
      paymentStatus: 'Paid',
    ),
    SubscriptionData(
      company: 'Al-Nur Foundation',
      package: 'Basic Package',
      endDate: '19/02/2025',
      tag: 'Active',
      amount: '3,600',
      paymentStatus: 'Paid',
    ),
    SubscriptionData(
      company: 'Modern Construction Company',
      package: 'Extended Package',
      endDate: '03/09/2025',
      tag: 'Active',
      amount: '4800',
      paymentStatus: 'Late',
    ),
    SubscriptionData(
      company: 'Trade Establishment "Al-Safa"',
      package: 'Full Package',
      endDate: '04/04/2024',
      tag: 'Expired',
      amount: '6000',
      paymentStatus: 'Paid',
    ),
    SubscriptionData(
      company: 'Al Fajr Electronics Company',
      package: 'Extended Package',
      endDate: '05/11/2024',
      tag: 'Cancelled',
      amount: '4800',
      paymentStatus: 'Received',
    ),
  ];

  // Конфигурация колонок (теперь без textAlign: null)
  final List<ErpMaxColumn> _columns = [
    ErpMaxColumn(
      title: 'Company Name',
      weight: 2.5,
      isSortable: true,
      sortKey: 'name',
    ),
    ErpMaxColumn(
      title: 'Package',
      weight: 1.5,
      isSortable: true,
      sortKey: 'package',
    ),
    ErpMaxColumn(
      title: 'End Date',
      weight: 1.2,
      isSortable: true,
      sortKey: 'date',
    ),
    ErpMaxColumn(title: 'Tags', weight: 1.0),
    ErpMaxColumn(title: 'Amount', weight: 1.0, textAlign: TextAlign.right),
    ErpMaxColumn(title: 'Payment Status', weight: 1.2),
    ErpMaxColumn(title: '', weight: 0.4, textAlign: TextAlign.center),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _buildTableToolbar(),
          Expanded(
            child: ErpMaxDataTable<SubscriptionData>(
              columns: _columns,
              items: _data,
              // minWidth задан внутри ErpMaxDataTable по умолчанию 1100
              onRowTap: (item) => debugPrint('Tapped on ${item.company}'),
              rowBuilder: (item) => [
                Text(
                  item.company,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF101828),
                    fontSize: 14,
                  ),
                ),
                Text(
                  item.package,
                  style: const TextStyle(
                    color: Color(0xFF475467),
                    fontSize: 14,
                  ),
                ),
                Text(
                  item.endDate,
                  style: const TextStyle(
                    color: Color(0xFF475467),
                    fontSize: 14,
                  ),
                ),
                _StatusChip(item.tag),
                Text(
                  '₪ ${item.amount}',
                  style: const TextStyle(
                    color: Color(0xFF101828),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _StatusChip(item.paymentStatus),
                const Icon(Icons.more_vert, color: Color(0xFF98A2B3), size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableToolbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          const Text(
            'Subscribers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          _buildSearchField(),
          const SizedBox(width: 12),
          _buildResetButton(),
          const SizedBox(width: 12),
          _buildNewSubscriptionButton(),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return SizedBox(
      width: 250,
      height: 40,
      child: TextField(
        style: const TextStyle(fontSize: 14),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF667085)),
          prefixIcon: const Icon(
            Icons.search,
            size: 18,
            color: Color(0xFF667085),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFD0D5DD)),
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.filter_list, size: 18),
      label: const Text('Reset Filters'),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFF344054),
        side: const BorderSide(color: Color(0xFFD0D5DD)),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  Widget _buildNewSubscriptionButton() {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add, size: 18),
      label: const Text('New Subscription'),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2E6FF1),
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String label;
  const _StatusChip(this.label);

  @override
  Widget build(BuildContext context) {
    Color bg, text;
    // Логика выбора цвета на основе статуса
    switch (label) {
      case 'Active':
      case 'Paid':
        bg = const Color(0xFFECFDF3);
        text = const Color(0xFF027A48);
        break;
      case 'Late':
        bg = const Color(0xFFFFFAEB);
        text = const Color(0xFFB54708);
        break;
      case 'Expired':
      case 'Cancelled':
        bg = const Color(0xFFFEF3F2);
        text = const Color(0xFFB42318);
        break;
      case 'Received':
        bg = const Color(0xFFF2F4F7);
        text = const Color(0xFF344054);
        break;
      default:
        bg = const Color(0xFFF9FAFB);
        text = const Color(0xFF344054);
    }

    return UnconstrainedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: text,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
