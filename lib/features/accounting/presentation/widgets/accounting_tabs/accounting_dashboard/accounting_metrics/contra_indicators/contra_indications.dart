import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/contra_indicators/contra_indications_card.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/contra_indicators/contra_indications_data.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ContraIndicatorsMetrics extends StatelessWidget {
  const ContraIndicatorsMetrics({super.key, required this.columns});

  final int columns;

  static const double _cardHeight = 146;
  static const double _spacing = 16;

  @override
  Widget build(BuildContext context) {
    final metrics = _metrics(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth;

        final itemWidth = (maxWidth - (_spacing * (columns - 1))) / columns;

        return Wrap(
          spacing: _spacing,
          runSpacing: _spacing,
          children: metrics.map((metric) {
            return SizedBox(
              width: itemWidth,
              height: _cardHeight,
              child: MetricCard(data: metric),
            );
          }).toList(),
        );
      },
    );
  }

  List<ContraIndicationsData> _metrics(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return [
      ContraIndicationsData(
        title: localizations.accCurrentRatio,
        value: '2.4x',
        target: 'Target: 2x',
        metric: 'Healthy',
        status: ContraIndicationsStatus.success,
        icon: LucideIcons.percent,
        iconColor: theme.infoText,
      ),
      ContraIndicationsData(
        title: localizations.accNetMargin,
        value: '18.5%',
        target: 'Target: 15%',
        status: ContraIndicationsStatus.success,
        progress: 0.75,
        icon: LucideIcons.trendingUp,
        iconColor: theme.sidebarActiveIcon,
      ),
      ContraIndicationsData(
        title: localizations.accAvgCollection,
        value: '32 days',
        target: 'Target: 30 days',
        metric: '+2',
        status: ContraIndicationsStatus.warning,
        icon: LucideIcons.clock,
        iconColor: theme.warningText,
      ),
      ContraIndicationsData(
        title: localizations.accAvgPayment,
        value: '45 days',
        target: 'Target: 45 days',
        metric: 'On Target',
        status: ContraIndicationsStatus.success,
        icon: LucideIcons.banknote,
        iconColor: theme.indigoText,
      ),
    ];
  }
}
