import 'package:erpmax_client/features/saas_control/presentation/widgets/tabs/payments_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../shared/backup_action_buttons.dart';
import '../shared/summary_stats_grid.dart';

class InvoicesView extends StatelessWidget {
  const InvoicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const InvoicesHeader(),
        const SizedBox(height: 24),
        SummaryStatsGrid(
          items: [
            StatItem(
              title: "Total Invoiced",
              value: "0 SAR",
              icon: CupertinoIcons.tickets,
              baseColor: const Color(0xFF2E5BFF),
            ),
            StatItem(
              title: "Paid",
              value: "0 SAR",
              icon: CupertinoIcons.check_mark_circled_solid,
              baseColor: const Color(0xFF10B981),
            ),
            StatItem(
              title: "Pending",
              value: "0 SAR",
              icon: CupertinoIcons.clock,
              baseColor: const Color(0xFFF59E0B),
            ),
            StatItem(
              title: "Overdue",
              value: "0 SAR",
              icon: CupertinoIcons.exclamationmark_triangle,
              baseColor: const Color(0xFFEF4444),
            ),
          ],
        ),

        const SizedBox(height: 24),
        const InvoicesFilters(),
        const SizedBox(height: 16),
        const InvoiceDataTable(),
      ],
    );
  }
}

class InvoicesHeader extends StatelessWidget {
  const InvoicesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(CupertinoIcons.doc_text, color: Color(0xFF10B981), size: 26),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Invoices",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF111827),
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(width: 12),
                  CompanyBadge(text: "StartUp Inc"),
                ],
              ),
              Text(
                "Manage subscription invoices and payments",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B7280),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        BackupSecondaryButton(
          icon: CupertinoIcons.tray_arrow_down,
          label: "Export",
          onPressed: () {},
        ),
        const SizedBox(width: 12),
        BackupPrimaryButton(
          icon: CupertinoIcons.add,
          label: "Create Invoice",
          onPressed: () {},
        ),
      ],
    );
  }
}

class InvoicesFilters extends StatelessWidget {
  const InvoicesFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: SizedBox(
            height: 44,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  size: 20,
                  color: Color(0xFF9CA3AF),
                ),
                hintText: "Search invoices...",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF9CA3AF),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Color(0xFF10B981),
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const FilterDropdown(text: "All Statuses"),
        const SizedBox(width: 16),
        const Text(
          "0 Invoices",
          style: TextStyle(
            color: Color(0xFF6B7280),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class InvoiceDataTable extends StatelessWidget {
  const InvoiceDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              color: Color(0xFFF9FAFB),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
              border: Border(bottom: BorderSide(color: Color(0xFFE5E7EB))),
            ),
            child: Row(
              children: [
                buildHeaderCell("Invoice Number", flex: 2),
                buildHeaderCell("Plan", flex: 1),
                buildHeaderCell("Period", flex: 1),
                buildHeaderCell("Amount", flex: 1),
                buildHeaderCell("dueDate", flex: 1),
                buildHeaderCell("Status", flex: 1),
                buildHeaderCell("Actions", flex: 1),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
            child: Center(
              child: Text(
                "No invoices found",
                style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeaderCell(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF6B7280),
        ),
      ),
    );
  }
}

class CompanyBadge extends StatelessWidget {
  final String text;
  const CompanyBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Color(0xFF374151),
        ),
      ),
    );
  }
}
