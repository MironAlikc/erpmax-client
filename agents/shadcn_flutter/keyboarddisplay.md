# KeyboardDisplay

## Description
KeyboardDisplay widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// KeyboardDisplay renders keycaps/shortcuts inline.
    // Below we show two variants: explicit key list and a SingleActivator.
    return const Column(
      children: [
        KeyboardDisplay(keys: [
          LogicalKeyboardKey.control,
          LogicalKeyboardKey.alt,
          LogicalKeyboardKey.delete,
        ]),
        Gap(24),
        KeyboardDisplay.fromActivator(
          activator: SingleActivator(
            LogicalKeyboardKey.keyA,
            control: true,
            shift: true,
          ),
        )
      ],
    ).textSmall();
```

## Full Example Class
```dart
class KeyboardDisplayExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // KeyboardDisplay renders keycaps/shortcuts inline.
        // Below we show two variants: explicit key list and a SingleActivator.
        return const Column(
          children: [
            KeyboardDisplay(keys: [
              LogicalKeyboardKey.control,
              LogicalKeyboardKey.alt,
              LogicalKeyboardKey.delete,
            ]),
            Gap(24),
            KeyboardDisplay.fromActivator(
              activator: SingleActivator(
                LogicalKeyboardKey.keyA,
                control: true,
                shift: true,
              ),
            )
          ],
        ).textSmall();
  }
}
```

## Source
Example extracted from: `keyboard_display_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
