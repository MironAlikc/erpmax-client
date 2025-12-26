import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'invoice_stat_card.dart';

class StatItem {
  final String title;
  final String value;
  final IconData icon;
  final Color baseColor;

  const StatItem({
    required this.title,
    required this.value,
    required this.icon,
    required this.baseColor,
  });
}

class SummaryStatsGrid extends StatelessWidget {
  final List<StatItem> items;

  const SummaryStatsGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: items.asMap().entries.map((entry) {
        int idx = entry.key;
        StatItem item = entry.value;

        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: idx != items.length - 1 ? 12 : 0),
            child: SizedBox(
              height: 84,
              child: InvoiceStatCard(
                title: item.title,
                value: item.value,
                icon: item.icon,
                bgColor: item.baseColor.withOpacity(0.05),
                borderColor: item.baseColor.withOpacity(0.12),
                iconBgColor: item.baseColor,
                textColor: item.baseColor,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
