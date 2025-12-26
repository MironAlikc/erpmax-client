import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _ActionBtn(
          icon: CupertinoIcons.pencil,
          label: "Edit Subscriber",
          onPressed: () {},
        ),
        const SizedBox(width: 10),
        _ActionBtn(
          icon: CupertinoIcons.printer,
          label: "Print Profile",
          onPressed: () {},
        ),
      ],
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionBtn({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style:
          OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFE5E7EB)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            backgroundColor: Colors.white,
            foregroundColor: const Color(0xFF374151),
            elevation: 0,
          ).copyWith(
            // Легкий эффект при наведении или нажатии
            overlayColor: WidgetStateProperty.all(
              Colors.grey.withOpacity(0.05),
            ),
          ),
      icon: Icon(icon, size: 16, color: const Color(0xFF374151)),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}
