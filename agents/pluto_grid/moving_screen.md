# Moving

## Description
Change the current cell position with the arrow keys, enter key, and tab key. When creating a Grid, you can control 

## Key Features
- Row/Column moving
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

class MovingScreen extends StatefulWidget {
  static const routeName = 'feature/moving';

  const MovingScreen({Key? key}) : super(key: key);

  @override
  _MovingScreenState createState() => _MovingScreenState();
}

class _MovingScreenState extends State<MovingScreen> {
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
      title: 'Moving',
      topTitle: 'Moving',
      topContents: const [
        Text(
            'Change the current cell position with the arrow keys, enter key, and tab key.'),
        Text(
            'When creating a Grid, you can control "Enter key action" and "After pop-up action" with enableMoveDownAfterSelecting and enterKeyAction properties in the configuration.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/moving_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        configuration: const PlutoGridConfiguration(
          enableMoveDownAfterSelecting: true,
          enterKeyAction: PlutoGridEnterKeyAction.editingAndMoveDown,
        ),
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
        configuration: const PlutoGridConfiguration(
          enableMoveDownAfterSelecting: true,
          enterKeyAction: PlutoGridEnterKeyAction.editingAndMoveDown,
        ),
      )
```

## Key Code Sections

### Build Method
```dart
@override
Widget build(BuildContext context) {
  return PlutoExampleScreen(
      title: 'Moving',
      topTitle: 'Moving',
      topContents: const [
        Text(
            'Change the current cell position with the arrow keys, enter key, and tab key.'),
        Text(
            'When creating a Grid, you can control "Enter key action" and "After pop-up action" with enableMoveDownAfterSelecting and enterKeyAction properties in the configuration.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/moving_screen.dart',
        ),
      ],
      body: PlutoGrid(
        columns: columns,
        rows: rows,
        onChanged: (PlutoGridOnChangedEvent event) {
          print(event);
        },
        configuration: const PlutoGridConfiguration(
          enableMoveDownAfterSelecting: true,
          enterKeyAction: PlutoGridEnterKeyAction.editingAndMoveDown,
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
        body: MovingScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onChanged**: Callback when cell value changes
- **configuration**: Grid configuration settings

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/moving_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
