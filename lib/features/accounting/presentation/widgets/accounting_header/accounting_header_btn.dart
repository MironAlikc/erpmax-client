import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class AccountingHeaderBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isOutline;

  const AccountingHeaderBtn({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    this.isOutline = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16),
      label: Text(
        label,
        style: AppTextStyles.bodySmallBold,
        maxLines: 1,
        softWrap: false,
        overflow: TextOverflow.visible,
      ),
      style:
          ElevatedButton.styleFrom(
            elevation: 0,
            // Запрещаем кнопке навязывать минимальный размер, пусть она тянется по тексту
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: isOutline ? theme.white : (color ?? theme.black),
            foregroundColor: isOutline ? theme.textPrimary : theme.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: isOutline
                  ? BorderSide(color: theme.borderLight)
                  : BorderSide.none,
            ),
          ).copyWith(
            // Это ГАРАНТИРУЕТ, что кнопка не будет сжимать текст
            fixedSize: const WidgetStatePropertyAll(null),
          ),
    );
  }
}
