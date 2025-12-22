import 'package:flutter/material.dart';
import 'saas_metric_grid.dart';

class SaaSContent extends StatelessWidget {
  const SaaSContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildHeader(context),
        const SizedBox(height: 32),
        const SaasMetricGrid(),
        const SizedBox(height: 32),
        // const SaasChartsView(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SaaS Analytics',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Overview of your platform performance',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download, size: 18),
          label: const Text('Export Report'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
