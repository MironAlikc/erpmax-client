import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_colors.dart';
import 'package:erpmax_client/core/design/app_text_styles.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import '../pages/subscription_management_view.dart';

class SubscriptionDetailsModal extends StatelessWidget {
  final SubscriptionData subscription;

  const SubscriptionDetailsModal({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      backgroundColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 900),
        child: Material(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: AppColors.white,
              appBar: _buildAppBar(context),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTopHeader(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: SubscriptionInfoCards(),
                          ),
                          const SizedBox(height: 32),
                          _buildCustomTabBar(),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 500,
                            child: TabBarView(
                              children: [
                                _buildTabContent(const ModulesTab()),
                                _buildTabContent(const PayBookTab()),
                                Center(
                                  child: Text(
                                    'General Ledger Content',
                                    style: AppTextStyles.bodyMedium,
                                  ),
                                ),
                                _buildTabContent(const ActivityLogTable()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildFooter(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(Widget child) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 20, 32, 32),
      child: child,
    );
  }

  Widget _buildTopHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _bread('SaaS Admin'),
              _sep(),
              _bread('Subscription Management'),
              _sep(),
              _bread('Subscription Details', last: true),
            ],
          ),
          const SizedBox(height: 16),
          Text('Subscription Details', style: AppTextStyles.h1),
        ],
      ),
    );
  }

  Widget _bread(String t, {bool last = false}) => Text(
    t,
    style: AppTextStyles.bodySmall.copyWith(
      color: last ? AppColors.textPrimary : AppColors.gray400,
      fontWeight: last ? FontWeight.w600 : FontWeight.w400,
    ),
  );

  Widget _sep() => const Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Icon(Icons.chevron_right, size: 14, color: AppColors.gray300),
  );

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.gray50,
          border: Border.all(color: AppColors.gray200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Subscription Details', style: AppTextStyles.tableHeader),
            const SizedBox(width: 8),
            const Icon(Icons.info_outline, size: 14, color: AppColors.gray400),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.close, color: AppColors.gray500),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 16),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1, color: AppColors.gray100),
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        height: 44,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.gray100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TabBar(
          indicator: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          labelColor: AppColors.textPrimary,
          unselectedLabelColor: AppColors.gray500,
          labelStyle: AppTextStyles.bodySmallBold,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: const [
            Tab(text: 'Modules'),
            Tab(text: 'Pay Book'),
            Tab(text: 'General Ledger'),
            Tab(text: 'Activity Log'),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(top: BorderSide(color: AppColors.gray100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            text: 'Amendment',
            type: AppButtonType.outline,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          AppButton(
            text: 'Cancel Subscription',
            type: AppButtonType.primaryDark,
            backgroundColor: AppColors.error,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class SubscriptionInfoCards extends StatelessWidget {
  const SubscriptionInfoCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Если места мало, превращаем в колонку
        final bool isColumn = constraints.maxWidth < 700;

        return Flex(
          direction: isColumn ? Axis.vertical : Axis.horizontal,
          children: [
            _infoCard(
              icon: Icons.person_outline,
              title: 'Customer Information',
              rows: [
                ['Customer:', 'Al Amal Trading Company'],
                ['e-mail:', 'info@example.com'],
              ],
            ),
            SizedBox(width: isColumn ? 0 : 20, height: isColumn ? 16 : 0),
            _infoCard(
              icon: Icons.card_membership_outlined,
              title: 'Package',
              rows: [
                ['Package:', 'Enterprise'],
                ['Value:', '₪ 6,000'],
              ],
              extra: _statusWithPrefix('Status:', 'Paid'),
            ),
            SizedBox(width: isColumn ? 0 : 20, height: isColumn ? 16 : 0),
            _infoCard(
              icon: Icons.calendar_today_outlined,
              title: 'Duration',
              rows: [
                ['Start:', '15/1/2024'],
                ['Expiry:', '14/1/2025'],
              ],
              extra: _statusWithPrefix('Condition:', 'Finished'),
            ),
          ],
        );
      },
    );
  }

  Widget _statusWithPrefix(String prefix, String status) {
    return Row(
      children: [
        Text('$prefix ', style: AppTextStyles.bodySmall),
        AppStatusMapper(status: status),
      ],
    );
  }

  Widget _infoCard({
    required IconData icon,
    required String title,
    required List<List<String>> rows,
    Widget? extra,
  }) {
    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.gray100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.gray400),
                const SizedBox(width: 10),
                Text(title, style: AppTextStyles.bodyMediumBold),
              ],
            ),
            const Spacer(),
            ...rows.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Text('${r[0]} ', style: AppTextStyles.bodySmall),
                    Text(
                      r[1],
                      style: AppTextStyles.bodySmallBold.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (extra != null) ...[const SizedBox(height: 4), extra],
          ],
        ),
      ),
    );
  }
}

class PayBookTab extends StatelessWidget {
  const PayBookTab({super.key});

