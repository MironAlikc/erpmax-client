# TimePicker

## Description
TimePicker widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
TimeOfDay _value = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimePicker(
          value: _value,
          // Popover mode shows a compact inline picker anchored to the field.
          mode: PromptMode.popover,
          onChanged: (value) {
            setState(() {
              // If user cancels, keep time by falling back to now.
              _value = value ?? TimeOfDay.now();
            });
          },
        ),
        const Gap(16),
        TimePicker(
          value: _value,
          // Dialog mode opens a modal sheet/dialog for selection.
          mode: PromptMode.dialog,
          dialogTitle: const Text('Select Time'),
          onChanged: (value) {
            setState(() {
              _value = value ?? TimeOfDay.now();
            });
          },
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class TimePickerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    TimeOfDay _value = TimeOfDay.now();
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            TimePicker(
              value: _value,
              // Popover mode shows a compact inline picker anchored to the field.
              mode: PromptMode.popover,
              onChanged: (value) {
                setState(() {
                  // If user cancels, keep time by falling back to now.
                  _value = value ?? TimeOfDay.now();
                });
              },
            ),
            const Gap(16),
            TimePicker(
              value: _value,
              // Dialog mode opens a modal sheet/dialog for selection.
              mode: PromptMode.dialog,
              dialogTitle: const Text('Select Time'),
              onChanged: (value) {
                setState(() {
                  _value = value ?? TimeOfDay.now();
                });
              },
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `time_picker_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
