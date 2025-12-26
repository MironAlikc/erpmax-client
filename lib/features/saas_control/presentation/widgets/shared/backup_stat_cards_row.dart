import 'package:erpmax_client/features/saas_control/presentation/widgets/shared/invoice_stat_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackupStatCardsRow extends StatelessWidget {
  const BackupStatCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: InvoiceStatCard(
            title: "Total Backups",
            value: "5",
            icon: CupertinoIcons.archivebox_fill,
            bgColor: Color(0xFFF0F5FF),
            borderColor: Color(0xFFD1E0FF),
            iconBgColor: Color(0xFF4D7CFF),
            textColor: Color(0xFF2E5BFF),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: InvoiceStatCard(
            title: "Successful",
            value: "4",
            icon: CupertinoIcons.checkmark_shield_fill,
            bgColor: Color(0xFFF0FFF5),
            borderColor: Color(0xFFD1FADF),
            iconBgColor: Color(0xFF52C471),
            textColor: Color(0xFF2D8A4E),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: InvoiceStatCard(
            title: "Total Size",
            value: "4.5 GB",
            icon: CupertinoIcons.cloud_fill,
            bgColor: Color(0xFFF9F5FF),
            borderColor: Color(0xFFE9D7FE),
            iconBgColor: Color(0xFF7F56D9),
            textColor: Color(0xFF6941C6),
          ),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: InvoiceStatCard(
            title: "Last Backup",
            value: "2024-01-25",
            icon: CupertinoIcons.clock_fill,
            bgColor: Color(0xFFFFFAEB),
            borderColor: Color(0xFFFEF0C7),
            iconBgColor: Color(0xFFF79009),
            textColor: Color(0xFFB54708),
          ),
        ),
      ],
    );
  }
}
