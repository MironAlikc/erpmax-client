# Slider

## Description
Slider widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// A single-value slider in the 0–1 range (default).
  SliderValue value = const SliderValue.single(0.5);
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      onChanged: (value) {
        setState(() {
          // Update local state when the thumb is dragged.
          this.value = value;
        });
      },
    );
  }
```

## Full Example Class
```dart
class SliderExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // A single-value slider in the 0–1 range (default).
      SliderValue value = const SliderValue.single(0.5);
      @override
      Widget build(BuildContext context) {
        return Slider(
          value: value,
          onChanged: (value) {
            setState(() {
              // Update local state when the thumb is dragged.
              this.value = value;
            });
          },
        );
      }
  }
}
```

## Source
Example extracted from: `slider_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
