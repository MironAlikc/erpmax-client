import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'package:flutter/material.dart';

class ErpMaxColumn {
  final String title;
  final double weight;
  final bool isSortable;
  final String? sortKey;
  final TextAlign textAlign;

  ErpMaxColumn({
    required this.title,
    required this.weight,
    this.isSortable = false,
    this.sortKey,
    this.textAlign = TextAlign.left,
  });
}

class ErpMaxTable extends StatelessWidget {
  final List<ErpMaxColumn> columns;
  final List<Widget> rows;
  final double minWidth;
  final String? currentSortKey;
  final bool isAscending;
  final Function(String key, bool ascending)? onSort;

  const ErpMaxTable({
    super.key,
    required this.columns,
    required this.rows,
    this.minWidth = 1000,
    this.currentSortKey,
    this.isAscending = true,
    this.onSort,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = AppColorExtension.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        // Если экран шире minWidth, растягиваем таблицу на весь экран
        final double tableWidth = constraints.maxWidth < minWidth
            ? minWidth
            : constraints.maxWidth;

        return Scrollbar(
          thumbVisibility: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: tableWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [_buildHeader(context, colors, theme), ...rows],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(
    BuildContext context,
    AppColorExtension colors,
    ThemeData theme,
  ) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // Адаптивно под тему
        border: Border(
          bottom: BorderSide(
            color: colors.textDisabled.withValues(alpha: 0.1),
            width: 1.5,
          ),
        ),
      ),
      child: Row(
        children: columns.map((col) {
          return Expanded(
            flex: (col.weight * 100).toInt(), // Точнее расчет
            child: InkWell(
              onTap: col.isSortable && col.sortKey != null
                  ? () => onSort?.call(col.sortKey!, !isAscending)
                  : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: _getAlignment(col.textAlign),
                  children: [
                    Text(
                      col.title.toUpperCase(),
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colors.textSecondary,
                        letterSpacing: 0.5,
                      ),
                    ),
                    if (col.isSortable) ...[
                      const SizedBox(width: 4),
                      Icon(
                        currentSortKey == col.sortKey
                            ? (isAscending
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward)
                            : Icons.swap_vert_rounded,
                        size: 14,
                        color: colors.textDisabled,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  MainAxisAlignment _getAlignment(TextAlign align) {
    return switch (align) {
      TextAlign.right => MainAxisAlignment.end,
      TextAlign.center => MainAxisAlignment.center,
      _ => MainAxisAlignment.start,
    };
  }
}

class ErpMaxRow extends StatelessWidget {
  final List<Widget> cells;
  final List<ErpMaxColumn> columns;
  final VoidCallback? onTap;

  const ErpMaxRow({
    super.key,
    required this.cells,
    required this.columns,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColorExtension.of(context);
    Theme.of(context);

    return InkWell(
      onTap: onTap,
      hoverColor: colors.primaryDark.withValues(alpha: 0.05),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: colors.textDisabled.withValues(alpha: 0.05),
            ),
          ),
        ),
        child: Row(
          children: List.generate(cells.length, (index) {
            return Expanded(
              flex: (columns[index].weight * 100).toInt(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: _getCellAlignment(columns[index].textAlign),
                child: cells[index],
              ),
            );
          }),
        ),
      ),
    );
  }

  Alignment _getCellAlignment(TextAlign align) {
    return switch (align) {
      TextAlign.right => Alignment.centerRight,
      TextAlign.center => Alignment.center,
      _ => Alignment.centerLeft,
    };
  }
}
