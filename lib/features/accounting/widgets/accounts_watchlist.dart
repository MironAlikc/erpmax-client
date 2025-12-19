import 'package:flutter/material.dart';

class AccountsWatchlist extends StatelessWidget {
  const AccountsWatchlist({super.key});

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
            "Accounts Watchlist",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _item("Cash on Hand", "1110 - Current Assets", "\$12,450"),
          _divider(),
          _item("Bank Al-Bilad", "1120 - Bank Accounts", "\$85,200"),
          _divider(),
          _item("Accounts Receivable", "1130 - Current Assets", "\$45,100"),
        ],
      ),
    );
  }

  Widget _item(String title, String sub, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            Text(
              sub,
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
            ),
          ],
        ),
        Text(
          val,
          style: const TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }

  Widget _divider() => Padding(
    padding: const EdgeInsets.symmetric(vertical: 12),
    child: Divider(color: Colors.grey[100], height: 1),
  );
}
