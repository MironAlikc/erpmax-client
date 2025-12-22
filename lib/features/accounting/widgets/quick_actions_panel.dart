import 'package:flutter/material.dart';

class QuickActionsPanel extends StatelessWidget {
  const QuickActionsPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Quick Actions",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.3,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _item(Icons.description_outlined, "New Invoice"),
              _item(Icons.account_balance_wallet_outlined, "Record Expense"),
              _item(Icons.swap_horiz, "Transfer"),
              _item(Icons.file_download_outlined, "Import Statement"),
              _item(Icons.menu_book, "General Ledger"),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {},
              backgroundColor: const Color(0xFF00C58D),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _item(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
