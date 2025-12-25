import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

enum EntryStatus { posted, draft, pending }

class StatusChip extends StatelessWidget {
  final EntryStatus status;

  const StatusChip({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = context.theme.appColor;

    final (label, bgColor, textColor, borderColor) = switch (status) {
      EntryStatus.posted => (
        localizations.statusPosted,
        theme.successBg,
        theme.successText,
        theme.success,
      ),
      EntryStatus.draft => (
        localizations.statusDraft,
        theme.warningBg,
        theme.warningText,
        theme.warning,
      ),
      EntryStatus.pending => (
        localizations.statusPending,
        theme.infoBg,
        theme.infoText,
        theme.info,
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        label,
        style: AppTextStyles.bodySmall.copyWith(
          color: textColor,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }
}
