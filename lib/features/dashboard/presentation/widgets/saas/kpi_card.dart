// lib/features/dashboard/presentation/widgets/saas/kpi_card.dart
import 'package:flutter/material.dart';

class KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final String percentage;
  final bool isPositive;
  final IconData icon;

  const KpiCard({
    super.key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.isPositive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    Theme.of(context);
    final trendColor = isPositive
        ? const Color(0xFF027A48)
        : const Color(0xFFB42318);
    final trendBg = isPositive
        ? const Color(0xFFECFDF3)
        : const Color(0xFFFEF3F2);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEAECF0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F4F7),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: const Color(0xFF475467)),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: trendBg,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  percentage,
                  style: TextStyle(
                    color: trendColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Color(0xFF667085), fontSize: 14),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF101828),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
