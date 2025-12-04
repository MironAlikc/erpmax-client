# NumberInput

## Description
NumberInput widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
double value = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 100,
          child: TextField(
            initialValue: value.toString(),
            onChanged: (value) {
              setState(() {
                this.value = double.tryParse(value) ?? 0;
              });
            },
            features: const [
              // Adds stepper/spinner controls to nudge the value up/down.
              InputFeature.spinner(),
            ],
            submitFormatters: [
              // Allow math expressions (e.g., 1+2*3) that resolve on submit.
              TextInputFormatters.mathExpression(),
            ],
          ),
        ),
        gap(8),
        Text('Value: $value'),
      ],
    );
  }
```

## Full Example Class
```dart
class NumberInputExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    double value = 0;
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            SizedBox(
              width: 100,
              child: TextField(
                initialValue: value.toString(),
                onChanged: (value) {
                  setState(() {
                    this.value = double.tryParse(value) ?? 0;
                  });
                },
                features: const [
                  // Adds stepper/spinner controls to nudge the value up/down.
                  InputFeature.spinner(),
                ],
                submitFormatters: [
                  // Allow math expressions (e.g., 1+2*3) that resolve on submit.
                  TextInputFormatters.mathExpression(),
                ],
              ),
            ),
            gap(8),
            Text('Value: $value'),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `number_input_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
