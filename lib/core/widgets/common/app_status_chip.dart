import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';

enum AppStatusType { success, warning, danger, neutral, info }

class AppStatusChip extends StatelessWidget {
  final String label;
  final AppStatusType type;

  const AppStatusChip({
    super.key,
    required this.label,
    this.type = AppStatusType.neutral,
  });
  factory AppStatusChip.success(String label) =>
      AppStatusChip(label: label, type: AppStatusType.success);
  factory AppStatusChip.warning(String label) =>
      AppStatusChip(label: label, type: AppStatusType.warning);
  factory AppStatusChip.danger(String label) =>
      AppStatusChip(label: label, type: AppStatusType.danger);
  factory AppStatusChip.info(String label) =>
      AppStatusChip(label: label, type: AppStatusType.info);
  factory AppStatusChip.neutral(String label) =>
      AppStatusChip(label: label, type: AppStatusType.neutral);

  @override
  Widget build(BuildContext context) {
    final (bgColor, textColor) = switch (type) {
      AppStatusType.success => (AppColors.successBg, AppColors.successText),
      AppStatusType.warning => (AppColors.warningBg, AppColors.warningText),
      AppStatusType.danger => (AppColors.errorBg, AppColors.errorText),
      AppStatusType.info => (
        AppColors.primary.withOpacity(0.1),
        AppColors.primary,
      ),
      AppStatusType.neutral => (AppColors.neutralBg, AppColors.neutralText),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: textColor.withOpacity(0.1), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
