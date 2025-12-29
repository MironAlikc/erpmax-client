import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class VatSummaryCard extends StatelessWidget {
  const VatSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final String formattedDate = DateFormat.yMd(
      Localizations.localeOf(context).toString(),
    ).format(DateTime(2024, 4, 15));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _header(
            title: localizations.accVatSummary,
            icon: Icons.receipt_long,
            iconColor: Colors.blue,
          ),
          const SizedBox(height: 16),
          _row(localizations.accVatCollectedLabel, '+15 200', Colors.green),
          _row(localizations.accVatPaidLabel, '-8 500', Colors.red),
          const Divider(),
          _row(
            localizations.accVatNetLabel,
            '6 700',
            Colors.black,
            isBold: true,
          ),
          const SizedBox(height: 8),
          Text(
            localizations.accVatDueLabel(formattedDate),
            style: TextStyle(fontSize: 12, color: Colors.orange),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value, Color color, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(label)),
          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            ),
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
