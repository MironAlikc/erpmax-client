import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/app_button.dart';
import 'package:erpmax_client/core/widgets/common/app_search_field.dart';
import 'package:erpmax_client/core/widgets/common/app_status_mapper.dart';
import 'package:erpmax_client/core/widgets/table/erp_max_data_table.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

class SubscriptionData {
  final String company;
  final String package;
  final String endDate;
  final String tag;
  final String amount;
  final String paymentStatus;

  const SubscriptionData({
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

class _SubscriptionManagementViewState
    extends State<SubscriptionManagementView> {
  final List<SubscriptionData> _data = [
    const SubscriptionData(
      company: 'Trading Company "Al-Amal"',
      package: 'Full Package',
      endDate: '14/01/2025',
      tag: 'Active',
      amount: '6,000',
      paymentStatus: 'Paid',
    ),
    const SubscriptionData(
      company: 'Al-Nur Foundation',
      package: 'Basic Package',
      endDate: '19/02/2025',
      tag: 'Active',
      amount: '3,600',
      paymentStatus: 'Paid',
    ),
    const SubscriptionData(
      company: 'Modern Construction Company',
      package: 'Extended Package',
      endDate: '03/09/2025',
      tag: 'Late',
      amount: '4,800',
      paymentStatus: 'Late',
    ),
    const SubscriptionData(
      company: 'Trade Establishment "Al-Safa"',
      package: 'Full Package',
      endDate: '04/04/2024',
      tag: 'Expired',
      amount: '6,000',
      paymentStatus: 'Expired',
    ),
    const SubscriptionData(
      company: 'Al Fajr Electronics Company',
      package: 'Extended Package',
      endDate: '05/11/2024',
      tag: 'Cancelled',
      amount: '4,800',
      paymentStatus: 'Cancelled',
    ),
  ];

  List<ErpMaxColumn> _getColumns(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return [
      ErpMaxColumn(
        title: localizations.columnCompanyName,
        weight: 2.5,
        isSortable: true,
        sortKey: 'name',
      ),
      ErpMaxColumn(title: localizations.package, weight: 1.5),
      ErpMaxColumn(
        title: localizations.columnEndDate,
        weight: 1.2,
        isSortable: true,
        sortKey: 'date',
      ),
      ErpMaxColumn(
        title: localizations.columnTags,
        weight: 1.0,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(
        title: localizations.amount,
        weight: 1.0,
        textAlign: TextAlign.right,
      ),
      ErpMaxColumn(
        title: localizations.columnPaymentStatus,
        weight: 1.2,
        textAlign: TextAlign.center,
      ),
      ErpMaxColumn(title: '', weight: 0.4, textAlign: TextAlign.center),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final columns = _getColumns(context);

    return Scaffold(
      backgroundColor: theme.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 900;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PageTabs(),
              _buildAdaptiveToolbar(isMobile),
              const QuickFilterBar(),
              Divider(height: 1, color: theme.gray200),
              Expanded(
                child: ErpMaxDataTable<SubscriptionData>(
                  columns: columns,
                  items: _data,
                  onRowTap: (item) => debugPrint('Tapped on ${item.company}'),
                  rowBuilder: (item) => [
                    Text(item.company, style: AppTextStyles.bodyMediumBold),
                    Text(item.package, style: AppTextStyles.bodyMedium),
                    Text(item.endDate, style: AppTextStyles.bodySmall),
                    AppStatusMapper(status: item.tag),
                    Text(
                      '₪ ${item.amount}',
                      style: AppTextStyles.bodyMediumBold.copyWith(
                        color: theme.primary,
                      ),
                    ),
                    AppStatusMapper(status: item.paymentStatus),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: theme.gray400,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAdaptiveToolbar(bool isMobile) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context).subscribers,
                  style: AppTextStyles.h2,
                ),
                const SizedBox(height: 16),
                AppSearchField(
                  width: double.infinity,
                  hintText: AppLocalizations.of(context).searchCompany,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: _resetButton()),
                    const SizedBox(width: 8),
                    Expanded(child: _newButton()),
                  ],
                ),
              ],
            )
          : Row(
              children: [
                Text(
                  AppLocalizations.of(context).subscribers,
                  style: AppTextStyles.h2,
                ),
                const Spacer(),
                AppSearchField(
                  width: 300,
                  hintText: AppLocalizations.of(context).searchCompany,
                ),
                const SizedBox(width: 12),
                _resetButton(),
                const SizedBox(width: 12),
                _newButton(),
              ],
            ),
    );
  }

  Widget _resetButton() => AppButton(
    text: AppLocalizations.of(context).btnReset,
    type: AppButtonType.outline,
    icon: Icons.refresh,
    onPressed: () => debugPrint("Filters reset"),
  );

  Widget _newButton() => AppButton(
    text: AppLocalizations.of(context).newSubscription,
    type: AppButtonType.primary,
    icon: Icons.add,
    onPressed: () => debugPrint("New clicked"),
  );
}

class PageTabs extends StatefulWidget {
  const PageTabs({super.key});

  @override
  State<PageTabs> createState() => _PageTabsState();
}

class _PageTabsState extends State<PageTabs> {
  int activeIndex = 1;

  List<String> getTabs(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return [
      localizations.menuDashboard,
      localizations.subscriptionManagement,
      localizations.packagePricing,
      localizations.moduleManagement,
      localizations.recentBackups,
      localizations.reports,
      localizations.profiles,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final tabs = getTabs(context);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: theme.gray200)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final isActive = index == activeIndex;
            return GestureDetector(
              onTap: () => setState(() => activeIndex = index),
              child: Container(
                margin: const EdgeInsets.only(right: 24),
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isActive ? theme.primary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  tabs[index],
                  style: AppTextStyles.label.copyWith(
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                    color: isActive ? theme.primary : theme.gray500,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class QuickFilterBar extends StatelessWidget {
  const QuickFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.gray100)),
      ),
      child: Row(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip(localizations.filterAllSub, context),
                  _filterChip(localizations.filterClient, context),
                  _filterChip(localizations.filterAllDate, context),
                  _filterChip(localizations.filterAllPackages, context),
                  _filterChip(localizations.filterAllStatuses, context),
                ],
              ),
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_alt_outlined, size: 18),
            label: Text(localizations.filterMore),
          ),
        ],
      ),
    );
  }

  Widget _filterChip(String label, BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: theme.gray50,
        border: Border.all(color: theme.gray200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: AppTextStyles.label.copyWith(
              fontSize: 13,
              color: theme.gray700,
            ),
          ),
          const SizedBox(width: 4),
          Icon(Icons.keyboard_arrow_down, size: 16, color: theme.gray400),
        ],
      ),
    );
  }
}
