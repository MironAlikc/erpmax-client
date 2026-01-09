import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart';

class PackageModel {
  final String planName;
  final bool isPopular;
  final String price;
  final String usersLimit;
  final String storageLimit;
  final bool isActive;

  const PackageModel({
    required this.planName,
    this.isPopular = false,
    required this.price,
    required this.usersLimit,
    required this.storageLimit,
    required this.isActive,
  });
}

class PackagesContent extends StatefulWidget {
  const PackagesContent({super.key});

  @override
  State<PackagesContent> createState() => _PackagesContentState();
}

class _PackagesContentState extends State<PackagesContent> {
  Set<String> _selectedPackageIds = {};

  static const List<PackageModel> _packages = [
    PackageModel(
      planName: "Starter",
      price: "99",
      usersLimit: "5",
      storageLimit: "10 GB",
      isActive: true,
    ),
    PackageModel(
      planName: "Professional",
      isPopular: true,
      price: "199",
      usersLimit: "20",
      storageLimit: "50 GB",
      isActive: true,
    ),
    PackageModel(
      planName: "Enterprise",
      price: "499",
      usersLimit: "Unlimited",
      storageLimit: "500 GB",
      isActive: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    // Определяем колонки на основе нашей универсальной модели
    final List<ErpMaxColumn<PackageModel>> columns = [
      ErpMaxColumn(
        id: 'plan',
        title: "Plan Name",
        weight: 2.5,
        valueGetter: (item) => item.planName,
        customCell: (item) => Row(
          children: [
            Text(
              item.planName,
              style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold),
            ),
            if (item.isPopular) ...[
              const SizedBox(width: 8),
              const _PopularBadge(),
            ],
          ],
        ),
      ),
      ErpMaxColumn(
        id: 'price',
        title: "Price",
        weight: 1.5,
        valueGetter: (item) => item.price,
        customCell: (item) => Text(
          "\$${item.price}/mo",
          style: AppTextStyles.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.textSecondary,
          ),
        ),
      ),
      ErpMaxColumn(
        id: 'users',
        title: "Users Limit",
        weight: 1.5,
        valueGetter: (item) => item.usersLimit,
      ),
      ErpMaxColumn(
        id: 'storage',
        title: "Storage Limit",
        weight: 1.5,
        valueGetter: (item) => item.storageLimit,
      ),
      ErpMaxColumn(
        id: 'status',
        title: "Status",
        weight: 2.0,
        valueGetter: (item) => item.isActive ? "Active" : "Inactive",
        customCell: (item) => _StatusBadge(isActive: item.isActive),
      ),
      ErpMaxColumn(
        id: 'actions',
        title: "Actions",
        weight: 1.0,
        textAlign: TextAlign.right,
        isSortable: false,
        hasFilter: false,
        customCell: (item) => Icon(Icons.more_horiz, color: theme.gray400),
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: theme.black.withValues(alpha: 0.02),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: UniversalErpTable<PackageModel>(
                items: _packages,
                columns: columns,
                minWidth: 850,
                idGetter: (item) => item.planName, // План как ID
                selectedIds: _selectedPackageIds,
                onSelectionChanged: (ids) {
                  setState(() => _selectedPackageIds = ids);
                },
                totals: {
                  'plan': 'Total Plans: ${_packages.length}',
                  'price': 'AVG: \$265',
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Вспомогательные виджеты ---

class _PopularBadge extends StatelessWidget {
  const _PopularBadge();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: theme.successLight,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        "Popular",
        style: TextStyle(
          color: theme.activeGreen,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final bool isActive;
  const _StatusBadge({required this.isActive});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? theme.successLight : theme.gray100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: AppTextStyles.bodySmallBold.copyWith(
          color: isActive ? theme.activeGreen : theme.gray500,
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
