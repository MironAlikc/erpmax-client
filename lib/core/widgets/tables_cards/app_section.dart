import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/tables_cards/app_card.dart';
import 'package:flutter/material.dart';

class AppSection extends StatelessWidget {
  final String title;
  final Widget child;

  const AppSection({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            title,
            style: AppTextStyles.h2.copyWith(
              fontWeight: FontWeight.w800,
              color: context.theme.appColor.textPrimary,
            ),
          ),
        ),

        AppCard(padding: EdgeInsets.zero, child: child),
      ],
    );
  }
}
