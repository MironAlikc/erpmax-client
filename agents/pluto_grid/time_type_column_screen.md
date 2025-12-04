# Time Type Column

## Description
A column to enter a time value. Move the hour and minute with the left and right arrow keys.

## Key Features
- Cell editing
- Time column type

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../widget/pluto_example_button.dart';
import '../../widget/pluto_example_screen.dart';

class TimeTypeColumnScreen extends StatefulWidget {
  static const routeName = 'feature/time-type-column';

  const TimeTypeColumnScreen({Key? key}) : super(key: key);

  @override
  _TimeTypeColumnScreenState createState() => _TimeTypeColumnScreenState();
}

class _TimeTypeColumnScreenState extends State<TimeTypeColumnScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    columns.addAll([
      PlutoColumn(
        title: 'Time',
        field: 'time',
        type: PlutoColumnType.time(),
      ),
    ]);

    rows.addAll([
      PlutoRow(
        cells: {
          'time': PlutoCell(value: '00:00'),
        },
      ),
      PlutoRow(
        cells: {
          'time': PlutoCell(value: '23:59'),
        },
      ),
      PlutoRow(
        cells: {
          'time': PlutoCell(value: '12:30'),
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Time type column',
      topTitle: 'Time type column',
      topContents: const [
        Text('A column to enter a time value.'),
        Text('Move the hour and minute with the left and right arrow keys.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/time_type_column_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
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
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Time type column',
      topTitle: 'Time type column',
      topContents: const [
        Text('A column to enter a time value.'),
        Text('Move the hour and minute with the left and right arrow keys.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/time_type_column_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
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
        body: TimeTypeColumnScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onChanged**: Callback when cell value changes

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/time_type_column_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
