import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/status_badge.dart';

enum SubscriptionPlan { starter, professional, enterprise }

enum InvoiceStatType { total, paid, pending, overdue }

class MockInvoicesDataService {
  static InvoicesStats getStatistics() => InvoicesStats(
    totalInvoiced: InvoiceStatItem(
      type: InvoiceStatType.total,
      title: "Total Invoiced",
      amount: 15525,
    ),
    paid: InvoiceStatItem(
      type: InvoiceStatType.paid,
      title: "Paid",
      amount: 7475,
    ),
    pending: InvoiceStatItem(
      type: InvoiceStatType.pending,
      title: "Pending",
      amount: 5750,
    ),
    overdue: InvoiceStatItem(
      type: InvoiceStatType.overdue,
      title: "Overdue",
      amount: 575,
    ),
  );

  static List<Invoice> getInvoices() {
    return [
      Invoice(
        invoiceNumber: "INV-2024-001",
        tenantName: "Tech Solutions Co.",
        plan: SubscriptionPlan.enterprise,
        period: "January 2024",
        amount: 5750,
        dueDate: DateTime(2024, 1, 15),
        status: InvoiceStatus.paid,
      ),
      Invoice(
        invoiceNumber: "INV-2024-002",
        tenantName: "Al-Amal Trading",
        plan: SubscriptionPlan.professional,
        period: "January 2024",
        amount: 1725,
        dueDate: DateTime(2024, 1, 15),
        status: InvoiceStatus.paid,
      ),
      Invoice(
        invoiceNumber: "INV-2024-003",
        tenantName: "Future Vision",
        plan: SubscriptionPlan.starter,
        period: "January 2024",
        amount: 575,
        dueDate: DateTime(2024, 1, 20),
        status: InvoiceStatus.overdue,
      ),
      Invoice(
        invoiceNumber: "INV-2024-004",
        tenantName: "Global Logistics",
        plan: SubscriptionPlan.enterprise,
        period: "February 2024",
        amount: 5750,
        dueDate: DateTime(2024, 2, 10),
        status: InvoiceStatus.pending,
      ),
      Invoice(
        invoiceNumber: "INV-2024-005",
        tenantName: "Smart Retail",
        plan: SubscriptionPlan.professional,
        period: "February 2024",
        amount: 1725,
        dueDate: DateTime(2024, 2, 15),
        status: InvoiceStatus.draft,
      ),
    ];
  }
}

class Invoice {
  final String invoiceNumber;
  final String tenantName;
  final SubscriptionPlan plan;
  final String period;
  final double amount;
  final String currency;
  final DateTime dueDate;
  final InvoiceStatus status;

  Invoice({
    required this.invoiceNumber,
    required this.tenantName,
    required this.plan,
    required this.period,
    required this.amount,
    this.currency = 'SAR',
    required this.dueDate,
    required this.status,
  });
}

class InvoiceStatItem {
  final double amount;
  final String currency;
  final String title;
  final InvoiceStatType type;

  const InvoiceStatItem({
    required this.amount,
    this.currency = 'SAR',
    required this.title,
    required this.type,
  });
}

class InvoicesStats {
  final InvoiceStatItem totalInvoiced;
  final InvoiceStatItem paid;
  final InvoiceStatItem pending;
  final InvoiceStatItem overdue;

  InvoicesStats({
    required this.totalInvoiced,
    required this.paid,
    required this.pending,
    required this.overdue,
  });
}
