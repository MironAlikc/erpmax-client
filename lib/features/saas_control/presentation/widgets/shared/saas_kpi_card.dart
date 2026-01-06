import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';

class SaasKpiCard extends StatelessWidget {
  final String title;
  final String value;
  final String? target;
  final IconData icon;
  final Color? color;
  final Widget? footer;

  const SaasKpiCard({
    super.key,
    required this.title,
    required this.value,
    this.target,
    required this.icon,
    this.color,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: theme.gray100, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: theme.gray400,
                ),
              ),
              Icon(
                icon,
                size: 20,
                color: color?.withOpacity(0.5) ?? theme.gray400,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: AppTextStyles.h1.copyWith(
              color: color ?? theme.textPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
            ),
          ),
          if (target != null) ...[
            const SizedBox(height: 4),
            Text(
              "Target: $target",
              style: AppTextStyles.bodySmall.copyWith(
                color: theme.textDisabled,
              ),
            ),
          ],
          const Spacer(),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
