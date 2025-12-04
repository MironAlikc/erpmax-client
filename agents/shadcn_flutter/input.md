# Input

## Description
Input widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Basic text input using shadcn_flutter's TextField.
    // placeholder is rendered inside the input when it's empty.
    return const TextField(
      placeholder: Text('Enter your name'),
    );
```

## Full Example Class
```dart
class InputExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Basic text input using shadcn_flutter's TextField.
        // placeholder is rendered inside the input when it's empty.
        return const TextField(
          placeholder: Text('Enter your name'),
        );
  }
}
```

## Source
Example extracted from: `input_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
