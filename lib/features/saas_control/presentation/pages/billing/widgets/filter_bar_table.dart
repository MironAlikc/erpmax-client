import 'package:erpmax_client/core/constants/dimens.dart';
import 'package:erpmax_client/core/l10n/gen/app_localizations.dart';
import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:erpmax_client/core/widgets/common/dropdowns/app_dropdown.dart';
import 'package:erpmax_client/core/widgets/common/search_fields/app_search_field_table.dart';
import 'package:erpmax_client/features/saas_control/presentation/pages/billing/widgets/status_badge.dart';
import 'package:flutter/material.dart';

class FilterBarTable extends StatelessWidget {
  final String? searchHint;
  final String? countText;
  final InvoiceStatus? selectedStatus;
  final ValueChanged<String>? onSearchChanged;
  final ValueChanged<InvoiceStatus?>? onStatusChanged;

  const FilterBarTable({
    super.key,
    this.searchHint,
    this.countText,
    this.selectedStatus,
    this.onSearchChanged,
    this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;
    final localizations = AppLocalizations.of(context);

    final filterOptions = [
      StatusFilterOption(status: null, label: localizations.filterAllStatuses),
      ...InvoiceStatus.values.map(
        (s) => StatusFilterOption(status: s, label: s.label(localizations)),
      ),
    ];

    final currentOption = filterOptions.firstWhere(
      (opt) => opt.status == selectedStatus,
      orElse: () => filterOptions.first,
    );

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.p16,
        vertical: Dimens.p12,
      ),
      decoration: BoxDecoration(
        color: theme.white,
        borderRadius: BorderRadius.circular(Dimens.p12),
        border: Border.all(color: theme.border),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: AppSearchFieldTable(
              hintText: searchHint,
              onChanged: onSearchChanged,
            ),
          ),

          gapW16,

          AppDropdown<StatusFilterOption>(
            value: currentOption,
            items: filterOptions,
            itemLabelBuilder: (option) => option.label,
            onChanged: (StatusFilterOption chosenOption) {
              if (onStatusChanged != null) {
                onStatusChanged!(chosenOption.status);
              }
            },
          ),

          gapW16,

          Text(
            countText ?? '',
            style: AppTextStyles.label.copyWith(color: theme.textSecondary),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class StatusFilterOption {
  final InvoiceStatus? status;
  final String label;

  StatusFilterOption({required this.status, required this.label});
}
