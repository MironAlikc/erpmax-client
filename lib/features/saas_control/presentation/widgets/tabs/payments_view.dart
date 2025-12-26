import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import '../shared/backup_action_buttons.dart';
import '../shared/summary_stats_grid.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final columns = getColumns();
    final List<Map<String, dynamic>> paymentData = [
      {
        "id": "PAY-2025-001",
        "method": "Bank Transfer",
        "amount": "15,000 SAR",
        "date": "2025-12-26",
        "status": "Successful",
      },
      {
        "id": "PAY-2025-002",
        "method": "Credit Card",
        "amount": "2,450 SAR",
        "date": "2025-12-25",
        "status": "Pending",
      },
    ];
    final List<Widget> tableRows = paymentData.map((data) {
      return ErpMaxRow(
        columns: columns,
        cells: [
          Text(
            data['id'],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          Text(data['method'], style: const TextStyle(fontSize: 14)),
          Text(
            data['amount'],
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            data['date'],
            style: const TextStyle(fontSize: 14, color: Color(0xFF6B7280)),
          ),
          _buildStatusBadge(data['status']),
          const Icon(
            CupertinoIcons.ellipsis_vertical,
            size: 18,
            color: Color(0xFF9CA3AF),
          ),
        ],
        onTap: () => print("Clicked on ${data['id']}"),
      );
    }).toList();

    return Container(
      color: const Color(0xFFF9FAFB),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PaymentsHeader(),
            const SizedBox(height: 24),
            const SummaryStatsGrid(
              items: [
                StatItem(
                  title: "Total Received",
                  value: "17,450 SAR",
                  icon: CupertinoIcons.arrow_up_right,
                  baseColor: Color(0xFF10B981),
                ),
                StatItem(
                  title: "Total Refunded",
                  value: "0 SAR",
                  icon: CupertinoIcons.arrow_down_left,
                  baseColor: Color(0xFFEF4444),
                ),
                StatItem(
                  title: "Successful Payments",
                  value: "1",
                  icon: CupertinoIcons.check_mark_circled,
                  baseColor: Color(0xFF3B82F6),
                ),
                StatItem(
                  title: "Failed Payments",
                  value: "0",
                  icon: CupertinoIcons.xmark_circle,
                  baseColor: Color(0xFFF59E0B),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: PaymentsFilters(),
                  ),

                  if (tableRows.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 60),
                      child: Center(
                        child: Text(
                          "No payments found",
                          style: TextStyle(color: Color(0xFF9CA3AF)),
                        ),
                      ),
                    )
                  else
                    ErpMaxTable(
                      columns: columns,
                      rows: tableRows,
                      minWidth: 1000,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<ErpMaxColumn> getColumns() => [
    ErpMaxColumn(title: "Payment ID", weight: 0.2),
    ErpMaxColumn(title: "Method", weight: 0.15),
    ErpMaxColumn(title: "Amount", weight: 0.15),
    ErpMaxColumn(title: "Date", weight: 0.2),
    ErpMaxColumn(title: "Status", weight: 0.15),
    ErpMaxColumn(title: "Actions", weight: 0.15, textAlign: TextAlign.right),
  ];

  Widget _buildStatusBadge(String status) {
    bool isSuccess = status == "Successful";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSuccess ? const Color(0xFFECFDF5) : const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isSuccess ? const Color(0xFF10B981) : const Color(0xFFF59E0B),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class PaymentsHeader extends StatelessWidget {
  const PaymentsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          CupertinoIcons.creditcard,
          color: Color(0xFF10B981),
          size: 26,
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Payment History",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                    ),
                  ),
                  SizedBox(width: 8),
                  CompanyBadge(text: "StartUp Inc"),
                ],
              ),
              Text(
                "Track all payments and financial transactions",
                style: TextStyle(fontSize: 13, color: Color(0xFF6B7280)),
              ),
            ],
          ),
        ),
        BackupSecondaryButton(
          icon: CupertinoIcons.tray_arrow_down,
          label: "Export",
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        BackupPrimaryButton(
          icon: CupertinoIcons.add,
          label: "Record Payment",
          onPressed: () {},
        ),
      ],
    );
  }
}

class PaymentsFilters extends StatelessWidget {
  const PaymentsFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 40,
            child: CupertinoSearchTextField(
              placeholder: "Search payments...",
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              style: const TextStyle(fontSize: 14),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const FilterDropdown(text: "All Statuses"),
        const SizedBox(width: 12),
        const FilterDropdown(text: "All Methods"),
        const Spacer(),
        const Text(
          "2 Payments",
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class FilterDropdown extends StatelessWidget {
  final String text;
  const FilterDropdown({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF374151),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 12),
          const Icon(
            CupertinoIcons.chevron_up_chevron_down,
            size: 14,
            color: Color(0xFF6B7280),
          ),
        ],
      ),
    );
  }
}

class CompanyBadge extends StatelessWidget {
  final String text;
  const CompanyBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}
