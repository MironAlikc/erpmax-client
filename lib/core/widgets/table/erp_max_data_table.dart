import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';
import 'erpmax_table.dart';

class ErpMaxDataTable<T> extends StatefulWidget {
  final List<ErpMaxColumn> columns;
  final List<T> items;
  final List<Widget> Function(T item) rowBuilder;
  final void Function(T item)? onRowTap;
  final bool isBusy;

  const ErpMaxDataTable({
    super.key,
    required this.columns,
    required this.items,
    required this.rowBuilder,
    this.onRowTap,
    this.isBusy = false,
  });

  @override
  State<ErpMaxDataTable<T>> createState() => _ErpMaxDataTableState<T>();
}

class _ErpMaxDataTableState<T> extends State<ErpMaxDataTable<T>> {
  String? _currentSortKey;
  bool _isAscending = true;

  void _handleSort(String key, bool ascending) {
    setState(() {
      _currentSortKey = key;
      _isAscending = ascending;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppColorExtension.of(context);
    if (widget.isBusy && widget.items.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (widget.items.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(child: Text("No data available")),
      );
    }

    return ErpMaxTable(
      columns: widget.columns,
      currentSortKey: _currentSortKey,
      isAscending: _isAscending,
      onSort: _handleSort,
      rows: widget.items.map((item) {
        return ErpMaxRow(
          columns: widget.columns,
          onTap: widget.onRowTap != null ? () => widget.onRowTap!(item) : null,
          cells: widget.rowBuilder(item),
        );
      }).toList(),
    );
  }
}
