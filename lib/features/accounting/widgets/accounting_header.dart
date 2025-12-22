import 'package:erpmax_client/core/models/module_tab_item.dart';
import 'package:flutter/material.dart';

class AccountingHeader extends StatelessWidget {
  final ModuleTabItem currentTab;
  const AccountingHeader({super.key, required this.currentTab});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentTab.name,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  currentTab.description ?? '',
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Wrap(
            spacing: 12,
            children: [
              _HeaderBtn(
                label: "Export",
                icon: Icons.ios_share,
                isOutline: true,
              ),
              _HeaderBtn(
                label: "Journal Entry",
                icon: Icons.add,
                color: const Color(0xFF12203A),
              ),
              _HeaderBtn(
                label: "Cash Journal",
                icon: Icons.account_balance_wallet,
                color: const Color(0xFF00C58D),
              ),
              _HeaderBtn(
                label: "In",
                icon: Icons.arrow_downward,
                color: const Color(0xFF22C55E),
              ),
              _HeaderBtn(
                label: "Out",
                icon: Icons.arrow_upward,
                color: const Color(0xFFEF4444),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderBtn extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final bool isOutline;

  const _HeaderBtn({
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
