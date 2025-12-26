import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';

class BackupTypeBadge extends StatelessWidget {
  final String type;
  const BackupTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: context.theme.appColor.borderLight.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(type, style: AppTextStyles.bodySmall.copyWith(fontSize: 11)),
    );
  }
}

class BackupTag extends StatelessWidget {
  final String text;
  const BackupTag({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: context.theme.appColor.border),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: AppTextStyles.bodySmallBold.copyWith(fontSize: 10),
      ),
    );
  }
}

class BackupStatusBadge extends StatelessWidget {
  final String status;
  const BackupStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final successColor = context.theme.appColor.success;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: successColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 6, color: successColor),
          const SizedBox(width: 4),
          Text(
            status,
            style: AppTextStyles.bodySmallBold.copyWith(
              color: successColor,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
