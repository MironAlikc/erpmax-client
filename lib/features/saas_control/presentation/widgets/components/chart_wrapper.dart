import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class ChartWrapper extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget chart;

  const ChartWrapper({
    super.key,
    required this.title,
    this.subtitle,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.gray100),
        boxShadow: [
          BoxShadow(
            color: theme.black.withOpacity(0.03),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ChartHeader(title: title, subtitle: subtitle),
          const SizedBox(height: 32),
          SizedBox(height: 320, child: chart),
        ],
      ),
    );
  }
}

class _ChartHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const _ChartHeader({required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.h3),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: AppTextStyles.bodySmall.copyWith(color: theme.gray500),
                ),
              ],
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_horiz, color: theme.gray400),
          splashRadius: 20,
        ),
      ],
    );
  }
}
