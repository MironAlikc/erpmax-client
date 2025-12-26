import 'package:flutter/material.dart';

class DetailBaseCard extends StatelessWidget {
  final Widget child;
  const DetailBaseCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: child,
    );
  }
}

class InfoRowItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isBold;
  final Color iconColor;

  const InfoRowItem({
    super.key,
    required this.icon,
    required this.text,
    this.isBold = false,
    this.iconColor = const Color(0xFF9CA3AF),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
              color: const Color(0xFF111827),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
