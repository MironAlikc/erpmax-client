# App

## Description
App widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return const ShadcnApp(
      home: Scaffold(
        headers: [
          // Use Shadcn AppBar in the Scaffold header area.
          AppBar(
            title: Text('Shadcn App Example'),
          ),
          // A divider beneath the AppBar to separate header and body.
          Divider(),
        ],
        child: Center(
          child: Text('Hello, Shadcn Flutter!'),
        ),
      ),
    );
```

## Full Example Class
```dart
class AppExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ShadcnApp(
          home: Scaffold(
            headers: [
              // Use Shadcn AppBar in the Scaffold header area.
              AppBar(
                title: Text('Shadcn App Example'),
              ),
              // A divider beneath the AppBar to separate header and body.
              Divider(),
            ],
            child: Center(
              child: Text('Hello, Shadcn Flutter!'),
            ),
          ),
        );
  }
}
```

## Source
Example extracted from: `app_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
