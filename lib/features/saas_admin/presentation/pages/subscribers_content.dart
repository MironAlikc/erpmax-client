import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/erpmax_table.dart';
import 'package:flutter/material.dart';

enum SubscriberStatus { active, expired, trial, suspended }

class SubscriberModel {
  final String companyName;
  final String email;
  final String planName;
  final SubscriberStatus status;
  final int currentUsers;
  final int maxUsers;
  final double currentStorage;
  final double maxStorage;
  final String renewalDate;

  const SubscriberModel({
    required this.companyName,
    required this.email,
    required this.planName,
    required this.status,
    required this.currentUsers,
    required this.maxUsers,
    required this.currentStorage,
    required this.maxStorage,
    required this.renewalDate,
  });
}

class SubscribersContent extends StatelessWidget {
  const SubscribersContent({super.key});

  static const List<SubscriberModel> _subscribers = [
    SubscriberModel(
      companyName: "Tech Solutions Co.",
      email: "admin@techsolutions.com",
      planName: "Enterprise",
      status: SubscriberStatus.active,
      currentUsers: 45,
      maxUsers: 100,
      currentStorage: 85,
      maxStorage: 200,
      renewalDate: "2024-12-01",
    ),
    SubscriberModel(
      companyName: "Al-Amal Trading",
      email: "info@alamal.com",
      planName: "Professional",
      status: SubscriberStatus.active,
      currentUsers: 12,
      maxUsers: 25,
      currentStorage: 32,
      maxStorage: 50,
      renewalDate: "2024-11-15",
    ),
    SubscriberModel(
      companyName: "Future Vision",
      email: "contact@futurevision.sa",
      planName: "Starter",
      status: SubscriberStatus.expired,
      currentUsers: 3,
      maxUsers: 5,
      currentStorage: 8,
      maxStorage: 10,
      renewalDate: "2024-01-20",
    ),
    SubscriberModel(
      companyName: "Global Logistics",
      email: "it@globallogistics.com",
      planName: "Enterprise",
      status: SubscriberStatus.active,
      currentUsers: 120,
      maxUsers: 150,
      currentStorage: 180,
      maxStorage: 200,
      renewalDate: "2025-03-10",
    ),
    SubscriberModel(
      companyName: "Smart Retail",
      email: "admin@smartretail.sa",
      planName: "Professional",
      status: SubscriberStatus.trial,
      currentUsers: 8,
      maxUsers: 25,
      currentStorage: 15,
      maxStorage: 50,
      renewalDate: "2024-02-15",
    ),
    SubscriberModel(
      companyName: "Mazen Electronics",
      email: "support@mazen.com",
      planName: "Professional",
      status: SubscriberStatus.suspended,
      currentUsers: 15,
      maxUsers: 25,
      currentStorage: 28,
      maxStorage: 50,
      renewalDate: "2024-01-01",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final List<ErpMaxColumn> columns = [
      ErpMaxColumn(title: localizations.columnTenant, weight: 0.22),
      ErpMaxColumn(title: localizations.columnPlan, weight: 0.12),
      ErpMaxColumn(title: localizations.status, weight: 0.12),
      ErpMaxColumn(title: localizations.columnUsers, weight: 0.16),
      ErpMaxColumn(title: localizations.columnStorage, weight: 0.16),
      ErpMaxColumn(title: localizations.columnRenewalDate, weight: 0.15),
      ErpMaxColumn(
        title: localizations.actions,
        weight: 0.05,
        textAlign: TextAlign.right,
      ),
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopStatsRow(context),
          const SizedBox(height: 24),
          _buildSearchField(context),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: Column(
              children: [
                ErpMaxTable(
                  columns: columns,
                  minWidth: 1100,
                  rows: _subscribers.map((item) {
                    return ErpMaxRow(
                      columns: columns,
                      cells: [
                        _buildTenantCell(context, item),
                        _buildPlanBadge(context, item.planName),
                        _buildStatusBadge(context, item.status),
                        _buildProgressCell(
                          context,
                          item.currentUsers,
                          item.maxUsers,
                          Icons.people_outline,
                          "",
                        ),
                        _buildProgressCell(
                          context,
                          item.currentStorage.toInt(),
                          item.maxStorage.toInt(),
                          Icons.inventory_2_outlined,
                          "GB",
                        ),
                        _buildDateCell(context, item.renewalDate),
                        const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
                      ],
                    );
                  }).toList(),
                ),
                _buildPaginationFooter(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- Widgets ---

  Widget _buildTopStatsRow(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = context.theme.appColor;

    return Row(
      children: [
        _statCard(
          context,
          localizations.statTotalTenants,
          "6",
          theme.indigoBg,
          theme.indigoText,
          Icons.business,
        ),
        const SizedBox(width: 16),
        _statCard(
          context,
          localizations.activeSubscriptions,
          "3",
          theme.successLight,
          theme.success,
          Icons.check_circle_outline,
        ),
        const SizedBox(width: 16),
        _statCard(
          context,
          localizations.statTrialAccounts,
          "1",
          theme.warningLight,
          theme.warning,
          Icons.access_time,
        ),
        const SizedBox(width: 16),
        _statCard(
          context,
          localizations.statusSuspended,
          "1",
          theme.errorLight,
          theme.error,
          Icons.pause_circle_outline,
        ),
        const SizedBox(width: 16),
        _statCard(
          context,
          localizations.statMRR,
          "11 500",
          theme.bgLight,
          theme.black,
          Icons.credit_card_outlined,
          suffix: "SAR",
        ),
      ],
    );
  }

  Widget _statCard(
    BuildContext context,
    String title,
    String value,
    Color bg,
    Color color,
    IconData icon, {
    String? suffix,
  }) {
    final theme = context.theme.appColor;

    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.1)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: theme.white, size: 24),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: AppTextStyles.labelStyle.copyWith(
                    fontSize: 13,
                    color: color.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: AppTextStyles.base.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: theme.textPrimary,
                      ),
                    ),
                    if (suffix != null) ...[
                      const SizedBox(width: 4),
                      Text(
                        suffix,
                        style: AppTextStyles.tableHeader.copyWith(
                          color: theme.textTertiary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.border),
      ),
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: theme.textDisabled),
          hintText: AppLocalizations.of(context).searchTenants,
          border: InputBorder.none,
          hintStyle: AppTextStyles.base.copyWith(color: theme.textDisabled),
        ),
      ),
    );
  }