  @override
  Widget build(BuildContext context) {
    return _TabTableWrapper(
      title: 'Pay Book',
      child: DataTable(
        headingRowHeight: 48,
        headingRowColor: WidgetStateProperty.all(AppColors.gray50),
        columnSpacing: 30,
        horizontalMargin: 20,
        columns: [
          const DataColumn(
            label: Icon(Icons.grid_view, size: 18, color: AppColors.gray400),
          ),
          DataColumn(
            label: Text('Transaction', style: AppTextStyles.tableHeader),
          ),
          DataColumn(label: Text('Date', style: AppTextStyles.tableHeader)),
          DataColumn(label: Text('Amount', style: AppTextStyles.tableHeader)),
          DataColumn(label: Text('Method', style: AppTextStyles.tableHeader)),
          DataColumn(label: Text('Status', style: AppTextStyles.tableHeader)),
          DataColumn(
            label: Text('Reference', style: AppTextStyles.tableHeader),
          ),
        ],
        rows: [
          _row(
            'PAY-001',
            '15/1/2024',
            '₪ 6000',
            'Credit Card',
            'Complete',
            'TRX-123456',
          ),
          _row(
            'PAY-002',
            '15/1/2023',
            '₪ 6000',
            'Credit Card',
            'Complete',
            'TRX-123123',
          ),
        ],
      ),
    );
  }

  DataRow _row(String n, String d, String a, String m, String c, String r) {
    return DataRow(
      cells: [
        const DataCell(
          Icon(Icons.drag_indicator, size: 18, color: AppColors.gray300),
        ),
        DataCell(Text(n, style: AppTextStyles.bodySmall)),
        DataCell(Text(d, style: AppTextStyles.bodySmall)),
        DataCell(Text(a, style: AppTextStyles.bodySmallBold)),
        DataCell(Text(m, style: AppTextStyles.bodySmall)),
        DataCell(AppStatusMapper(status: c)),
        DataCell(Text(r, style: AppTextStyles.bodySmall)),
      ],
    );
  }
}

class ActivityLogTable extends StatelessWidget {
  const ActivityLogTable({super.key});

  @override
  Widget build(BuildContext context) {
    return _TabTableWrapper(
      title: 'Activity Log',
      child: DataTable(
        headingRowHeight: 48,
        headingRowColor: WidgetStateProperty.all(AppColors.gray50),
        horizontalMargin: 20,
        columns: [
          const DataColumn(
            label: Icon(Icons.grid_view, size: 18, color: AppColors.gray400),
          ),
          DataColumn(label: Text('Date', style: AppTextStyles.tableHeader)),
          DataColumn(
            label: Text('Procedure', style: AppTextStyles.tableHeader),
          ),
          DataColumn(label: Text('User', style: AppTextStyles.tableHeader)),
          DataColumn(label: Text('Details', style: AppTextStyles.tableHeader)),
        ],
        rows: [
          _logRow(
            '15/1/2024',
            'Create Subscription',
            'Ahmed Mohamed',
            'Created successfully',
          ),
          _logRow(
            '15/1/2023',
            'Activate Subscription',
            'Sarah Ahmed',
            'Notes modified',
          ),
        ],
      ),
    );
  }

  DataRow _logRow(String d, String p, String u, String det) {
    return DataRow(
      cells: [
        const DataCell(
          Icon(Icons.drag_indicator, size: 18, color: AppColors.gray300),
        ),
        DataCell(Text(d, style: AppTextStyles.bodySmall)),
        DataCell(Text(p, style: AppTextStyles.bodySmallBold)),
        DataCell(Text(u, style: AppTextStyles.bodySmall)),
        DataCell(Text(det, style: AppTextStyles.bodySmall)),
      ],
    );
  }
}

class ModulesTab extends StatelessWidget {
  const ModulesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TabTableWrapper(
          title: 'Included Modules',
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                'Sales',
                'Purchases',
                'Inventory',
                'Accounting',
                'Reports',
                'Manufacturing',
              ].map((m) => _module(m)).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text('Comments', style: AppTextStyles.h3),
        const SizedBox(height: 12),
        TextField(
          maxLines: 3,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: 'Any additional comments',
            hintStyle: AppTextStyles.bodySmall,
            filled: true,
            fillColor: AppColors.gray50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.gray200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColors.gray200),
            ),
          ),
        ),
      ],
    );
  }

  Widget _module(String name) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.successBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.success.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: AppColors.success, size: 18),
          const SizedBox(width: 8),
          Text(
            name,
            style: AppTextStyles.bodySmallBold.copyWith(
              color: AppColors.success,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabTableWrapper extends StatelessWidget {
  final String title;
  final Widget child;
  const _TabTableWrapper({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(title, style: AppTextStyles.h3),
          ),
          const Divider(height: 1, color: AppColors.gray100),
          child,
        ],
      ),
    );
  }
}
