import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/utils/responsive.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:erpmax_client/features/dashboard/presentation/widgets/subscription_details_modal.dart';
import 'package:flutter/material.dart';

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
    final theme = context.theme.appColor;
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: theme.white,
      body: Column(
        children: [
          _buildTableToolbar(isMobile),
          Divider(height: 1, color: theme.gray100),
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
                Icon(Icons.more_vert, color: theme.gray400, size: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<ErpMaxColumn> _getColumns() {
    final localizations = AppLocalizations.of(context);

    return [
      ErpMaxColumn(
        title: localizations.colCompanyName,
        weight: 2.5,
        isSortable: true,
      ),
      ErpMaxColumn(title: localizations.colPackage, weight: 1.5),
      ErpMaxColumn(title: localizations.colEndDate, weight: 1.2),
      ErpMaxColumn(title: localizations.colTags, weight: 1.0),
      ErpMaxColumn(
        title: localizations.amount,
        weight: 1.0,
        textAlign: TextAlign.right,
      ),
      ErpMaxColumn(title: localizations.status, weight: 1.2),
      ErpMaxColumn(title: '', weight: 0.4),
    ];
  }

  Widget _buildTableToolbar(bool isMobile) {
    final localizations = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.all(isMobile ? 16.0 : 24.0),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(localizations.subscribers, style: AppTextStyles.h2),
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
                Text(localizations.subscribers, style: AppTextStyles.h2),
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
    final theme = context.theme.appColor;

    return SizedBox(
      width: isFullWidth ? double.infinity : 280,
      height: 44,
      child: TextField(
        style: AppTextStyles.bodyMedium,
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context).searchCompany,
          hintStyle: AppTextStyles.bodySmall.copyWith(color: theme.gray400),
          prefixIcon: Icon(Icons.search, size: 20, color: theme.gray400),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          filled: true,
          fillColor: theme.gray50,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.p6),
            borderSide: BorderSide(color: theme.gray200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.p6),
            borderSide: BorderSide(color: theme.gray200),
          ),
        ),
      ),
    );
  }

  Widget _buildResetButton() {
    return AppButton(
      text: AppLocalizations.of(context).btnReset,
      type: AppButtonType.outline,
      icon: Icons.filter_list,
      onPressed: () {},
    );
  }

  Widget _buildNewSubscriptionButton() {
    return AppButton(
      text: AppLocalizations.of(context).btnNew,
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
