# Switch

## Description
Switch widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Simple on/off state bound to the Switch.
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value,
      onChanged: (value) {
        setState(() {
          // Flip the switch.
          this.value = value;
        });
      },
    );
  }
```

## Full Example Class
```dart
class SwitchExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Simple on/off state bound to the Switch.
      bool value = false;

      @override
      Widget build(BuildContext context) {
        return Switch(
          value: value,
          onChanged: (value) {
            setState(() {
              // Flip the switch.
              this.value = value;
            });
          },
        );
      }
  }
}
```

## Source
Example extracted from: `switch_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
