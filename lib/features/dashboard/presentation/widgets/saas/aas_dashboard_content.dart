import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
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
    final localizations = AppLocalizations.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations.saasAnalytics,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              localizations.saasAnalyticsDesc,
              style: AppTextStyles.bodySmall.copyWith(
                color: context.theme.appColor.gray500,
              ),
            ),
          ],
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.download, size: 18),
          label: Text(localizations.exportReport),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        ),
      ],
    );
  }
}
