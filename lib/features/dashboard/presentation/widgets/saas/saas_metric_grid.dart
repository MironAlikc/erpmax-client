import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

import 'kpi_card.dart';

class SaasMetricGrid extends StatelessWidget {
  const SaasMetricGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final List<Map<String, dynamic>> metrics = [
      {
        'title': localizations.totalRevenue,
        'value': '\$128,430',
        'percent': '12.5%',
        'pos': true,
        'icon': Icons.payments,
      },
      {
        'title': localizations.activeUsers,
        'value': '14,210',
        'percent': '8.2%',
        'pos': true,
        'icon': Icons.people,
      },
      {
        'title': localizations.churnRate,
        'value': '2.4%',
        'percent': '0.5%',
        'pos': false,
        'icon': Icons.trending_down,
      },
      {
        'title': localizations.avgSession,
        'value': '12m 40s',
        'percent': '3.1%',
        'pos': true,
        'icon': Icons.timer,
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350,
        mainAxisExtent: 160,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: metrics.length,
      itemBuilder: (context, index) {
        final m = metrics[index];
        return KpiCard(
          title: m['title'],
          value: m['value'],
          percentage: m['percent'],
          isPositive: m['pos'],
          icon: m['icon'],
        );
      },
    );
  }
}
