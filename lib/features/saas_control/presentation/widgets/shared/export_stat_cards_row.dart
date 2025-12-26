import 'package:erpmax_client/features/saas_control/presentation/widgets/shared/invoice_stat_card.dart';
import 'package:flutter/cupertino.dart';

class ExportStatCardsRow extends StatelessWidget {
  const ExportStatCardsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(
          child: InvoiceStatCard(
            title: "Total Exports",
            value: "3",
            icon: CupertinoIcons.archivebox_fill,
            bgColor: Color(0xFFF0F5FF),
            borderColor: Color(0xFFD1E0FF),
            iconBgColor: Color(0xFF4D7CFF),
            textColor: Color(0xFF2E5BFF),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: InvoiceStatCard(
            title: "Completed",
            value: "2",
            icon: CupertinoIcons.checkmark_circle_fill,
            bgColor: Color(0xFFF0FFF5),
            borderColor: Color(0xFFD1FADF),
            iconBgColor: Color(0xFF52C471),
            textColor: Color(0xFF2D8A4E),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: InvoiceStatCard(
            title: "Total Size",
            value: "2.85 GB",
            icon: CupertinoIcons.circle_grid_hex_fill,
            bgColor: Color(0xFFF9F5FF),
            borderColor: Color(0xFFE9D7FE),
            iconBgColor: Color(0xFF7F56D9),
            textColor: Color(0xFF6941C6),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          child: InvoiceStatCard(
            title: "Downloads",
            value: "2",
            icon: CupertinoIcons.tray_arrow_down_fill,
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
