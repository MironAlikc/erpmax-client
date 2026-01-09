import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ErpMaxColumn<T> {
  final String id;
  final String title;
  final double weight;
  final bool isSortable;
  final bool hasFilter;
  final TextAlign textAlign;
  final Widget Function(T item)? customCell;
  final String Function(T item)? valueGetter;

  ErpMaxColumn({
    required this.id,
    required this.title,
    this.weight = 1.0,
    this.isSortable = true,
    this.hasFilter = true,
    this.textAlign = TextAlign.left,
    this.customCell,
    this.valueGetter,
  });
}

enum SortOrder { none, asc, desc }

class UniversalErpTable<T> extends StatefulWidget {
  final List<T> items;
  final List<ErpMaxColumn<T>> columns;
  final double minWidth;
  final Set<String> selectedIds;
  final String Function(T item) idGetter;
  final Function(T item)? onRowTap;
  final Function(Set<String> selected)? onSelectionChanged;
  final Map<String, dynamic>? totals;
  final bool showVerticalLines;

  const UniversalErpTable({
    super.key,
    required this.items,
    required this.columns,
    required this.idGetter,
    this.minWidth = 1100,
    this.selectedIds = const {},
    this.onRowTap,
    this.onSelectionChanged,
    this.totals,
    this.showVerticalLines = true,
  });

  @override
  State<UniversalErpTable<T>> createState() => _UniversalErpTableState<T>();
}

class _UniversalErpTableState<T> extends State<UniversalErpTable<T>> {
  String? activeSortColumn;
  SortOrder currentSort = SortOrder.none;
  Map<String, String> filters = {};
  OverlayEntry? _filterOverlay;

  @override
  void dispose() {
    _closeFilter();
    super.dispose();
  }

  void _closeFilter() {
    _filterOverlay?.remove();
    _filterOverlay = null;
  }

  List<T> get _processedItems {
    List<T> list = List.from(widget.items);

    if (filters.isNotEmpty) {
      list = list.where((item) {
        return filters.entries.every((entry) {
          if (entry.value.isEmpty) return true;
          final col = widget.columns.firstWhere((c) => c.id == entry.key);
          final value = col.valueGetter?.call(item).toLowerCase() ?? "";
          return value.contains(entry.value.toLowerCase());
        });
      }).toList();
    }

    if (activeSortColumn != null && currentSort != SortOrder.none) {
      final col = widget.columns.firstWhere((c) => c.id == activeSortColumn);
      list.sort((a, b) {
        final valA = col.valueGetter?.call(a) ?? "";
        final valB = col.valueGetter?.call(b) ?? "";
        return currentSort == SortOrder.asc
            ? valA.compareTo(valB)
            : valB.compareTo(valA);
      });
    }

    return list;
  }

  void _toggleSelectAll(bool? select) {
    if (widget.onSelectionChanged == null) return;
    if (select == true) {
      final allVisibleIds = _processedItems
          .map((e) => widget.idGetter(e))
          .toSet();
      widget.onSelectionChanged!(allVisibleIds);
    } else {
      widget.onSelectionChanged!(<String>{});
    }
  }

