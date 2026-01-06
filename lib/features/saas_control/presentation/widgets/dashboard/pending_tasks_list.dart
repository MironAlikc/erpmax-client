import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';

class PendingTasksList extends StatelessWidget {
  const PendingTasksList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    final tasks = [
      {"title": "Subscriptions pending renewal", "count": "12"},
      {"title": "Unpaid invoices", "count": "4"},
      {"title": "Open support tickets", "count": "5"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pending Tasks",
              style: AppTextStyles.h4.copyWith(color: theme.gray800),
            ),
            Icon(Icons.access_time, color: theme.gray400, size: 20),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: theme.gray100),
            boxShadow: [
              BoxShadow(
                color: theme.shadowColor,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: tasks.asMap().entries.map((entry) {
              final isLast = entry.key == tasks.length - 1;
              return Column(
                children: [
                  _buildTaskItem(
                    entry.value["title"]!,
                    entry.value["count"]!,
                    theme,
                  ),
                  if (!isLast)
                    Divider(
                      height: 1,
                      color: theme.gray100,
                      indent: 16,
                      endIndent: 16,
                    ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTaskItem(String title, String count, dynamic theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.bodyMedium.copyWith(color: theme.gray700),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: theme.gray50, // Фон индикатора
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: theme.gray200),
            ),
            child: Text(
              count,
              style: AppTextStyles.bodySmallBold.copyWith(
                color: theme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
