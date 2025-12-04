# Row With Checkbox

## Description
You can select rows with checkbox. If you set the enableRowChecked property of a column to true, a checkbox appears in the cell of that column.

## Key Features
- Checkbox selection
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

class RowWithCheckboxScreen extends StatefulWidget {
  static const routeName = 'feature/row-with-checkbox';

  const RowWithCheckboxScreen({Key? key}) : super(key: key);

  @override
  _RowWithCheckboxScreenState createState() => _RowWithCheckboxScreenState();
}

class _RowWithCheckboxScreenState extends State<RowWithCheckboxScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();

    columns.addAll([
      PlutoColumn(
        title: 'column1',
        field: 'column1',
        type: PlutoColumnType.text(),
        enableRowDrag: true,
        enableRowChecked: true,
      ),
      PlutoColumn(
        title: 'column2',
        field: 'column2',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'column3',
        field: 'column3',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'column4',
        field: 'column4',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'column5',
        field: 'column5',
        type: PlutoColumnType.text(),
      ),
    ]);

    rows.addAll(DummyData.rowsByColumns(length: 15, columns: columns));
  }

  void handleOnRowChecked(PlutoGridOnRowCheckedEvent event) {
    if (event.isRow) {
      // or event.isAll
      print('Toggled A Row.');
      print(event.row?.cells['column1']?.value);
    } else {
      print('Toggled All Rows.');
      print(stateManager.checkedRows.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Row with checkbox',
      topTitle: 'Row with checkbox',
      topContents: const [
        Text('You can select rows with checkbox.'),
        Text(
            'If you set the enableRowChecked property of a column to true, a checkbox appears in the cell of that column.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/row_with_checkbox_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);

          stateManager = event.stateManager;
        },
        onRowChecked: handleOnRowChecked,
        // configuration: PlutoConfiguration.dark(),
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
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);

          stateManager = event.stateManager;
        },
        onRowChecked: handleOnRowChecked,
        // configuration: PlutoConfiguration.dark(),
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Row with checkbox',
      topTitle: 'Row with checkbox',
      topContents: const [
        Text('You can select rows with checkbox.'),
        Text(
            'If you set the enableRowChecked property of a column to true, a checkbox appears in the cell of that column.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/row_with_checkbox_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);

          stateManager = event.stateManager;
        },
        onRowChecked: handleOnRowChecked,
        // configuration: PlutoConfiguration.dark(),
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
        body: RowWithCheckboxScreen(),
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
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/row_with_checkbox_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
