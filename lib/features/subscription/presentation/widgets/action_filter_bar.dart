import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

class ActionAndFilterBar extends StatelessWidget {
  const ActionAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      color: theme.white,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          Text(
            "Subscription Management",
            style: AppTextStyles.h3.copyWith(color: theme.textPrimary),
          ),
          const Spacer(),
          _buildSearchField(context),
          const SizedBox(width: 12),
          _buildActionButton(context, "Reset Filters", Icons.refresh, false),
          const SizedBox(width: 12),
          _buildActionButton(context, "New Subscription", Icons.add, true),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    final theme = context.theme.appColor;

    return SizedBox(
      width: 240,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search subscriptions...",
          prefixIcon: const Icon(Icons.search, size: 20),
          filled: true,
          fillColor: theme.gray50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.borderLight),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    IconData icon,
    bool isPrimary,
  ) {
    final theme = context.theme.appColor;
    if (isPrimary) {
      return ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primary,
          foregroundColor: theme.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: theme.gray500),
      label: Text(text, style: TextStyle(color: theme.textSecondary)),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: theme.borderMedium),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
