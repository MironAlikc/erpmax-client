import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import 'package:erpmax_client/features/dashboard/presentation/pages/subscription_management_view.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailsModal extends StatelessWidget {
  final SubscriptionData subscription;

  const SubscriptionDetailsModal({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
      backgroundColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000, maxHeight: 900),
        child: Material(
          color: theme.white,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: DefaultTabController(
            length: 4,
            child: Scaffold(
              backgroundColor: theme.white,
              appBar: _buildAppBar(context),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTopHeader(context),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: SubscriptionInfoCards(),
                          ),
                          const SizedBox(height: 32),
                          _buildCustomTabBar(context),
                          const SizedBox(height: 12),
                          SizedBox(
                            height: 500,
                            child: TabBarView(
                              children: [
                                _buildTabContent(const ModulesTab()),
                                _buildTabContent(const PayBookTab()),
                                Center(
                                  child: Text(
                                    localizations.generalLedgerContent,
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

  Widget _buildTopHeader(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _bread(localizations.saasAdmin, context),
              _sep(context),
              _bread(localizations.subscriptionManagement, context),
              _sep(context),
              _bread(localizations.subscriptionDetails, context, last: true),
            ],
          ),
          const SizedBox(height: 16),
          Text(localizations.subscriptionDetails, style: AppTextStyles.h1),
        ],
      ),
    );
  }

  Widget _bread(String t, BuildContext context, {bool last = false}) {
    final theme = context.theme.appColor;

    return Text(
      t,
      style: AppTextStyles.bodySmall.copyWith(
        color: last ? theme.textPrimary : theme.gray400,
        fontWeight: last ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }

  Widget _sep(BuildContext context) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Icon(
      Icons.chevron_right,
      size: 14,
      color: context.theme.appColor.gray300,
    ),
  );

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return AppBar(
      backgroundColor: theme.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: theme.gray50,
          border: Border.all(color: theme.gray200),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              localizations.subscriptionDetails,
              style: AppTextStyles.tableHeader,
            ),
            const SizedBox(width: 8),
            Icon(Icons.info_outline, size: 14, color: theme.gray400),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.close, color: theme.gray500),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 16),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(height: 1, color: theme.gray100),
      ),
    );
  }

  Widget _buildCustomTabBar(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Container(
        height: 44,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: theme.gray100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TabBar(
          indicator: BoxDecoration(
            color: theme.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: theme.black.withValues(alpha: 0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          labelColor: theme.textPrimary,
          unselectedLabelColor: theme.gray500,
          labelStyle: AppTextStyles.bodySmallBold,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: [
            Tab(text: localizations.modules),
            Tab(text: localizations.payBook),
            Tab(text: localizations.generalLedger),
            Tab(text: localizations.activityLog),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: BoxDecoration(
        color: theme.white,
        border: Border(top: BorderSide(color: theme.gray100)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton(
            text: localizations.amendment,
            type: AppButtonType.outline,
            onPressed: () {},
          ),
          const SizedBox(width: 16),
          AppButton(
            text: localizations.cancelSubscription,
            type: AppButtonType.primaryDark,
            backgroundColor: theme.error,
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
    final localizations = AppLocalizations.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isColumn = constraints.maxWidth < 700;

        return Flex(
          direction: isColumn ? Axis.vertical : Axis.horizontal,
          children: [
            _infoCard(
              context: context,
              icon: Icons.person_outline,
              title: localizations.customerInformation,
              rows: [
                [localizations.labelCustomer, 'Al Amal Trading Company'],
                [localizations.labelEmail, 'info@example.com'],
              ],
            ),
            SizedBox(width: isColumn ? 0 : 20, height: isColumn ? 16 : 0),
            _infoCard(
              context: context,
              icon: Icons.card_membership_outlined,
              title: localizations.package,
              rows: [
                [localizations.labelPackage, 'Enterprise'],
                [localizations.labelValue, '₪ 6,000'],
              ],
              extra: _statusWithPrefix(localizations.labelStatus, 'Paid'),
            ),
            SizedBox(width: isColumn ? 0 : 20, height: isColumn ? 16 : 0),
            _infoCard(
              context: context,
              icon: Icons.calendar_today_outlined,
              title: localizations.duration,
              rows: [
                [localizations.labelStart, '15/1/2024'],
                [localizations.labelExpiry, '14/1/2025'],
              ],
              extra: _statusWithPrefix(
                localizations.labelCondition,
                'Finished',
              ),
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
    required BuildContext context,
    required IconData icon,
    required String title,
    required List<List<String>> rows,
    Widget? extra,
  }) {
    final theme = context.theme.appColor;

    return Expanded(
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.gray100),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: theme.gray400),
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
                        color: theme.textPrimary,
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
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return _TabTableWrapper(
      title: localizations.payBook,
      child: DataTable(
        headingRowHeight: 48,
        headingRowColor: WidgetStateProperty.all(theme.gray50),
        columnSpacing: 30,
        horizontalMargin: 20,
        columns: [
          DataColumn(
            label: Icon(Icons.grid_view, size: 18, color: theme.gray400),
          ),
          DataColumn(
            label: Text(
              localizations.transaction,
              style: AppTextStyles.tableHeader,
            ),
          ),
          DataColumn(
            label: Text(localizations.date, style: AppTextStyles.tableHeader),
          ),
          DataColumn(
            label: Text(localizations.amount, style: AppTextStyles.tableHeader),
          ),
          DataColumn(
            label: Text(localizations.method, style: AppTextStyles.tableHeader),
          ),
          DataColumn(
            label: Text(localizations.status, style: AppTextStyles.tableHeader),
          ),
          DataColumn(
            label: Text(
              localizations.reference,
              style: AppTextStyles.tableHeader,
            ),
          ),
        ],
        rows: [
          _row(
            context,
            'PAY-001',
            '15/1/2024',
            '₪ 6000',
            'Credit Card',
            'Complete',
            'TRX-123456',
          ),
          _row(
            context,
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

  DataRow _row(
    BuildContext context,
    String n,
    String d,
    String a,
    String m,
    String c,
    String r,
  ) {
    final theme = context.theme.appColor;

    return DataRow(
      cells: [
        DataCell(Icon(Icons.drag_indicator, size: 18, color: theme.gray300)),
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
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return _TabTableWrapper(
      title: localizations.activityLog,
      child: DataTable(
        headingRowHeight: 48,
        headingRowColor: WidgetStateProperty.all(theme.gray50),
        horizontalMargin: 20,
        columns: [
          DataColumn(
            label: Icon(Icons.grid_view, size: 18, color: theme.gray400),
          ),
          DataColumn(
            label: Text(localizations.date, style: AppTextStyles.tableHeader),
          ),
          DataColumn(
            label: Text(
              localizations.procedure,
              style: AppTextStyles.tableHeader,
            ),
          ),
          DataColumn(
            label: Text(localizations.user, style: AppTextStyles.tableHeader),
          ),
          DataColumn(
            label: Text(
              localizations.details,
              style: AppTextStyles.tableHeader,
            ),
          ),
        ],
        rows: [
          _logRow(
            context,
            '15/1/2024',
            'Create Subscription',
            'Ahmed Mohamed',
            'Created successfully',
          ),
          _logRow(
            context,
            '15/1/2023',
            'Activate Subscription',
            'Sarah Ahmed',
            'Notes modified',
          ),
        ],
      ),
    );
  }

  DataRow _logRow(
    BuildContext context,
    String d,
    String p,
    String u,
    String det,
  ) {
    final theme = context.theme.appColor;

    return DataRow(
      cells: [
        DataCell(Icon(Icons.drag_indicator, size: 18, color: theme.gray300)),
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
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TabTableWrapper(
          title: localizations.includedModules,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                localizations.sales,
                localizations.purchases,
                localizations.menuInventory,
                localizations.menuAccounting,
                localizations.reports,
                localizations.manufacturing,
              ].map((m) => _module(context, m)).toList(),
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(localizations.comments, style: AppTextStyles.h3),
        const SizedBox(height: 12),
        TextField(
          maxLines: 3,
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: localizations.anyAdditionalComments,
            hintStyle: AppTextStyles.bodySmall,
            filled: true,
            fillColor: theme.gray50,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: theme.gray200),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: theme.gray200),
            ),
          ),
        ),
      ],
    );
  }

  Widget _module(BuildContext context, String name) {
    final theme = context.theme.appColor;

    return Container(
      width: 260,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.successBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.success.withValues(alpha: 0.1)),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: theme.success, size: 18),
          const SizedBox(width: 8),
          Text(
            name,
            style: AppTextStyles.bodySmallBold.copyWith(color: theme.success),
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
    final theme = context.theme.appColor;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.gray100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(title, style: AppTextStyles.h3),
          ),
          Divider(height: 1, color: theme.gray100),
          child,
        ],
      ),
    );
  }
}
