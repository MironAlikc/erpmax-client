# Column Filtering

## Description
Filter rows by setting filters on columns. Select the SetFilter menu from the menu that appears when you tap the icon on the right of the column If the filter is set to all or complex conditions, TextField under the column is deactivated. Also, like the Disable column, if enableFilterMenuItem is false, it is excluded from all column filtering conditions. In the case of the Select column, it is a custom filter that can filter multiple filters with commas. (ex: a,b,c) Check out the source to add custom filters.

## Key Features
- Column filtering
- Cell editing
- Date column type
- Number column type

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../dummy_data/development.dart';
import '../../widget/pluto_example_button.dart';
import '../../widget/pluto_example_screen.dart';

class ColumnFilteringScreen extends StatefulWidget {
  static const routeName = 'feature/column-filtering';

  const ColumnFilteringScreen({Key? key}) : super(key: key);

  @override
  _ColumnFilteringScreenState createState() => _ColumnFilteringScreenState();
}

class _ColumnFilteringScreenState extends State<ColumnFilteringScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    columns.addAll([
      PlutoColumn(
        title: 'Text',
        field: 'text',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Number',
        field: 'number',
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'Date',
        field: 'date',
        type: PlutoColumnType.date(),
      ),
      PlutoColumn(
        title: 'Disable',
        field: 'disable',
        type: PlutoColumnType.text(),
        enableFilterMenuItem: false,
      ),
      PlutoColumn(
        title: 'Select',
        field: 'select',
        type: PlutoColumnType.select(<String>['A', 'B', 'C', 'D', 'E', 'F']),
      ),
    ]);

    rows.addAll(DummyData.rowsByColumns(length: 30, columns: columns));
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Column filtering',
      topTitle: 'Column filtering',
      topContents: const [
        Text('Filter rows by setting filters on columns.'),
        SizedBox(
          height: 10,
        ),
        Text(
            'Select the SetFilter menu from the menu that appears when you tap the icon on the right of the column'),
        Text(
            'If the filter is set to all or complex conditions, TextField under the column is deactivated.'),
        Text(
            'Also, like the Disable column, if enableFilterMenuItem is false, it is excluded from all column filtering conditions.'),
        Text(
            'In the case of the Select column, it is a custom filter that can filter multiple filters with commas. (ex: a,b,c)'),
        SizedBox(
          height: 10,
        ),
        Text('Check out the source to add custom filters.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/column_filtering_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setShowColumnFilter(true);
        },
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        configuration: PlutoGridConfiguration(
          /// If columnFilterConfig is not set, the default setting is applied.
          ///
          /// Return the value returned by resolveDefaultColumnFilter through the resolver function.
          /// Prevents errors returning filters that are not in the filters list.
          columnFilter: PlutoGridColumnFilterConfig(
            filters: const [
              ...FilterHelper.defaultFilters,
              // custom filter
              ClassYouImplemented(),
            ],
            resolveDefaultColumnFilter: (column, resolver) {
              if (column.field == 'text') {
                return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
              } else if (column.field == 'number') {
                return resolver<PlutoFilterTypeGreaterThan>()
                    as PlutoFilterType;
              } else if (column.field == 'date') {
                return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
              } else if (column.field == 'select') {
                return resolver<ClassYouImplemented>() as PlutoFilterType;
              }

              return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
            },
          ),
        ),
      ),
    );
  }
}

class ClassYouImplemented implements PlutoFilterType {
  @override
  String get title => 'Custom contains';

  @override
  get compare => ({
        required String? base,
        required String? search,
        required PlutoColumn? column,
      }) {
        var keys = search!.split(',').map((e) => e.toUpperCase()).toList();

        return keys.contains(base!.toUpperCase());
      };

  const ClassYouImplemented();
}

```

## PlutoGrid Configuration

```dart
PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setShowColumnFilter(true);
        },
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        configuration: PlutoGridConfiguration(
          /// If columnFilterConfig is not set, the default setting is applied.
          ///
          /// Return the value returned by resolveDefaultColumnFilter through the resolver function.
          /// Prevents errors returning filters that are not in the filters list.
          columnFilter: PlutoGridColumnFilterConfig(
            filters: const [
              ...FilterHelper.defaultFilters,
              // custom filter
              ClassYouImplemented(),
            ],
            resolveDefaultColumnFilter: (column, resolver) {
              if (column.field == 'text') {
                return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
              } else if (column.field == 'number') {
                return resolver<PlutoFilterTypeGreaterThan>()
                    as PlutoFilterType;
              } else if (column.field == 'date') {
                return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
              } else if (column.field == 'select') {
                return resolver<ClassYouImplemented>() as PlutoFilterType;
              }

              return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
            },
          ),
        ),
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Column filtering',
      topTitle: 'Column filtering',
      topContents: const [
        Text('Filter rows by setting filters on columns.'),
        SizedBox(
          height: 10,
        ),
        Text(
            'Select the SetFilter menu from the menu that appears when you tap the icon on the right of the column'),
        Text(
            'If the filter is set to all or complex conditions, TextField under the column is deactivated.'),
        Text(
            'Also, like the Disable column, if enableFilterMenuItem is false, it is excluded from all column filtering conditions.'),
        Text(
            'In the case of the Select column, it is a custom filter that can filter multiple filters with commas. (ex: a,b,c)'),
        SizedBox(
          height: 10,
        ),
        Text('Check out the source to add custom filters.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/column_filtering_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setShowColumnFilter(true);
        },
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        configuration: PlutoGridConfiguration(
          /// If columnFilterConfig is not set, the default setting is applied.
          ///
          /// Return the value returned by resolveDefaultColumnFilter through the resolver function.
          /// Prevents errors returning filters that are not in the filters list.
          columnFilter: PlutoGridColumnFilterConfig(
            filters: const [
              ...FilterHelper.defaultFilters,
              // custom filter
              ClassYouImplemented(),
            ],
            resolveDefaultColumnFilter: (column, resolver) {
              if (column.field == 'text') {
                return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
              } else if (column.field == 'number') {
                return resolver<PlutoFilterTypeGreaterThan>()
                    as PlutoFilterType;
              } else if (column.field == 'date') {
                return resolver<PlutoFilterTypeLessThan>() as PlutoFilterType;
              } else if (column.field == 'select') {
                return resolver<ClassYouImplemented>() as PlutoFilterType;
              }

              return resolver<PlutoFilterTypeContains>() as PlutoFilterType;
            },
          ),
        ),
      ),
    );
}
```

## Usage Example

```dart
// Basic usage in your app:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ColumnFilteringScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onLoaded**: Callback when grid is loaded
- **onChanged**: Callback when cell value changes
- **configuration**: Grid configuration settings

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/column_filtering_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
