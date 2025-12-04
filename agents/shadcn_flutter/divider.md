# Divider

## Description
Divider widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return const SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Item 1'),
          Divider(),
          Text('Item 2'),
          Divider(),
          Text('Item 3'),
        ],
      ),
    );
```

## Full Example Class
```dart
class DividerExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Item 1'),
              Divider(),
              Text('Item 2'),
              Divider(),
              Text('Item 3'),
            ],
          ),
        );
  }
}
```

## Source
Example extracted from: `divider_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
