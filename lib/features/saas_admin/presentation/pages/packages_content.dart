import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

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

class PackagesContent extends StatelessWidget {
  const PackagesContent({super.key});

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
    final bool isMobile = MediaQuery.of(context).size.width < 900;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_buildPackagesTable(context, isMobile)],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPackagesTable(BuildContext context, bool isMobile) {
    final theme = context.theme.appColor;

    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(title: "Plan Name", weight: 0.25),
      ErpMaxColumn(title: "Price", weight: 0.15),
      ErpMaxColumn(title: "Users Limit", weight: 0.15),
      ErpMaxColumn(title: "Storage Limit", weight: 0.15),
      ErpMaxColumn(title: "Status", weight: 0.2),
      ErpMaxColumn(title: "Actions", weight: 0.1, textAlign: TextAlign.right),
    ];

    return Container(
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border),
        boxShadow: [
          BoxShadow(
            color: theme.black.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ErpMaxTable(
            columns: columns,
            minWidth: 850,
            rows: _packages.map((item) {
              return ErpMaxRow(
                columns: columns,
                cells: [
                  Row(
                    children: [
                      Text(
                        item.planName,
                        style: AppTextStyles.labelStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (item.isPopular) ...[
                        const SizedBox(width: 8),
                        _PopularBadge(),
                      ],
                    ],
                  ),
                  Text(
                    "\$${item.price}/mo",
                    style: AppTextStyles.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.textSecondary,
                    ),
                  ),
                  Text(item.usersLimit),
                  Text(item.storageLimit),
                  _StatusBadge(isActive: item.isActive),
                  Icon(Icons.more_horiz, color: theme.gray400),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _PopularBadge extends StatelessWidget {
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
