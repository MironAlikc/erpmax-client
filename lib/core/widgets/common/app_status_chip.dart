import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';

enum AppStatusType { success, warning, error, info, neutral }

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
      AppStatusChip(label: label, type: AppStatusType.error);

  factory AppStatusChip.error(String label) =>
      AppStatusChip(label: label, type: AppStatusType.error);

  factory AppStatusChip.info(String label) =>
      AppStatusChip(label: label, type: AppStatusType.info);

  factory AppStatusChip.neutral(String label) =>
      AppStatusChip(label: label, type: AppStatusType.neutral);

  @override
  Widget build(BuildContext context) {
    // Используем твой метод получения цветов
    final (bg, text) = _getSemanticColors();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: text.withValues(alpha: 0.1), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: text,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
      ),
    );
  }

  (Color, Color) _getSemanticColors() {
    return switch (type) {
      AppStatusType.success => (AppColors.successBg, AppColors.successText),
      AppStatusType.warning => (AppColors.warningBg, AppColors.warningText),
      AppStatusType.error => (AppColors.errorBg, AppColors.errorText),
      AppStatusType.info => (AppColors.infoBg, AppColors.infoText),
      AppStatusType.neutral => (AppColors.neutralBg, AppColors.neutralText),
    };
  }
}
