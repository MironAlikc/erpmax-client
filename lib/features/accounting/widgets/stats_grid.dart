import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildAppStatCard(
          "Total Revenue",
          "\$124,500",
          "+12.5%",
          Icons.trending_up,
          Colors.green,
        ),
        const SizedBox(width: 16),
        _buildAppStatCard(
          "Total Expenses",
          "\$45,200",
          "-2.4%",
          Icons.trending_down,
          Colors.red,
        ),
        const SizedBox(width: 16),
        _buildAppStatCard(
          "Net Profit",
          "\$79,300",
          "+8.2%",
          Icons.attach_money,
          Colors.blue,
        ),
        const SizedBox(width: 16),
        _buildAppStatCard(
          "Cash Flow",
          "\$32,000",
          "+5.1%",
          Icons.account_balance_wallet,
          Colors.purple,
        ),
      ],
    );
  }

  Widget _buildAppStatCard(
    String title,
    String value,
    String trend,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    trend,
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
