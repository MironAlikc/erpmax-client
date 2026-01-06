import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class KpiTrendIndicator extends StatelessWidget {
  final String trend;
  final bool isPositive;
  const KpiTrendIndicator({
    super.key,
    required this.trend,
    required this.isPositive,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final color = isPositive ? theme.success : theme.error;
    return Row(
      children: [
        Icon(
          isPositive ? Icons.trending_up : Icons.trending_down,
          size: 16,
          color: color,
        ),
        const SizedBox(width: 4),
        Text(trend, style: AppTextStyles.bodySmallBold.copyWith(color: color)),
      ],
    );
  }
}

class KpiProgressBar extends StatelessWidget {
  final double progress;
  const KpiProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Column(
      children: [
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 6,
            backgroundColor: theme.gray100,
            valueColor: AlwaysStoppedAnimation<Color>(theme.gray900),
          ),
        ),
      ],
    );
  }
}

class KpiStatusIndicator extends StatelessWidget {
  final String label;
  final Color color;
  final bool useCheck;
  const KpiStatusIndicator({
    super.key,
    required this.label,
    required this.color,
    this.useCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (useCheck)
          Icon(Icons.check_circle_outline, size: 14, color: color)
        else
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        const SizedBox(width: 8),
        Text(label, style: AppTextStyles.bodySmallBold.copyWith(color: color)),
      ],
    );
  }
}
