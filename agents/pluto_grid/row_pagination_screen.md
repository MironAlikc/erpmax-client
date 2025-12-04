# Row Pagination

## Description
If you pass the built-in PlutoPagination widget as the return value of the createFooter callback when creating a grid, pagination is processed. Also, referring to PlutoPagination, you can create a UI in the desired shape and set it as the response value of the createFooter callback.

## Key Features
- Row pagination
- Cell editing

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../dummy_data/development.dart';
import '../../widget/pluto_example_button.dart';
import '../../widget/pluto_example_screen.dart';

class RowPaginationScreen extends StatefulWidget {
  static const routeName = 'feature/row-pagination';

  const RowPaginationScreen({Key? key}) : super(key: key);

  @override
  _RowPaginationScreenState createState() => _RowPaginationScreenState();
}

class _RowPaginationScreenState extends State<RowPaginationScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    final dummyData = DummyData(10, 5000);

    columns.addAll(dummyData.columns);

    rows.addAll(dummyData.rows);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Row pagination',
      topTitle: 'Row pagination',
      topContents: const [
        Text(
            'If you pass the built-in PlutoPagination widget as the return value of the createFooter callback when creating a grid, pagination is processed.'),
        Text(
            'Also, referring to PlutoPagination, you can create a UI in the desired shape and set it as the response value of the createFooter callback.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/row_pagination_screen.dart',
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
        configuration: const PlutoGridConfiguration(),
        createFooter: (stateManager) {
          stateManager.setPageSize(100, notify: false); // default 40
          return PlutoPagination(stateManager);
        },
      ),
    );
  }
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
        configuration: const PlutoGridConfiguration(),
        createFooter: (stateManager) {
          stateManager.setPageSize(100, notify: false); // default 40
          return PlutoPagination(stateManager);
        },
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Row pagination',
      topTitle: 'Row pagination',
      topContents: const [
        Text(
            'If you pass the built-in PlutoPagination widget as the return value of the createFooter callback when creating a grid, pagination is processed.'),
        Text(
            'Also, referring to PlutoPagination, you can create a UI in the desired shape and set it as the response value of the createFooter callback.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/row_pagination_screen.dart',
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
        configuration: const PlutoGridConfiguration(),
        createFooter: (stateManager) {
          stateManager.setPageSize(100, notify: false); // default 40
          return PlutoPagination(stateManager);
        },
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
        body: RowPaginationScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **createFooter**: Custom footer widget (e.g., pagination)
- **onLoaded**: Callback when grid is loaded
- **onChanged**: Callback when cell value changes
- **configuration**: Grid configuration settings

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/row_pagination_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
