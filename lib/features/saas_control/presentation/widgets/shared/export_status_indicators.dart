import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';

class ExportStatusBadge extends StatelessWidget {
  final String status;
  const ExportStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = status == "Completed";
    final Color color = isCompleted
        ? context.theme.appColor.success
        : context.theme.appColor.primary;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isCompleted)
            SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          if (isCompleted) Icon(Icons.check_circle, size: 12, color: color),
          const SizedBox(width: 6),
          Text(
            status,
            style: AppTextStyles.bodySmallBold.copyWith(
              color: color,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class ExportProgressCell extends StatelessWidget {
  final String value;
  const ExportProgressCell({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value, style: AppTextStyles.bodySmallBold),
        const SizedBox(height: 4),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: const LinearProgressIndicator(
            value: 0.65,
            minHeight: 4,
            backgroundColor: Color(0xFFF2F4F7),
            color: Color(0xFF4D7CFF),
          ),
        ),
      ],
    );
  }
}

class ExportTypeBadge extends StatelessWidget {
  final String text;
  const ExportTypeBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.theme.appColor.borderLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: context.theme.appColor.border),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmallBold.copyWith(
          fontSize: 11,
          color: context.theme.appColor.textPrimary,
        ),
      ),
    );
  }
}
