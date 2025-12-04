# Wrapper

## Description
Wrapper widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// If you are using MaterialApp or CupertinoApp
    // but still want to use Shadcn UI theming and components,
    // you can wrap your app with ShadcnUI and Theme.
    return const shadcn.Theme(
      // Choose a Shadcn theme (dark here), then place ShadcnUI below it so
      // descendants pick up tokens (colors, radius, typography, etc.).
      data: shadcn.ThemeData.dark(),
      child: shadcn.ShadcnUI(
        child: shadcn.Scaffold(
          headers: [
            shadcn.AppBar(
              title: Text('Shadcn UI Wrapper Example'),
            ),
            shadcn.Divider(),
          ],
          child: Center(
            child: shadcn.Text('Hello, Shadcn Flutter!'),
          ),
        ),
      ),
    );
```

## Full Example Class
```dart
class WrapperExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // If you are using MaterialApp or CupertinoApp
        // but still want to use Shadcn UI theming and components,
        // you can wrap your app with ShadcnUI and Theme.
        return const shadcn.Theme(
          // Choose a Shadcn theme (dark here), then place ShadcnUI below it so
          // descendants pick up tokens (colors, radius, typography, etc.).
          data: shadcn.ThemeData.dark(),
          child: shadcn.ShadcnUI(
            child: shadcn.Scaffold(
              headers: [
                shadcn.AppBar(
                  title: Text('Shadcn UI Wrapper Example'),
                ),
                shadcn.Divider(),
              ],
              child: Center(
                child: shadcn.Text('Hello, Shadcn Flutter!'),
              ),
            ),
          ),
        );
  }
}
```

## Source
Example extracted from: `wrapper_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
