import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

enum SubscriberStatus { active, expired, trial, suspended }

class SubscriberModel {
  final String companyName;
  final String email;
  final String planName;
  final SubscriberStatus status;
  final int currentUsers;
  final int maxUsers;
  final double currentStorage;
  final double maxStorage;
  final String renewalDate;

  const SubscriberModel({
    required this.companyName,
    required this.email,
    required this.planName,
    required this.status,
    required this.currentUsers,
    required this.maxUsers,
    required this.currentStorage,
    required this.maxStorage,
    required this.renewalDate,
  });
}

class SubscribersContent extends StatelessWidget {
  const SubscribersContent({super.key});

  static const List<SubscriberModel> _subscribers = [
    SubscriberModel(
      companyName: "Tech Solutions Co.",
      email: "admin@techsolutions.com",
      planName: "Enterprise",
      status: SubscriberStatus.active,
      currentUsers: 45,
      maxUsers: 100,
      currentStorage: 85,
      maxStorage: 200,
      renewalDate: "2024-12-01",
    ),
    SubscriberModel(
      companyName: "Al-Amal Trading",
      email: "info@alamal.com",
      planName: "Professional",
      status: SubscriberStatus.active,
      currentUsers: 12,
      maxUsers: 25,
      currentStorage: 32,
      maxStorage: 50,
      renewalDate: "2024-11-15",
    ),
    SubscriberModel(
      companyName: "Future Vision",
      email: "contact@futurevision.sa",
      planName: "Starter",
      status: SubscriberStatus.expired,
      currentUsers: 3,
      maxUsers: 5,
      currentStorage: 8,
      maxStorage: 10,
      renewalDate: "2024-01-20",
    ),
    SubscriberModel(
      companyName: "Global Logistics",
      email: "it@globallogistics.com",
      planName: "Enterprise",
      status: SubscriberStatus.active,
      currentUsers: 120,
      maxUsers: 150,
      currentStorage: 180,
      maxStorage: 200,
      renewalDate: "2025-03-10",
    ),
    SubscriberModel(
      companyName: "Smart Retail",
      email: "admin@smartretail.sa",
      planName: "Professional",
      status: SubscriberStatus.trial,
      currentUsers: 8,
      maxUsers: 25,
      currentStorage: 15,
      maxStorage: 50,
      renewalDate: "2024-02-15",
    ),
    SubscriberModel(
      companyName: "Mazen Electronics",
      email: "support@mazen.com",
      planName: "Professional",
      status: SubscriberStatus.suspended,
      currentUsers: 15,
      maxUsers: 25,
      currentStorage: 28,
      maxStorage: 50,
      renewalDate: "2024-01-01",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(title: "Tenant", weight: 0.22),
      ErpMaxColumn(title: "Plan", weight: 0.12),
      ErpMaxColumn(title: "Status", weight: 0.12),
      ErpMaxColumn(title: "Users", weight: 0.16),
      ErpMaxColumn(title: "Storage", weight: 0.16),
      ErpMaxColumn(title: "Renewal Date", weight: 0.15),
      ErpMaxColumn(title: "Actions", weight: 0.05, textAlign: TextAlign.right),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopStatsRow(),
          const SizedBox(height: 24),
          _buildSearchField(),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Column(
              children: [
                ErpMaxTable(
                  columns: columns,
                  minWidth: 1100,
                  rows: _subscribers.map((item) {
                    return ErpMaxRow(
                      columns: columns,
                      cells: [
                        _buildTenantCell(item),
                        _buildPlanBadge(item.planName),
                        _buildStatusBadge(item.status),
                        _buildProgressCell(
                          item.currentUsers,
                          item.maxUsers,
                          Icons.people_outline,
                          "",
                        ),
                        _buildProgressCell(
                          item.currentStorage.toInt(),
                          item.maxStorage.toInt(),
                          Icons.inventory_2_outlined,
                          "GB",
                        ),
                        _buildDateCell(item.renewalDate),
                        const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
                      ],
                    );
                  }).toList(),
                ),
                _buildPaginationFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Widgets ---

  Widget _buildTopStatsRow() {
    return Row(
      children: [
        _statCard(
          "Total Tenants",
          "6",
          const Color(0xFFEEF2FF),
          const Color(0xFF4F46E5),
          Icons.business,
        ),
        const SizedBox(width: 16),
        _statCard(
          "Active Subscriptions",
          "3",
          const Color(0xFFECFDF5),
          const Color(0xFF10B981),
          Icons.check_circle_outline,
        ),
        const SizedBox(width: 16),
        _statCard(
          "Trial Accounts",
          "1",
          const Color(0xFFFFFBEB),
          const Color(0xFFF59E0B),
          Icons.access_time,
        ),
        const SizedBox(width: 16),
        _statCard(
          "Suspended",
          "1",
          const Color(0xFFFEF2F2),
          const Color(0xFFEF4444),
          Icons.pause_circle_outline,
        ),
        const SizedBox(width: 16),
        _statCard(
          "MRR",
          "11 500",
          const Color(0xFFF8FAFC),
          const Color(0xFF0F172A),
          Icons.credit_card_outlined,
          suffix: "SAR",
        ),
      ],
    );
  }

  Widget _statCard(
    String title,
    String value,
    Color bg,
    Color color,
    IconData icon, {
    String? suffix,
  }) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelStyle.copyWith(
                    fontSize: 13,
                    color: color.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    if (suffix != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        suffix,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Color(0xFF94A3B8)),
          hintText: "Search tenants...",
          border: InputBorder.none,
          hintStyle: TextStyle(color: Color(0xFF94A3B8)),
        ),
      ),
    );
  }

  Widget _buildTenantCell(SubscriberModel item) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: const Icon(Icons.business, size: 20, color: Color(0xFF64748B)),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.companyName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF1E293B),
                ),
              ),
              Text(
                item.email,
                style: const TextStyle(fontSize: 12, color: Color(0xFF94A3B8)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlanBadge(String plan) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3FF),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFDDD6FE)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.auto_awesome_motion,
            size: 14,
            color: Color(0xFF7C3AED),
          ),
          const SizedBox(width: 6),
          Text(
            plan,
            style: const TextStyle(
              color: Color(0xFF7C3AED),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(SubscriberStatus status) {
    Color bg;
    Color text;
    String label;
    IconData icon;
    switch (status) {
      case SubscriberStatus.active:
        bg = const Color(0xFFDCFCE7);
        text = const Color(0xFF166534);
        label = "Active";
        icon = Icons.check_circle_outline;
        break;
      case SubscriberStatus.expired:
        bg = const Color(0xFFF1F5F9);
        text = const Color(0xFF475569);
        label = "Expired";
        icon = Icons.cancel_outlined;
        break;
      case SubscriberStatus.trial:
        bg = const Color(0xFFFEF3C7);
        text = const Color(0xFF92400E);
        label = "Trial";
        icon = Icons.access_time;
        break;
      case SubscriberStatus.suspended:
        bg = const Color(0xFFFEE2E2);
        text = const Color(0xFF991B1B);
        label = "Suspended";
        icon = Icons.pause_circle_outline;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: text),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: text,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCell(int current, int max, IconData icon, String unit) {
    double progress = (current / max).clamp(0.0, 1.0);
    bool isWarning = progress > 0.85;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$current/$max $unit",
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
              ),
            ),
            Icon(icon, size: 16, color: const Color(0xFF94A3B8)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: const Color(0xFFF1F5F9),
            valueColor: AlwaysStoppedAnimation<Color>(
              isWarning ? Colors.orange : const Color(0xFF0F172A),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateCell(String date) {
    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 16,
          color: Color(0xFF94A3B8),
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1E293B),
          ),
        ),
      ],
    );
  }

  Widget _buildPaginationFooter() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFF1F5F9))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Showing 6 of 6 Tenants",
            style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
          ),
          Row(
            children: [
              _footerStat(Icons.people_outline, "203 Total Users"),
              const SizedBox(width: 24),
              _footerStat(Icons.visibility_outlined, "Click for details"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerStat(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: const Color(0xFF94A3B8)),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
        ),
      ],
    );
  }
}
