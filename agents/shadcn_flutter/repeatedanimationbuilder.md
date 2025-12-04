# RepeatedAnimationBuilder

## Description
RepeatedAnimationBuilder widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return RepeatedAnimationBuilder(
      // Animate a value from 'start' to 'end' and repeat.
      // The builder below receives the animated Offset each tick.
      start: const Offset(-100, 0),
      end: const Offset(100, 0),
      // One second per run from start to end.
      duration: const Duration(seconds: 1),
      builder: (context, value, child) {
        return Transform.translate(
          // Move a square horizontally based on the current animated value.
          offset: value,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        );
      },
    );
```

## Full Example Class
```dart
class RepeatedAnimationBuilderExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepeatedAnimationBuilder(
          // Animate a value from 'start' to 'end' and repeat.
          // The builder below receives the animated Offset each tick.
          start: const Offset(-100, 0),
          end: const Offset(100, 0),
          // One second per run from start to end.
          duration: const Duration(seconds: 1),
          builder: (context, value, child) {
            return Transform.translate(
              // Move a square horizontally based on the current animated value.
              offset: value,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            );
          },
        );
  }
}
```

## Source
Example extracted from: `repeated_animation_builder_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
