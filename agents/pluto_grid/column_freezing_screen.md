# Column Freezing

## Description
You can freeze the column by tapping ToLeft, ToRight in the dropdown menu that appears when you tap the icon to the right of the column title. If the width of the middle columns is narrow, the frozen column is released.

## Key Features
- Column freezing
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

class ColumnFreezingScreen extends StatefulWidget {
  static const routeName = 'feature/column-freezing';

  const ColumnFreezingScreen({Key? key}) : super(key: key);

  @override
  _ColumnFreezingScreenState createState() => _ColumnFreezingScreenState();
}

class _ColumnFreezingScreenState extends State<ColumnFreezingScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

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
      title: 'Column freezing',
      topTitle: 'Column freezing',
      topContents: const [
        Text(
            'You can freeze the column by tapping ToLeft, ToRight in the dropdown menu that appears when you tap the icon to the right of the column title.'),
        Text(
            'If the width of the middle columns is narrow, the frozen column is released.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/column_freezing_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.cell);
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
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.cell);
        },
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Column freezing',
      topTitle: 'Column freezing',
      topContents: const [
        Text(
            'You can freeze the column by tapping ToLeft, ToRight in the dropdown menu that appears when you tap the icon to the right of the column title.'),
        Text(
            'If the width of the middle columns is narrow, the frozen column is released.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/column_freezing_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        onLoaded: (PlutoGridOnLoadedEvent event) {
          event.stateManager.setSelectingMode(PlutoGridSelectingMode.cell);
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
        body: ColumnFreezingScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onLoaded**: Callback when grid is loaded
- **onChanged**: Callback when cell value changes

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/column_freezing_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
