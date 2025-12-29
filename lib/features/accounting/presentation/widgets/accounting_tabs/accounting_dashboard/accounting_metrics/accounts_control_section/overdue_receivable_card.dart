import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';

class OverdueReceivablesCard extends StatelessWidget {
  const OverdueReceivablesCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(
            title: localizations.accOverdueReceivables,
            icon: Icons.warning_rounded,
            iconColor: Colors.red,
          ),
          const SizedBox(height: 12),
          _item(
            company: 'Al-Amal Trading Co.',
            invoice: 'INV-2024-042',
            amount: '12 500',
            days: '45 days',
          ),
          _item(
            company: 'Al-Noor Est.',
            invoice: 'INV-2024-058',
            amount: '8 200',
            days: '30 days',
          ),
          _item(
            company: 'Modern Construction',
            invoice: 'INV-2024-071',
            amount: '25 000',
            days: '15 days',
          ),
        ],
      ),
    );
  }

  Widget _item({
    required String company,
    required String invoice,
    required String amount,
    required String days,
  }) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.red.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  company,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(invoice, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                days,
                style: const TextStyle(fontSize: 12, color: Colors.redAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
    ],
  );
}

Widget _header({
  required String title,
  required IconData icon,
  required Color iconColor,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Icon(icon, color: iconColor, size: 20),
    ],
  );
}