  void _showFilter(LayerLink link, ErpMaxColumn col) {
    _closeFilter();
    _filterOverlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _closeFilter,
              behavior: HitTestBehavior.opaque,
            ),
          ),
          CompositedTransformFollower(
            link: link,
            targetAnchor: Alignment.bottomCenter,
            followerAnchor: Alignment.topCenter,
            offset: const Offset(0, 5),
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 220,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: "Search ${col.title}...",
                    isDense: true,
                    prefixIcon: const Icon(LucideIcons.search, size: 14),
                    suffixIcon: filters[col.id]?.isNotEmpty == true
                        ? IconButton(
                            icon: const Icon(LucideIcons.x, size: 14),
                            onPressed: () {
                              setState(() => filters.remove(col.id));
                              _closeFilter();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: (val) => setState(() => filters[col.id] = val),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    Overlay.of(context).insert(_filterOverlay!);
  }

  @override
  Widget build(BuildContext context) {
    final themeBorder = Colors.grey.shade300;
    final processedItems = _processedItems;

    return LayoutBuilder(
      builder: (context, constraints) {
        final double tableWidth = constraints.maxWidth > widget.minWidth
            ? constraints.maxWidth
            : widget.minWidth;

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: themeBorder),
          ),
          clipBehavior: Clip.antiAlias,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              width: tableWidth,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildHeader(themeBorder, processedItems),
                  ...processedItems.asMap().entries.map((entry) {
                    return _buildRow(entry.value, entry.key, themeBorder);
                  }),
                  if (widget.totals != null)
                    _buildFooter(themeBorder, processedItems),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader(Color borderColor, List<T> visibleItems) {
    final allVisibleSelected =
        visibleItems.isNotEmpty &&
        visibleItems.every(
          (item) => widget.selectedIds.contains(widget.idGetter(item)),
        );

    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        border: Border(bottom: BorderSide(color: borderColor)),
      ),
      child: Row(
        children: [
          _buildStaticCell(
            44,
            const Icon(LucideIcons.hash, size: 14),
            borderColor,
          ),
          _buildStaticCell(
            44,
            Checkbox(
              value: allVisibleSelected,
              onChanged: _toggleSelectAll,
              activeColor: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            borderColor,
          ),
          ...widget.columns.map(
            (col) => _HeaderCell(
              column: col,
              borderColor: borderColor,
              isFiltered: filters[col.id]?.isNotEmpty ?? false,
              sortOrder: activeSortColumn == col.id
                  ? currentSort
                  : SortOrder.none,
              onSort: () => setState(() {
                activeSortColumn = col.id;
                currentSort = currentSort == SortOrder.asc
                    ? SortOrder.desc
                    : SortOrder.asc;
              }),
              onFilter: (link) => _showFilter(link, col),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(T item, int index, Color borderColor) {
    final id = widget.idGetter(item);
    final isSelected = widget.selectedIds.contains(id);

    return InkWell(
      onTap: () => widget.onRowTap?.call(item),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.04) : Colors.white,
          border: Border(
            bottom: BorderSide(color: borderColor.withOpacity(0.5)),
          ),
        ),
        child: Row(
          children: [
            _buildStaticCell(
              44,
              Text("${index + 1}", style: const TextStyle(fontSize: 12)),
              borderColor,
            ),
            _buildStaticCell(
              44,
              Checkbox(
                value: isSelected,
                onChanged: (val) {
                  final newSelection = Set<String>.from(widget.selectedIds);
                  val == true ? newSelection.add(id) : newSelection.remove(id);
                  widget.onSelectionChanged?.call(newSelection);
                },
              ),
              borderColor,
            ),
            ...widget.columns.map(
              (col) => Expanded(
                flex: (col.weight * 100).toInt(),
                child: Container(
                  height: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  alignment: _getAlignment(col.textAlign),
                  decoration: BoxDecoration(
                    border: widget.showVerticalLines
                        ? Border(
                            right: BorderSide(
                              color: borderColor.withOpacity(0.5),
                            ),
                          )
                        : null,
                  ),
                  child:
                      col.customCell?.call(item) ??
                      Text(
                        col.valueGetter?.call(item) ?? "",
                        style: const TextStyle(fontSize: 13),
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter(Color borderColor, List<T> visibleItems) {
    return Container(
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        border: Border(top: BorderSide(color: borderColor, width: 2)),
      ),
      child: Row(
        children: [
          _buildStaticCell(
            44,
            Text(
              "${visibleItems.length}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
            borderColor,
          ),
          _buildStaticCell(
            44,
            Text(
              "${widget.selectedIds.length}",
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            borderColor,
          ),
          ...widget.columns.map((col) {
            final hasTotal = widget.totals?.containsKey(col.id) ?? false;
            final totalValue = widget.totals?[col.id]?.toString() ?? "";

            return Expanded(
              flex: (col.weight * 100).toInt(),
              child: Container(
                height: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: _getAlignment(col.textAlign),
                decoration: BoxDecoration(
                  border: widget.showVerticalLines
                      ? Border(
                          right: BorderSide(
                            color: borderColor.withOpacity(0.5),
                          ),
                        )
                      : null,
                ),
                child: Text(
                  hasTotal ? totalValue : "",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildStaticCell(double width, Widget child, Color borderColor) {
    return Container(
      width: width,
      height: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(right: BorderSide(color: borderColor)),
      ),
      child: child,
    );
  }

  Alignment _getAlignment(TextAlign align) {
    if (align == TextAlign.right) return Alignment.centerRight;
    if (align == TextAlign.center) return Alignment.center;
    return Alignment.centerLeft;
  }
}

class _HeaderCell extends StatelessWidget {
  final ErpMaxColumn column;
  final Color borderColor;
  final SortOrder sortOrder;
  final bool isFiltered;
  final VoidCallback onSort;
  final Function(LayerLink) onFilter;
  final LayerLink _link = LayerLink();

  _HeaderCell({
    required this.column,
    required this.borderColor,
    required this.sortOrder,
    required this.isFiltered,
    required this.onSort,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: (column.weight * 100).toInt(),
      child: CompositedTransformTarget(
        link: _link,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: borderColor)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  column.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              if (column.isSortable)
                InkWell(
                  onTap: onSort,
                  child: Icon(
                    _getIcon(),
                    size: 14,
                    color: sortOrder != SortOrder.none
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              if (column.hasFilter)
                InkWell(
                  onTap: () => onFilter(_link),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: Icon(
                      LucideIcons.filter,
                      size: 13,
                      color: isFiltered ? Colors.blue : Colors.grey.shade400,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    if (sortOrder == SortOrder.asc) return LucideIcons.chevronUp;
    if (sortOrder == SortOrder.desc) return LucideIcons.chevronDown;
    return LucideIcons.unfoldVertical;
  }
}
