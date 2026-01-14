import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/table/universal_erp_table.dart';
import 'package:erpmax_client/features/saas_control/data/models/subscriber_model.dart';
import 'package:erpmax_client/features/saas_control/presentation/bloc/subscribers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubscribersContent extends StatefulWidget {
  const SubscribersContent({super.key});

  @override
  State<SubscribersContent> createState() => _SubscribersContentState();
}

class _SubscribersContentState extends State<SubscribersContent> {
  Set<String> _selectedSubscriberIds = {};

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final List<ErpMaxColumn<SubscriberModel>> columns = [
      ErpMaxColumn(
        id: 'tenant',
        title: localizations.columnTenant,
        weight: 2.2,
        valueGetter: (i) => i.company,
        customCell: (item) => buildTenantCell(context, item),
      ),
      ErpMaxColumn(
        id: 'plan',
        title: localizations.columnPlan,
        weight: 1.2,
        valueGetter: (i) => i.plan,
        customCell: (item) => buildPlanBadge(context, item.plan),
      ),
      ErpMaxColumn(
        id: 'status',
        title: localizations.status,
        weight: 1.2,
        valueGetter: (i) => i.status.name,
        customCell: (item) =>
            buildStatusBadge(context, SubscriberStatus.active),
      ),
      ErpMaxColumn(
        id: 'users',
        title: localizations.columnUsers,
        weight: 1.6,
        valueGetter: (i) => "${i.currentUsers}/${i.maxUsers}",
        customCell: (item) => buildProgressCell(
          context,
          item.currentUsers,
          item.maxUsers,
          Icons.people_outline,
          "",
        ),
      ),
      ErpMaxColumn(
        id: 'storage',
        title: localizations.columnStorage,
        weight: 1.6,
        valueGetter: (i) => "${i.currentStorage}/${i.maxStorage}",
        customCell: (item) => buildProgressCell(
          context,
          item.currentStorage.toInt(),
          item.maxStorage.toInt(),
          Icons.inventory_2_outlined,
          "GB",
        ),
      ),
      ErpMaxColumn(
        id: 'date',
        title: localizations.columnRenewalDate,
        weight: 1.5,
        valueGetter: (i) => i.startDate,
        customCell: (item) => buildDateCell(context, item.endDate),
      ),
      ErpMaxColumn(
        id: 'actions',
        title: localizations.actions,
        weight: 0.5,
        isSortable: false,
        hasFilter: false,
        textAlign: TextAlign.right,
        customCell: (item) =>
            const Icon(Icons.more_horiz, color: Color(0xFF94A3B8)),
      ),
    ];

    return BlocBuilder<SubscribersBloc, SubscribersState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: CircularProgressIndicator(),
            ),
          ),
          error: (message) => Center(
            child: Column(
              children: [
                Text('Error: $message'),
                ElevatedButton(
                  onPressed: () => context.read<SubscribersBloc>().add(
                    const SubscribersEvent.refreshRequested(),
                  ),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          success: (subscribers) {
            if (subscribers.isEmpty) {
              return const Center(child: Text('No subscribers found'));
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildTopStatsRow(context, subscribers),
                  const SizedBox(height: 24),
                  buildSearchField(context),
                  const SizedBox(height: 16),
                  // Сама таблица
                  UniversalErpTable<SubscriberModel>(
                    items: subscribers,
                    columns: columns,
                    minWidth: 1100,
                    idGetter: (item) => item.email,
                    selectedIds: _selectedSubscriberIds,
                    onSelectionChanged: (newSelection) {
                      setState(() => _selectedSubscriberIds = newSelection);
                    },
                    showVerticalLines: true,
                    totals: {
                      'tenant': 'Total Subscribers: ${subscribers.length}',
                      'users': 'Total Users: _',
                    },
                    onRowTap: (item) {
                      debugPrint("Tapped on ${item.company}");
                    },
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget buildTopStatsRow(
    BuildContext context,
    List<SubscriberModel> subscribers,
  ) {
    final localizations = AppLocalizations.of(context);
    final theme = context.theme.appColor;

    final totalTenants = subscribers.length;
    final activeSubscriptions = subscribers
        .where((s) => s.status == SubscriberStatus.active)
        .length;
    final trialAccounts = subscribers
        .where((s) => s.status == SubscriberStatus.trial)
        .length;
    final suspendedAccounts = subscribers
        .where((s) => s.status == SubscriberStatus.suspended)
        .length;

    return Row(
      children: [
        statCard(
          context,
          localizations.statTotalTenants,
          totalTenants.toString(),
          theme.indigoBg,
          theme.indigoText,
          Icons.business,
        ),
        const SizedBox(width: 16),
        statCard(
          context,
          localizations.activeSubscriptions,
          activeSubscriptions.toString(),
          theme.successLight,
          theme.success,
          Icons.check_circle_outline,
        ),
        const SizedBox(width: 16),
        statCard(
          context,
          localizations.statTrialAccounts,
          trialAccounts.toString(),
          theme.warningLight,
          theme.warning,
          Icons.access_time,
        ),
        const SizedBox(width: 16),
        statCard(
          context,
          localizations.statusSuspended,
          suspendedAccounts.toString(),
          theme.errorLight,
          theme.error,
          Icons.pause_circle_outline,
        ),
        const SizedBox(width: 16),
        statCard(
          context,
          localizations.statMRR,
          "0",
          theme.bgLight,
          theme.black,
          Icons.credit_card_outlined,
          suffix: "SAR",
        ),
      ],
    );
  }

  Widget statCard(
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
                  style: AppTextStyles.label.copyWith(
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

  Widget buildSearchField(BuildContext context) {
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

  Widget buildTenantCell(BuildContext context, SubscriberModel item) {
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
                item.company,
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

  Widget buildPlanBadge(BuildContext context, String plan) {
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

  Widget buildStatusBadge(BuildContext context, SubscriberStatus status) {
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

  Widget buildProgressCell(
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

  Widget buildDateCell(BuildContext context, String date) {
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
          style: AppTextStyles.label.copyWith(color: theme.textPrimary),
        ),
      ],
    );
  }
}
