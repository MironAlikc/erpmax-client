import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';

class ModuleCardSimple extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool isActive;
  final VoidCallback? onTap;

  const ModuleCardSimple({
    super.key,
    required this.name,
    required this.icon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isActive
                ? theme.primary.withOpacity(0.3)
                : theme.borderLight,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: theme.primary.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            _ModuleIcon(icon: icon, isActive: isActive),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.bodySmallBold.copyWith(
                  color: isActive ? theme.textPrimary : const Color(0xFF667085),
                ),
              ),
            ),
            _StatusIndicator(isActive: isActive),
          ],
        ),
      ),
    );
  }
}

class _ModuleIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const _ModuleIcon({required this.icon, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFF4D7CFF).withOpacity(0.1)
            : const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 20,
        color: isActive ? const Color(0xFF4D7CFF) : const Color(0xFF98A2B3),
      ),
    );
  }
}

class _StatusIndicator extends StatelessWidget {
  final bool isActive;
  const _StatusIndicator({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? const Color(0xFFECFDF3) : const Color(0xFFF2F4F7),
      ),
      child: Icon(
        isActive ? CupertinoIcons.checkmark : CupertinoIcons.xmark,
        size: 10,
        color: isActive ? const Color(0xFF12B76A) : const Color(0xFF98A2B3),
      ),
    );
  }
}