  Widget _buildTenantCell(BuildContext context, SubscriberModel item) {
    final theme = context.theme.appColor;

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.bgLight,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: theme.border),
          ),
          child: Icon(Icons.business, size: 20, color: theme.textTertiary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                item.companyName,
                style: AppTextStyles.bodyMediumBold.copyWith(
                  color: theme.textPrimary,
                ),
              ),
              Text(
                item.email,
                style: AppTextStyles.tableHeader.copyWith(
                  color: theme.textDisabled,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPlanBadge(BuildContext context, String plan) {
    final theme = context.theme.appColor;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: theme.violetBg,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.violetBg),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.auto_awesome_motion, size: 14, color: theme.violetText),
          const SizedBox(width: 6),
          Text(
            plan,
            style: AppTextStyles.tableHeader.copyWith(
              color: theme.violetText,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(BuildContext context, SubscriberStatus status) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    Color bg;
    Color text;
    String label;
    IconData icon;

    switch (status) {
      case SubscriberStatus.active:
        bg = theme.successLight;
        text = theme.successText;
        label = localizations.active;
        icon = Icons.check_circle_outline;
        break;
      case SubscriberStatus.expired:
        bg = theme.neutralBg;
        text = theme.neutralText;
        label = localizations.statusExpired;
        icon = Icons.cancel_outlined;
        break;
      case SubscriberStatus.trial:
        bg = theme.warningLight;
        text = theme.warningText;
        label = localizations.statusTrial;
        icon = Icons.access_time;
        break;
      case SubscriberStatus.suspended:
        bg = theme.errorLight;
        text = theme.errorText;
        label = localizations.statusSuspended;
        icon = Icons.pause_circle_outline;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: text),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.tableHeader.copyWith(
              color: text,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressCell(
    BuildContext context,
    int current,
    int max,
    IconData icon,
    String unit,
  ) {
    final theme = context.theme.appColor;
    double progress = (current / max).clamp(0.0, 1.0);
    bool isWarning = progress > 0.85;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$current/$max $unit",
              style: AppTextStyles.bodySmallBold.copyWith(
                color: theme.textPrimary,
              ),
            ),
            Icon(icon, size: 16, color: theme.textDisabled),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: theme.inactiveBg,
            valueColor: AlwaysStoppedAnimation<Color>(
              isWarning ? theme.warning : theme.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateCell(BuildContext context, String date) {
    final theme = context.theme.appColor;

    return Row(
      children: [
        const Icon(
          Icons.calendar_today_outlined,
          size: 16,
          color: Color(0xFF94A3B8),
        ),
        const SizedBox(width: 8),
        Text(
          date,
          style: AppTextStyles.labelStyle.copyWith(color: theme.textPrimary),
        ),
      ],
    );
  }

  Widget _buildPaginationFooter(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: theme.inactiveBg)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            localizations.paginationShowing(6, 6),
            style: AppTextStyles.bodySmall.copyWith(color: theme.textTertiary),
          ),
          Row(
            children: [
              _footerStat(
                context,
                Icons.people_outline,
                localizations.totalUsersCount(203),
              ),
              const SizedBox(width: 24),
              _footerStat(
                context,
                Icons.visibility_outlined,
                localizations.clickForDetails,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerStat(BuildContext context, IconData icon, String text) {
    final theme = context.theme.appColor;

    return Row(
      children: [
        Icon(icon, size: 16, color: theme.textDisabled),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.bodySmall.copyWith(color: theme.textTertiary),
        ),
      ],
    );
  }
}
