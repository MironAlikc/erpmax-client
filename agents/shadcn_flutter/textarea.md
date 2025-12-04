# TextArea

## Description
TextArea widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return const TextArea(
      initialValue: 'Hello, World!',
      // Let the text area grow vertically with content up to constraints.
      expandableHeight: true,
      // Start with a taller initial height to show multiple lines.
      initialHeight: 300,
    );
```

## Full Example Class
```dart
class TextAreaExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const TextArea(
          initialValue: 'Hello, World!',
          // Let the text area grow vertically with content up to constraints.
          expandableHeight: true,
          // Start with a taller initial height to show multiple lines.
          initialHeight: 300,
        );
  }
}
```

## Source
Example extracted from: `text_area_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
