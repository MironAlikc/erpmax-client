import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_color_extension.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final InvoiceStatus status;

  const StatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final mainColor = status.color(theme);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: status.bgColor(theme),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: mainColor.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icon, size: 14, color: mainColor),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              status.label(AppLocalizations.of(context)),
              style: AppTextStyles.caption.copyWith(color: mainColor),
            ),
          ),
        ],
      ),
    );
  }
}

enum InvoiceStatus { paid, pending, overdue, draft }

extension InvoiceStatusExtension on InvoiceStatus {
  String label(AppLocalizations localizations) {
    switch (this) {
      case InvoiceStatus.paid:
        return localizations.statusPaid;
      case InvoiceStatus.pending:
        return localizations.statusPending;
      case InvoiceStatus.overdue:
        return localizations.statusOverdue;
      case InvoiceStatus.draft:
        return localizations.statusDraft;
    }
  }

  IconData get icon {
    switch (this) {
      case InvoiceStatus.paid:
        return Icons.check_circle_outline;
      case InvoiceStatus.pending:
        return Icons.access_time;
      case InvoiceStatus.overdue:
        return Icons.warning_amber_rounded;
      case InvoiceStatus.draft:
        return Icons.description_outlined;
    }
  }

  Color color(AppColorExtension theme) {
    switch (this) {
      case InvoiceStatus.paid:
        return theme.activeGreen;
      case InvoiceStatus.pending:
        return theme.accentBlue;
      case InvoiceStatus.overdue:
        return theme.error;
      case InvoiceStatus.draft:
        return theme.textSecondary;
    }
  }

  Color bgColor(AppColorExtension theme) {
    return color(theme).withValues(alpha: 0.1);
  }
}
