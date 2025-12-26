import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:lucide_icons/lucide_icons.dart' show LucideIcons;

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
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 16,
            offset: const Offset(0, 4),
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
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF0F172A),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle!,
                  style: TextStyle(fontSize: 13, color: theme.gray500),
                ),
              ],
            ],
          ),
        ),
        Icon(LucideIcons.moreHorizontal, color: theme.gray400, size: 20),
      ],
    );
  }
}
