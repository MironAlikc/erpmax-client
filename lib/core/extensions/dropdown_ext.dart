import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/accounting_dashboard/accounting_metrics/this_month/dashboard_this_month.dart';
import 'package:erpmax_client/features/accounting/presentation/widgets/accounting_tabs/general_ledger/general_ledger_filters/general_ledger_filter_bar.dart';
import 'package:flutter/widgets.dart';

extension OrganizationTypeExt on OrganizationType {
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return {
      OrganizationType.main: l10n.orgMainCompany,
      OrganizationType.branch: l10n.orgBranchCompany,
      OrganizationType.distribution: l10n.orgDistributionCompany,
    }[this]!;
  }
}

extension BookTypeExt on BookType {
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return {
      BookType.main: l10n.book_type_main,
      BookType.tax: l10n.book_type_tax,
      BookType.internal: l10n.book_type_internal,
    }[this]!;
  }
}

extension DeptTypeExt on DeptType {
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return {
      DeptType.centers: l10n.all_cost_centers,
      DeptType.headquarters: l10n.dept_headquarters,
      DeptType.sales: l10n.dept_sales,
      DeptType.marketing: l10n.dept_marketing,
      DeptType.operations: l10n.dept_operations,
    }[this]!;
  }
}

extension ProjectTypeExt on ProjectType {
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return {
      ProjectType.all: l10n.project_all,
      ProjectType.expansion: l10n.project_expansion,
      ProjectType.development: l10n.project_development,
      ProjectType.modernization: l10n.project_modernization,
    }[this]!;
  }
}

extension TimePeriodTypeExt on TimePeriodType {
  String label(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return {
      TimePeriodType.today: l10n.period_today,
      TimePeriodType.week: l10n.period_this_week,
      TimePeriodType.month: l10n.period_this_month,
      TimePeriodType.quarter: l10n.period_this_quarter,
      TimePeriodType.year: l10n.period_this_year,
    }[this]!;
  }
}
