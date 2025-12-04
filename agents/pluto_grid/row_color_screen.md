# Row Color

## Description
You can dynamically change the row color of row by implementing rowColorCallback. If you change the value of the 5th column, the background color is dynamically changed according to the value.

## Key Features
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

class RowColorScreen extends StatefulWidget {
  static const routeName = 'feature/row-color';

  const RowColorScreen({Key? key}) : super(key: key);

  @override
  _RowColorScreenState createState() => _RowColorScreenState();
}

class _RowColorScreenState extends State<RowColorScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  late PlutoGridStateManager stateManager;

  @override
  void initState() {
    super.initState();

    final dummyData = DummyData(10, 100);

    columns.addAll(dummyData.columns);

    rows.addAll(dummyData.rows);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Row color',
      topTitle: 'Row color',
      topContents: const [
        Text(
            'You can dynamically change the row color of row by implementing rowColorCallback.'),
        Text(
            'If you change the value of the 5th column, the background color is dynamically changed according to the value.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/row_color_screen.dart',
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
        rowColorCallback: (rowColorContext) {
          if (rowColorContext.row.cells.entries.elementAt(4).value.value ==
              'One') {
            return Colors.blueAccent;
          } else if (rowColorContext.row.cells.entries
                  .elementAt(4)
                  .value
                  .value ==
              'Two') {
            return Colors.cyanAccent;
          }

          return Colors.deepOrange;
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
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.row);

          stateManager = event.stateManager;
        },
        rowColorCallback: (rowColorContext) {
          if (rowColorContext.row.cells.entries.elementAt(4).value.value ==
              'One') {
            return Colors.blueAccent;
          } else if (rowColorContext.row.cells.entries
                  .elementAt(4)
                  .value
                  .value ==
              'Two') {
            return Colors.cyanAccent;
          }

          return Colors.deepOrange;
        },
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Row color',
      topTitle: 'Row color',
      topContents: const [
        Text(
            'You can dynamically change the row color of row by implementing rowColorCallback.'),
        Text(
            'If you change the value of the 5th column, the background color is dynamically changed according to the value.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/row_color_screen.dart',
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
        rowColorCallback: (rowColorContext) {
          if (rowColorContext.row.cells.entries.elementAt(4).value.value ==
              'One') {
            return Colors.blueAccent;
          } else if (rowColorContext.row.cells.entries
                  .elementAt(4)
                  .value
                  .value ==
              'Two') {
            return Colors.cyanAccent;
          }

          return Colors.deepOrange;
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
        body: RowColorScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onLoaded**: Callback when grid is loaded
- **onChanged**: Callback when cell value changes

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/row_color_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
