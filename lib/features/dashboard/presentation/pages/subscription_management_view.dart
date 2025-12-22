import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/design/app_design.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import '../widgets/subscription_details_modal.dart';

class SubscriptionData {
  final String company, package, endDate, tag, amount, paymentStatus;
  SubscriptionData({
    required this.company,
    required this.package,
    required this.endDate,
    required this.tag,
    required this.amount,
    required this.paymentStatus,
  });
}

class SubscriptionManagementView extends StatefulWidget {
  const SubscriptionManagementView({super.key});

  @override
  State<SubscriptionManagementView> createState() =>
      _SubscriptionManagementViewState();
}

class _SubscriptionManagementViewState extends State<SubscriptionManagementView>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final List<SubscriptionData> _data = [
    SubscriptionData(
      company: 'Trading Company "Al-Amal"',
      package: 'Full Package',
      endDate: '14/01/2025',
      tag: 'Active',
      amount: '6,000',
      paymentStatus: 'Paid',
    ),
    SubscriptionData(
      company: 'Al-Nur Foundation',
      package: 'Basic Package',
      endDate: '19/02/2025',
      tag: 'Active',
      amount: '3,600',
      paymentStatus: 'Paid',
    ),
    SubscriptionData(
      company: 'Modern Construction Company',
      package: 'Extended Package',
      endDate: '03/09/2025',
      tag: 'Active',
      amount: '4,800',
      paymentStatus: 'Late',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          _buildTableToolbar(isMobile),
          const Divider(height: 1, color: AppColors.gray100),
          Expanded(
            child: ErpMaxDataTable<SubscriptionData>(
              columns: _getColumns(),
              items: _data,
              minWidth: 1000,
              onRowTap: (item) => _showDetails(item),
              rowBuilder: (item) => [
                Text(item.company, style: AppTextStyles.bodyMediumBold),
                Text(item.package, style: AppTextStyles.bodyMedium),
                Text(item.endDate, style: AppTextStyles.bodyMedium),
                AppStatusMapper(status: item.tag),
                Text('₪ ${item.amount}', style: AppTextStyles.bodyMediumBold),
                AppStatusMapper(status: item.paymentStatus),
                const Icon(Icons.more_vert, color: AppColors.gray400, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ErpMaxColumn> _getColumns() {
    return [
      ErpMaxColumn(title: 'Company Name', weight: 2.5, isSortable: true),
      ErpMaxColumn(title: 'Package', weight: 1.5),
      ErpMaxColumn(title: 'End Date', weight: 1.2),
      ErpMaxColumn(title: 'Tags', weight: 1.0),
      ErpMaxColumn(title: 'Amount', weight: 1.0, textAlign: TextAlign.right),
      ErpMaxColumn(title: 'Status', weight: 1.2),
      ErpMaxColumn(title: '', weight: 0.4),
    ];
  }

  Widget _buildTableToolbar(bool isMobile) {
    return Padding(
      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Subscribers', style: AppTextStyles.h2),
                const SizedBox(height: 16),
                _buildSearchField(isFullWidth: true),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _buildResetButton()),
                    const SizedBox(width: 8),
                    Expanded(child: _buildNewSubscriptionButton()),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Text('Subscribers', style: AppTextStyles.h2),
                const Spacer(),
                _buildSearchField(isFullWidth: false),
                const SizedBox(width: 12),
                _buildResetButton(),
                const SizedBox(width: 12),
                _buildNewSubscriptionButton(),
              ],
            ),
    );
  }

  Widget _buildSearchField({required bool isFullWidth}) {
    return SizedBox(
      width: isFullWidth ? double.infinity : 280,
      height: 44,
      child: TextField(
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: 'Search company...',
          hintStyle: AppTextStyles.bodySmall.copyWith(color: AppColors.gray400),
          prefixIcon: const Icon(
            Icons.search,
            size: 20,
            color: AppColors.gray400,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: AppColors.gray50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
            borderSide: const BorderSide(color: AppColors.gray200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDesign.buttonRadius),
            borderSide: const BorderSide(color: AppColors.gray200),
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return AppButton(
      text: 'Reset',
      type: AppButtonType.outline,
      icon: Icons.filter_list,
      onPressed: () {},
    );
  }

  Widget _buildNewSubscriptionButton() {
    return AppButton(
      text: 'New',
      type: AppButtonType.primary,
      icon: Icons.add,
      onPressed: () {},
    );
  }

  void _showDetails(SubscriptionData item) {
    showDialog(
      context: context,
      builder: (context) => SubscriptionDetailsModal(subscription: item),
    );
  }
}
