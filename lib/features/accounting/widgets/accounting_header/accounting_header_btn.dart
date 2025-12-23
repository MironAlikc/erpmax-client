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
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16),
      label: Text(
        label,
        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
      ),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: isOutline
            ? Colors.white
            : (color ?? const Color(0xFF12203A)),
        foregroundColor: isOutline ? const Color(0xFF1E293B) : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: isOutline
              ? const BorderSide(color: Color(0xFFE2E8F0))
              : BorderSide.none,
        ),
      ),
    );
  }
}
