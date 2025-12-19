import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_tab_filter.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

// --- Модели данных ---

class ReportStat {
  final String title;
  final String value;
  final String trend;
  final bool isUp;
  final IconData icon;

  const ReportStat(this.title, this.value, this.trend, this.isUp, this.icon);
}

class ReportSubscriber {
  final String company;
  final String plan;
  final String status;
  final String startDate;
  final String endDate;
  final String price;

  const ReportSubscriber({
    required this.company,
    required this.plan,
    required this.status,
    required this.startDate,
    required this.endDate,
    required this.price,
  });
}

// --- Основной виджет ---

class ReportsContent extends StatefulWidget {
  const ReportsContent({super.key});

  @override
  State<ReportsContent> createState() => _ReportsContentState();
}

class _ReportsContentState extends State<ReportsContent> {
  String _selectedReportType = 'Subscriptions Report';

  // Используем ErpMaxTabItem из вашего импортированного файла
  final List<ErpMaxTabItem> _reportTabs = [
    const ErpMaxTabItem(
      name: 'Subscriptions Report',
      icon: Icons.people_alt_outlined,
    ),
    const ErpMaxTabItem(
      name: 'Revenue Report',
      icon: Icons.account_balance_wallet_outlined,
    ),
    const ErpMaxTabItem(
      name: 'Customers Report',
      icon: Icons.person_search_outlined,
    ),
    const ErpMaxTabItem(name: 'Usage Report', icon: Icons.analytics_outlined),
    const ErpMaxTabItem(name: 'Performance Report', icon: Icons.speed_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // РЕФАКТОР: Используем универсальный фильтр вместо локального метода
          ErpMaxTabFilter(
            items: _reportTabs,
            selectedItem: _selectedReportType,
            onSelected: (name) => setState(() => _selectedReportType = name),
          ),
          const SizedBox(height: 24),

          if (_selectedReportType == 'Subscriptions Report') ...[
            _buildStatsGrid(),
            const SizedBox(height: 24),
            _buildReportTableSection("New Subscribers", _newSubscribersData),
            const SizedBox(height: 24),
            _buildReportTableSection("Expiring Soon", _expiringSoonData),
          ] else ...[
            _buildPlaceholderContent(_selectedReportType),
          ],
          const SizedBox(height: 40),
        ],
      ),
    );
  }

  // Сетка карточек статистики
  Widget _buildStatsGrid() {
    final stats = [
      const ReportStat(
        "Active Subscriptions",
        "1,234",
        "+12%",
        true,
        Icons.group_outlined,
      ),
      const ReportStat(
        "New Subscribers",
        "56",
        "+5%",
        true,
        Icons.add_chart_outlined,
      ),
      const ReportStat(
        "Expiring Soon",
        "23",
        "-2%",
        false,
        Icons.show_chart_rounded,
      ),
    ];

    return Row(
      children: stats
          .map(
            (stat) => Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFF1F5F9)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            stat.icon,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                        _buildTrendIndicator(stat),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      stat.title,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat.value,
                      style: const TextStyle(
                        color: Color(0xFF0F172A),
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildTrendIndicator(ReportStat stat) {
    final color = stat.isUp ? const Color(0xFF00C58D) : const Color(0xFFF43F5E);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: stat.isUp ? const Color(0xFFE6F9F2) : const Color(0xFFFFF1F2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Icon(
            stat.isUp ? Icons.north_east : Icons.south_east,
            size: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            stat.trend,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReportTableSection(String title, List<ReportSubscriber> data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          ErpMaxDataTable<ReportSubscriber>(
            items: data,
            columns: [
              ErpMaxColumn(title: "Company Name", weight: 0.25),
              ErpMaxColumn(title: "Plan Name", weight: 0.15),
              ErpMaxColumn(title: "Status", weight: 0.15),
              ErpMaxColumn(title: "Start Date", weight: 0.15),
              ErpMaxColumn(title: "End Date", weight: 0.15),
              ErpMaxColumn(title: "Price", weight: 0.1),
              ErpMaxColumn(
                title: "Actions",
                weight: 0.05,
                textAlign: TextAlign.right,
              ),
            ],
            rowBuilder: (item) => [
              Text(
                item.company,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(item.plan),
              _StatusBadge(status: item.status),
              Text(item.startDate),
              Text(item.endDate),
              Text(
                item.price,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              const Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholderContent(String name) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(80),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
      ),
      child: Column(
        children: [
          Icon(Icons.analytics_outlined, size: 64, color: Colors.grey[200]),
          const SizedBox(height: 16),
          Text(
            "Analysis for $name",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            "Detailed reporting data is being generated...",
            style: TextStyle(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});
  @override
  Widget build(BuildContext context) {
    bool isExpired = status == "Expired";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: isExpired ? const Color(0xFFFEE2E2) : const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: isExpired ? const Color(0xFFEF4444) : Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// Данные
final _newSubscribersData = [
  const ReportSubscriber(
    company: "StartUp Inc",
    plan: "Starter",
    status: "Active",
    startDate: "2024-05-20",
    endDate: "2025-05-20",
    price: "SAR 1,000",
  ),
  const ReportSubscriber(
    company: "New Ventures",
    plan: "Professional",
    status: "Active",
    startDate: "2024-05-18",
    endDate: "2025-05-18",
    price: "SAR 2,500",
  ),
  const ReportSubscriber(
    company: "Alpha Tech",
    plan: "Enterprise",
    status: "Active",
    startDate: "2024-05-15",
    endDate: "2025-05-15",
    price: "SAR 5,000",
  ),
];

final _expiringSoonData = [
  const ReportSubscriber(
    company: "Old Co",
    plan: "Enterprise",
    status: "Expired",
    startDate: "2023-05-01",
    endDate: "2024-05-01",
    price: "SAR 10,000",
  ),
  const ReportSubscriber(
    company: "Tech Giants",
    plan: "Professional",
    status: "Active",
    startDate: "2023-06-01",
    endDate: "2024-06-01",
    price: "SAR 2,500",
  ),
];
