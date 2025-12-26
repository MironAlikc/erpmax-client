import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';

class InvoiceStatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color bgColor;
  final Color borderColor;
  final Color iconBgColor;
  final Color textColor;

  const InvoiceStatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.bgColor,
    required this.borderColor,
    required this.iconBgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final parts = value.split(' ');
    final String number = parts[0];
    final String currency = parts.length > 1 ? parts[1] : "";

    return Container(
      height: 90,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 1),
        boxShadow: [
          BoxShadow(
            color: context.theme.appColor.shadowColor.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _IconBlock(icon: icon, iconBgColor: iconBgColor),
          const SizedBox(width: 16),
          Expanded(
            child: _ContentBlock(
              title: title,
              number: number,
              currency: currency,
              textColor: textColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBlock extends StatelessWidget {
  final IconData icon;
  final Color iconBgColor;

  const _IconBlock({required this.icon, required this.iconBgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: iconBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(icon, color: Colors.white, size: 24),
    );
  }
}

class _ContentBlock extends StatelessWidget {
  final String title;
  final String number;
  final String currency;
  final Color textColor;

  const _ContentBlock({
    required this.title,
    required this.number,
    required this.currency,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.bodySmall.copyWith(
            color: textColor.withOpacity(0.6),
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              number,
              style: AppTextStyles.h1.copyWith(
                fontSize: 22,
                color: textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            if (currency.isNotEmpty) ...[
              const SizedBox(width: 4),
              Text(
                currency,
                style: AppTextStyles.bodySmallBold.copyWith(
                  fontSize: 14,
                  color: textColor.withOpacity(0.8),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
