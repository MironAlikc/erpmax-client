import 'package:flutter/material.dart';

class StatsGrid extends StatelessWidget {
  const StatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardWidth = (constraints.maxWidth - (20 * 3)) / 4;

        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            _StatItem(
              title: "Total Revenue",
              value: "\$124,500",
              trend: "+12.5%",
              isUp: true,
              icon: Icons.trending_up,
              width: cardWidth,
            ),
            _StatItem(
              title: "Total Expenses",
              value: "\$45,200",
              trend: "-2.4%",
              isUp: false,
              icon: Icons.trending_down,
              width: cardWidth,
            ),
            _StatItem(
              title: "Net Profit",
              value: "\$79,300",
              trend: "+8.2%",
              isUp: true,
              icon: Icons.attach_money,
              width: cardWidth,
            ),
            _StatItem(
              title: "Cash Flow",
              value: "\$32,000",
              trend: "+5.1%",
              isUp: true,
              icon: Icons.account_balance_wallet_outlined,
              width: cardWidth,
            ),
          ],
        );
      },
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title, value, trend;
  final bool isUp;
  final IconData icon;
  final double width;

  const _StatItem({
    required this.title,
    required this.value,
    required this.trend,
    required this.isUp,
    required this.icon,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.clamp(250, 500),
      padding: const EdgeInsets.all(24),
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FAFC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 24, color: const Color(0xFF1E293B)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isUp
                      ? const Color(0xFFF0FDF4)
                      : const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  trend,
                  style: TextStyle(
                    color: isUp
                        ? const Color(0xFF166534)
                        : const Color(0xFF991B1B),
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172A),
            ),
          ),
        ],
      ),
    );
  }
}
