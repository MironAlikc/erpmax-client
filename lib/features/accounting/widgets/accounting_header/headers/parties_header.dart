import 'package:erpmax_client/features/accounting/widgets/accounting_header/accounting_base_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/accounting_header_btn.dart';
import 'package:flutter/material.dart';

class PartiesHeader extends AccountingBaseHeader {
  const PartiesHeader({super.key, required super.currentTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentTab.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentTab.description ?? '',
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 12,
            children: [
              AccountingHeaderBtn(
                label: "Export",
                icon: Icons.ios_share,
                isOutline: true,
              ),
              AccountingHeaderBtn(
                label: "Journal Entry",
                icon: Icons.add,
                color: const Color(0xFF12203A),
              ),
              AccountingHeaderBtn(
                label: "Cash Journal",
                icon: Icons.account_balance_wallet,
                color: const Color(0xFF00C58D),
              ),
              AccountingHeaderBtn(
                label: "In",
                icon: Icons.arrow_downward,
                color: const Color(0xFF22C55E),
              ),
              AccountingHeaderBtn(
                label: "Out",
                icon: Icons.arrow_upward,
                color: const Color(0xFFEF4444),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
