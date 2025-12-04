# RadioGroup

## Description
RadioGroup widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Start with no selection (null). The UI reflects this until the user picks an option.
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // A generic RadioGroup for int values. It controls selection for its RadioItem children.
        RadioGroup<int>(
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              // Save the selected value emitted by the tapped RadioItem.
              selectedValue = value;
            });
          },
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Each RadioItem represents a single choice with an associated integer value.
              RadioItem(
                value: 1,
                trailing: Text('Option 1'),
              ),
              RadioItem(
                value: 2,
                trailing: Text('Option 2'),
              ),
              RadioItem(
                value: 3,
                trailing: Text('Option 3'),
              ),
            ],
          ),
        ),
        const Gap(16),
        // Echo the selection below for demonstration purposes.
        Text('Selected: $selectedValue'),
      ],
    );
  }
```

## Full Example Class
```dart
class RadioGroupExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Start with no selection (null). The UI reflects this until the user picks an option.
      int? selectedValue;

      @override
      Widget build(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // A generic RadioGroup for int values. It controls selection for its RadioItem children.
            RadioGroup<int>(
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  // Save the selected value emitted by the tapped RadioItem.
                  selectedValue = value;
                });
              },
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Each RadioItem represents a single choice with an associated integer value.
                  RadioItem(
                    value: 1,
                    trailing: Text('Option 1'),
                  ),
                  RadioItem(
                    value: 2,
                    trailing: Text('Option 2'),
                  ),
                  RadioItem(
                    value: 3,
                    trailing: Text('Option 3'),
                  ),
                ],
              ),
            ),
            const Gap(16),
            // Echo the selection below for demonstration purposes.
            Text('Selected: $selectedValue'),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `radio_group_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
