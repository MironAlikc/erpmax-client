import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/shared/app_status_chip.dart';

class RecentTransactionsTable extends StatelessWidget {
  const RecentTransactionsTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Recent Transactions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Latest financial activities and journal entries.",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
          ),
          const SizedBox(height: 24),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2.5),
              3: FlexColumnWidth(1.2),
              4: FlexColumnWidth(1),
            },
            children: [
              _headerRow(),
              _dataRow(
                "JV-2024-001",
                "2024-03-20",
                "Office Rent Payment",
                "-\$5,000",
                "Posted",
                isNegative: true,
              ),
              _dataRow(
                "JV-2024-002",
                "2024-03-19",
                "Client Invoice #INV-001",
                "+\$12,500",
                "Posted",
                isNegative: false,
              ),
              _dataRow(
                "JV-2024-003",
                "2024-03-18",
                "Office Supplies",
                "-\$450",
                "Draft",
                isNegative: true,
                isDraft: true,
              ),
              _dataRow(
                "JV-2024-004",
                "2024-03-18",
                "Consulting Services",
                "+\$3,000",
                "Posted",
                isNegative: false,
              ),
              _dataRow(
                "JV-2024-005",
                "2024-03-17",
                "Internet Bill",
                "-\$120",
                "Posted",
                isNegative: true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _headerRow() {
    return const TableRow(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Reference",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Date",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Description",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Amount",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Text(
            "Status",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(0xFF64748B),
            ),
          ),
        ),
      ],
    );
  }

  TableRow _dataRow(
    String ref,
    String date,
    String desc,
    String amount,
    String status, {
    bool isNegative = false,
    bool isDraft = false,
  }) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            ref,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E293B),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(date, style: const TextStyle(color: Color(0xFF64748B))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            desc,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            amount,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isNegative
                  ? const Color(0xFFEF4444)
                  : const Color(0xFF22C55E),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: isDraft
                ? AppStatusChip.warning(status)
                : AppStatusChip.success(status),
          ),
        ),
      ],
    );
  }
}
