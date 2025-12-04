# OverflowMarquee

## Description
OverflowMarquee widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return const SizedBox(
      width: 200,
      child: OverflowMarquee(
        // When the text exceeds the available width, it smoothly scrolls horizontally.
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
      ),
    );
```

## Full Example Class
```dart
class OverflowMarqueeExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
          width: 200,
          child: OverflowMarquee(
            // When the text exceeds the available width, it smoothly scrolls horizontally.
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            ),
          ),
        );
  }
}
```

## Source
Example extracted from: `overflow_marquee_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
