import 'package:flutter/material.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';

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
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
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
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E293B),
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
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(item.usersLimit),
                  Text(item.storageLimit),
                  _StatusBadge(isActive: item.isActive),
                  const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFFDCFCE7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        "Popular",
        style: TextStyle(
          color: Color(0xFF166534),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFDCFCE7) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: TextStyle(
          color: isActive ? const Color(0xFF166534) : const Color(0xFF64748B),
          fontSize: 11,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
