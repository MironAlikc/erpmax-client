# NumberTicker

## Description
NumberTicker widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Current target number. Changing this causes NumberTicker to animate
  // from the old value to the new value.
  int _number = 0;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberTicker(
          // Starting point for the first animation frame.
          initialNumber: 0,
          // The live value to animate toward. When this changes, the ticker
          // interpolates between the previous and the new value.
          number: _number,
          style: const TextStyle(fontSize: 32),
          formatter: (number) {
            // Optional display formatter: 1200 -> 1.2K, etc.
            return NumberFormat.compact().format(number);
          },
        ),
        const Gap(24),
        TextField(
          // Show the current number as the initial text.
          initialValue: _number.toString(),
          controller: _controller,
          onEditingComplete: () {
            // Commit input on edit complete and update the ticker target.
            int? number = int.tryParse(_controller.text);
            if (number != null) {
              setState(() {
                _number = number;
              });
            }
          },
        )
      ],
    );
  }
```

## Full Example Class
```dart
class NumberTickerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Current target number. Changing this causes NumberTicker to animate
      // from the old value to the new value.
      int _number = 0;
      final TextEditingController _controller = TextEditingController();

      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            NumberTicker(
              // Starting point for the first animation frame.
              initialNumber: 0,
              // The live value to animate toward. When this changes, the ticker
              // interpolates between the previous and the new value.
              number: _number,
              style: const TextStyle(fontSize: 32),
              formatter: (number) {
                // Optional display formatter: 1200 -> 1.2K, etc.
                return NumberFormat.compact().format(number);
              },
            ),
            const Gap(24),
            TextField(
              // Show the current number as the initial text.
              initialValue: _number.toString(),
              controller: _controller,
              onEditingComplete: () {
                // Commit input on edit complete and update the ticker target.
                int? number = int.tryParse(_controller.text);
                if (number != null) {
                  setState(() {
                    _number = number;
                  });
                }
              },
            )
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `number_ticker_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
