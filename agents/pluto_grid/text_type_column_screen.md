# Text Type Column

## Description
A column to enter a character value.

## Key Features
- Cell editing

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../widget/pluto_example_button.dart';
import '../../widget/pluto_example_screen.dart';

class TextTypeColumnScreen extends StatefulWidget {
  static const routeName = 'feature/text-type-column';

  const TextTypeColumnScreen({Key? key}) : super(key: key);

  @override
  _TextTypeColumnScreenState createState() => _TextTypeColumnScreenState();
}

class _TextTypeColumnScreenState extends State<TextTypeColumnScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    columns.addAll([
      PlutoColumn(
        title: 'Editable',
        field: 'editable',
        type: PlutoColumnType.text(),
      ),
      PlutoColumn(
        title: 'Readonly',
        field: 'readonly',
        readOnly: true,
        type: PlutoColumnType.text(),
      ),
    ]);

    rows.addAll([
      PlutoRow(
        cells: {
          'editable': PlutoCell(value: 'a1'),
          'readonly': PlutoCell(value: 'b1'),
        },
      ),
      PlutoRow(
        cells: {
          'editable': PlutoCell(value: 'a1'),
          'readonly': PlutoCell(value: 'b1'),
        },
      ),
      PlutoRow(
        cells: {
          'editable': PlutoCell(value: 'a1'),
          'readonly': PlutoCell(value: 'b1'),
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Text type column',
      topTitle: 'Text type column',
      topContents: const [
        Text('A column to enter a character value.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/text_type_column_screen.dart',
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
      title: 'Text type column',
      topTitle: 'Text type column',
      topContents: const [
        Text('A column to enter a character value.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/text_type_column_screen.dart',
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
        body: TextTypeColumnScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onChanged**: Callback when cell value changes

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/text_type_column_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
