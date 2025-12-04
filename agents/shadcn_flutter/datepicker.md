# DatePicker

## Description
DatePicker widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
DateTime? _value;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePicker(
          value: _value,
          mode: PromptMode.popover,
          // Disable selecting dates after "today".
          stateBuilder: (date) {
            if (date.isAfter(DateTime.now())) {
              return DateState.disabled;
            }
            return DateState.enabled;
          },
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
        const Gap(16),
        DatePicker(
          value: _value,
          mode: PromptMode.dialog,
          // Title shown at the top of the dialog variant.
          dialogTitle: const Text('Select Date'),
          stateBuilder: (date) {
            if (date.isAfter(DateTime.now())) {
              return DateState.disabled;
            }
            return DateState.enabled;
          },
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class DatePickerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    DateTime? _value;
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            DatePicker(
              value: _value,
              mode: PromptMode.popover,
              // Disable selecting dates after "today".
              stateBuilder: (date) {
                if (date.isAfter(DateTime.now())) {
                  return DateState.disabled;
                }
                return DateState.enabled;
              },
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
            const Gap(16),
            DatePicker(
              value: _value,
              mode: PromptMode.dialog,
              // Title shown at the top of the dialog variant.
              dialogTitle: const Text('Select Date'),
              stateBuilder: (date) {
                if (date.isAfter(DateTime.now())) {
                  return DateState.disabled;
                }
                return DateState.enabled;
              },
              onChanged: (value) {
                setState(() {
                  _value = value;
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
Example extracted from: `date_picker_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
