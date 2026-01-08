import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/common_widgets/accounting_header_btn.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class BillingHeader extends StatelessWidget {
  final String title;

  const BillingHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Wrap(
      spacing: 20,
      runSpacing: 16,
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.h3.copyWith(color: theme.textPrimary)),

        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: constraints.maxWidth),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AccountingHeaderBtn(
                      label: localizations.actionRefresh,
                      icon: LucideIcons.refreshCcw,
                      isOutline: true,
                      iconColor: theme.textSecondary,
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    AccountingHeaderBtn(
                      label: localizations.export,
                      icon: LucideIcons.download,
                      isOutline: true,
                      iconColor: theme.textSecondary,
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    AccountingHeaderBtn(
                      label: localizations.actionNewInvoice,
                      icon: LucideIcons.plus,
                      isOutline: true,
                      iconColor: theme.success,
                      textColor: theme.success,
                      borderColor: theme.success,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
