import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
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
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(AppDesign.cardRadius),
              border: Border.all(color: AppColors.gray200),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: isMobile
                  ? const BouncingScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: SizedBox(
                width: isMobile ? 800 : MediaQuery.of(context).size.width - 48,
                child: ErpMaxDataTable<PackageModel>(
                  items: _packages,
                  columns: [
                    ErpMaxColumn(title: "Plan Name", weight: 0.25),
                    ErpMaxColumn(title: "Price", weight: 0.15),
                    ErpMaxColumn(title: "Users Limit", weight: 0.15),
                    ErpMaxColumn(title: "Storage Limit", weight: 0.15),
                    ErpMaxColumn(title: "Status", weight: 0.15),
                    ErpMaxColumn(
                      title: "Actions",
                      weight: 0.1,
                      textAlign: TextAlign.right,
                    ),
                  ],
                  rowBuilder: (item) => [
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "\$${item.price}",
                            style: AppTextStyles.labelStyle.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          TextSpan(
                            text: " /mo",
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(item.usersLimit, style: AppTextStyles.bodyMedium),
                    Text(item.storageLimit, style: AppTextStyles.bodyMedium),
                    _StatusBadge(isActive: item.isActive),
                    const Icon(Icons.more_horiz, color: AppColors.gray400),
                  ],
                ),
              ),
            ),
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
        color: const Color(0xFFE6F9F2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        "Popular",
        style: TextStyle(
          color: Color(0xFF00C58D),
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
        color: isActive ? const Color(0xFFE6F9F2) : AppColors.gray100,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        isActive ? "Active" : "Inactive",
        style: TextStyle(
          color: isActive ? const Color(0xFF00C58D) : AppColors.gray500,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
