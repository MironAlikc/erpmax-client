# Checkbox

## Description
Checkbox widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Start unchecked; toggle when the user taps the control.
  CheckboxState _state = CheckboxState.unchecked;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      state: _state,
      onChanged: (value) {
        setState(() {
          _state = value;
        });
      },
      // Optional label placed on the trailing side.
      trailing: const Text('Remember me'),
    );
  }
```

## Full Example Class
```dart
class CheckboxExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Start unchecked; toggle when the user taps the control.
      CheckboxState _state = CheckboxState.unchecked;
      @override
      Widget build(BuildContext context) {
        return Checkbox(
          state: _state,
          onChanged: (value) {
            setState(() {
              _state = value;
            });
          },
          // Optional label placed on the trailing side.
          trailing: const Text('Remember me'),
        );
      }
  }
}
```

## Source
Example extracted from: `checkbox_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
