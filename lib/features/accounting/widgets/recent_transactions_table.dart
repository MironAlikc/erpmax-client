import 'package:flutter/material.dart';

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
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            "Latest financial activities and journal entries.",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
          ),
          const SizedBox(height: 24),
          Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2.5),
              3: FlexColumnWidth(1.2),
              4: FlexColumnWidth(0.8),
            },
            children: [
              _header(),
              _row(
                "JV-2024-001",
                "2024-03-20",
                "Office Rent Payment",
                "-\$5,000",
                "Posted",
                Colors.red,
              ),
              _row(
                "JV-2024-002",
                "2024-03-19",
                "Client Invoice #INV-001",
                "+\$12,500",
                "Posted",
                Colors.green,
              ),
              _row(
                "JV-2024-003",
                "2024-03-18",
                "Office Supplies",
                "-\$450",
                "Draft",
                Colors.orange,
              ),
              _row(
                "JV-2024-004",
                "2024-03-18",
                "Consulting Services",
                "+\$3,000",
                "Posted",
                Colors.green,
              ),
              _row(
                "JV-2024-005",
                "2024-03-17",
                "Internet Bill",
                "-\$120",
                "Posted",
                Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _header() => const TableRow(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Color(0xFFF1F5F9))),
    ),
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text("Reference", style: _headStl),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text("Date", style: _headStl),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text("Description", style: _headStl),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text("Amount", style: _headStl),
      ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Text("Status", style: _headStl),
      ),
    ],
  );

  static const _headStl = TextStyle(
    color: Color(0xFF64748B),
    fontWeight: FontWeight.w600,
    fontSize: 13,
  );

  TableRow _row(
    String ref,
    String date,
    String desc,
    String amt,
    String status,
    Color amtCol,
  ) {
    final bool isPosted = status == "Posted";
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            ref,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
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
            amt,
            style: TextStyle(color: amtCol, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isPosted
                  ? const Color(0xFFF0FDF4)
                  : const Color(0xFFFEF3C7),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isPosted
                    ? const Color(0xFF166534)
                    : const Color(0xFF92400E),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
