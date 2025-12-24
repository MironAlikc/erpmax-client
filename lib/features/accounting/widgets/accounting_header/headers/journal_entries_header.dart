import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/accounting_base_header.dart';
import 'package:erpmax_client/features/accounting/widgets/accounting_header/accounting_header_btn.dart';
import 'package:flutter/material.dart';

class JournalEntriesHeader extends AccountingBaseHeader {
  const JournalEntriesHeader({super.key, required super.currentTab});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Wrap(
              spacing: 12,
              children: [
                AccountingHeaderBtn(
                  label: "Export",
                  icon: Icons.ios_share,
                  isOutline: true,
                ),
                AccountingHeaderBtn(
                  label: "Journal Entry",
                  icon: Icons.add,
                  color: theme.black,
                ),
                AccountingHeaderBtn(
                  label: "Cash Journal",
                  icon: Icons.account_balance_wallet,
                  color: theme.activeGreen,
                ),
                AccountingHeaderBtn(
                  label: "In",
                  icon: Icons.arrow_downward,
                  color: theme.success,
                ),
                AccountingHeaderBtn(
                  label: "Out",
                  icon: Icons.arrow_upward,
                  color: theme.error,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currentTab.name,
                style: AppTextStyles.h1.copyWith(
                  color: theme.textPrimary,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                currentTab.description ?? '',
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.textSecondary,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
