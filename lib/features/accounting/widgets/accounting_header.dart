import 'package:flutter/material.dart';

class AccountingHeader extends StatelessWidget {
  const AccountingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Accounting Dashboard",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Color(0xFF1E293B)),
            ),
            Text("Manage labor costs and production analysis", 
              style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          ],
        ),
        const Spacer(),
        _actionButton("Export Report", Icons.ios_share, isOutlined: true),
        const SizedBox(width: 12),
        _actionButton("Journal Entry", Icons.add, color: const Color(0xFF0F172A)),
        const SizedBox(width: 12),
        _actionButton("Cash Journal", Icons.account_balance_wallet_outlined, color: const Color(0xFF52D1A4)),
        const SizedBox(width: 12),
        _actionButton("Receipts", Icons.arrow_downward, color: const Color(0xFF22C55E)),
        const SizedBox(width: 12),
        _actionButton("Payments", Icons.arrow_upward, color: const Color(0xFFEF4444)),
      ],
    );
  }

  Widget _actionButton(String label, IconData icon, {Color? color, bool isOutlined = false}) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOutlined ? Colors.white : color,
        foregroundColor: isOutlined ? const Color(0xFF1E293B) : Colors.white,
        elevation: 0,
        side: isOutlined ? const BorderSide(color: Color(0xFFE2E8F0)) : BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}