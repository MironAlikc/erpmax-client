# Toggle

## Description
Toggle widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
bool value = false;

  @override
  Widget build(BuildContext context) {
    return Toggle(
      // Simple boolean toggle; style/semantics similar to a ToggleButton.
      value: value,
      onChanged: (v) {
        setState(() {
          value = v;
        });
      },
      child: const Text('Toggle'),
    );
  }
```

## Full Example Class
```dart
class ToggleExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    bool value = false;

      @override
      Widget build(BuildContext context) {
        return Toggle(
          // Simple boolean toggle; style/semantics similar to a ToggleButton.
          value: value,
          onChanged: (v) {
            setState(() {
              value = v;
            });
          },
          child: const Text('Toggle'),
        );
      }
  }
}
```

## Source
Example extracted from: `toggle_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
