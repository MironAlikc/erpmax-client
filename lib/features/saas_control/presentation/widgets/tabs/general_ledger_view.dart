import 'package:flutter/material.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import '../shared/action_btn.dart';
import '../shared/backups_status_elements.dart';

class GeneralLedgerView extends StatelessWidget {
  const GeneralLedgerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _LedgerHeader(),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEAECF0)),
          ),
          child: Table(
            columnWidths: const {
              0: FlexColumnWidth(1.2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2.5),
              3: FlexColumnWidth(0.8),
              4: FlexColumnWidth(0.8),
              5: FlexColumnWidth(1),
              6: FlexColumnWidth(1),
            },
            children: [
              _LedgerTableHeader(),
              _buildRow(
                "2024-01-01",
                "Invoice",
                "Enterprise Plan - Monthly",
                "5,000",
                "-",
                "5,000",
                "Posted",
              ),
              _buildRow(
                "2024-01-02",
                "Payment",
                "Payment via Credit Card",
                "-",
                "5,000",
                "0",
                "Success",
              ),
              _buildRow(
                "2023-12-01",
                "Invoice",
                "Enterprise Plan - Monthly",
                "5,000",
                "-",
                "5,000",
                "Posted",
              ),
              _buildRow(
                "2023-12-05",
                "Payment",
                "Payment via Bank Transfer",
                "-",
                "5,000",
                "0",
                "Success",
              ),
            ],
          ),
        ),
      ],
    );
  }

  TableRow _buildRow(
    String date,
    String type,
    String desc,
    String dr,
    String cr,
    String bal,
    String status,
  ) {
    return TableRow(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEAECF0))),
      ),
      children: [
        _CellText(date),
        Padding(
          padding: const EdgeInsets.all(12),
          child: LedgerTypeBadge(type: type),
        ),
        _CellText(desc),
        _CellText(dr),
        _CellText(cr),
        _CellText(bal, isBold: true),
        Padding(
          padding: const EdgeInsets.all(12),
          child: BackupStatusBadge(status: status),
        ),
      ],
    );
  }
}

class _LedgerHeader extends StatelessWidget {
  const _LedgerHeader();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("General Ledger", style: AppTextStyles.h2.copyWith(fontSize: 18)),
        const ActionBtn(icon: Icons.print_outlined, label: "Print Ledger"),
      ],
    );
  }
}

class _LedgerTableHeader extends TableRow {
  static const style = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: Color(0xFF667085),
  );

  _LedgerTableHeader()
    : super(
        decoration: const BoxDecoration(
          color: Color(0xFFF9FAFB),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Date", style: style),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Type", style: style),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Description", style: style),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Debit", style: style),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Credit", style: style),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Balance", style: style),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text("Status", style: style),
          ),
        ],
      );
}

class _CellText extends StatelessWidget {
  final String text;
  final bool isBold;
  const _CellText(this.text, {this.isBold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          color: const Color(0xFF344054),
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

class LedgerTypeBadge extends StatelessWidget {
  final String type;
  const LedgerTypeBadge({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final bool isPayment = type == "Payment";
    final Color color = isPayment
        ? const Color(0xFF12B76A)
        : const Color(0xFF2E5BFF);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        type,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }
}
