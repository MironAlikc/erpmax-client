# Number Type Column

## Description
A column to enter a number value.

## Key Features
- Cell editing
- Number column type

## Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

import '../../widget/pluto_example_button.dart';
import '../../widget/pluto_example_screen.dart';

class NumberTypeColumnScreen extends StatefulWidget {
  static const routeName = 'feature/number-type-column';

  const NumberTypeColumnScreen({Key? key}) : super(key: key);

  @override
  _NumberTypeColumnScreenState createState() => _NumberTypeColumnScreenState();
}

class _NumberTypeColumnScreenState extends State<NumberTypeColumnScreen> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

    columns.addAll([
      PlutoColumn(
        title: 'Negative true',
        field: 'negative_true',
        type: PlutoColumnType.number(),
      ),
      PlutoColumn(
        title: 'Negative false',
        field: 'negative_false',
        type: PlutoColumnType.number(
          negative: false,
        ),
      ),
      PlutoColumn(
        title: '2 decimal places',
        field: 'two_decimal',
        type: PlutoColumnType.number(
          format: '#,###.##',
        ),
      ),
      PlutoColumn(
        title: '3 decimal places',
        field: 'three_decimal',
        type: PlutoColumnType.number(
          format: '#,###.###',
        ),
      ),
      PlutoColumn(
        title: '3 decimal places with denmark locale',
        field: 'three_decimal_with_denmark_locale',
        type: PlutoColumnType.number(
          format: '#,###.###',
          locale: 'da_DK',
        ),
      ),
    ]);

    rows.addAll([
      PlutoRow(
        cells: {
          'negative_true': PlutoCell(value: -12345),
          'negative_false': PlutoCell(value: 12345),
          'two_decimal': PlutoCell(value: 12345.12),
          'three_decimal': PlutoCell(value: 12345.123),
          'three_decimal_with_denmark_locale': PlutoCell(value: 12345678.123),
        },
      ),
      PlutoRow(
        cells: {
          'negative_true': PlutoCell(value: -12345),
          'negative_false': PlutoCell(value: 12345),
          'two_decimal': PlutoCell(value: 12345.12),
          'three_decimal': PlutoCell(value: 12345.123),
          'three_decimal_with_denmark_locale': PlutoCell(value: 12345678.123),
        },
      ),
      PlutoRow(
        cells: {
          'negative_true': PlutoCell(value: -12345),
          'negative_false': PlutoCell(value: 12345),
          'two_decimal': PlutoCell(value: 12345.12),
          'three_decimal': PlutoCell(value: 12345.123),
          'three_decimal_with_denmark_locale': PlutoCell(value: 12345678.123),
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return PlutoExampleScreen(
      title: 'Number type column',
      topTitle: 'Number type column',
      topContents: const [
        Text('A column to enter a number value.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/number_type_column_screen.dart',
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
      title: 'Number type column',
      topTitle: 'Number type column',
      topContents: const [
        Text('A column to enter a number value.'),
      ],
      topButtons: [
        PlutoExampleButton(
          url:
              'https://github.com/bosskmk/pluto_grid/blob/master/demo/lib/screen/feature/number_type_column_screen.dart',
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
        body: NumberTypeColumnScreen(),
      ),
    );
  }
}
```

## Important Parameters

- **onChanged**: Callback when cell value changes

## Source
Original file: `/tmp/pluto_grid_docs/demo/lib/screen/feature/number_type_column_screen.dart`

## Documentation
For more details, visit: https://github.com/bosskmk/pluto_grid

## Notes
- This example is extracted from the official PlutoGrid demo
- Modify the code according to your requirements
- Check PlutoGrid documentation for all available options and callbacks
