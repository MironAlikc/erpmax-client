# Alert

## Description
Alert widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// `Alert` supports optional leading/trailing widgets for icons or actions.
    return const Alert(
      title: Text('Alert title'),
      content: Text('This is alert content.'),
      leading: Icon(Icons.info_outline),
    );
```

## Full Example Class
```dart
class AlertExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // `Alert` supports optional leading/trailing widgets for icons or actions.
        return const Alert(
          title: Text('Alert title'),
          content: Text('This is alert content.'),
          leading: Icon(Icons.info_outline),
        );
  }
}
```

## Source
Example extracted from: `alert_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
