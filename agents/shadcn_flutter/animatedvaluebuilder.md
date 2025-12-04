# AnimatedValueBuilder

## Description
AnimatedValueBuilder widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// A small palette to cycle through.
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
  ];
  // Index of the current target color.
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedValueBuilder(
          // The target value to animate towards.
          value: colors[index],
          // Duration of the tween between the previous and new value.
          duration: const Duration(seconds: 1),
          // The interpolation method between two colors.
          lerp: Color.lerp,
          // The builder exposes the current animated value on each frame.
          builder: (context, value, child) {
            return Container(
              width: 100,
              height: 100,
              color: value,
            );
          },
        ),
        const Gap(32),
        PrimaryButton(
          onPressed: () {
            setState(() {
              // Move to the next color cyclically to trigger a new animation.
              index = (index + 1) % colors.length;
            });
          },
          child: const Text('Change Color'),
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class AnimatedValueBuilderExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // A small palette to cycle through.
      List<Color> colors = [
        Colors.red,
        Colors.green,
        Colors.blue,
      ];
      // Index of the current target color.
      int index = 0;
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            AnimatedValueBuilder(
              // The target value to animate towards.
              value: colors[index],
              // Duration of the tween between the previous and new value.
              duration: const Duration(seconds: 1),
              // The interpolation method between two colors.
              lerp: Color.lerp,
              // The builder exposes the current animated value on each frame.
              builder: (context, value, child) {
                return Container(
                  width: 100,
                  height: 100,
                  color: value,
                );
              },
            ),
            const Gap(32),
            PrimaryButton(
              onPressed: () {
                setState(() {
                  // Move to the next color cyclically to trigger a new animation.
                  index = (index + 1) % colors.length;
                });
              },
              child: const Text('Change Color'),
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `animated_value_builder_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
