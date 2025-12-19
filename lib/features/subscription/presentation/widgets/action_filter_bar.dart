import 'package:flutter/material.dart';

class ActionAndFilterBar extends StatelessWidget {
  const ActionAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Row(
        children: [
          Text(
            "Subscription Management",
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
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
    return SizedBox(
      width: 240,
      height: 40,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search subscriptions...",
          prefixIcon: const Icon(Icons.search, size: 20),
          filled: true,
          fillColor: const Color(0xFFF9FAFB),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFEAECF0)),
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
    final theme = Theme.of(context);
    if (isPrimary) {
      return ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 18),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          foregroundColor: theme.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 18, color: Colors.grey),
      label: Text(text, style: const TextStyle(color: Colors.grey)),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFFEAECF0)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
