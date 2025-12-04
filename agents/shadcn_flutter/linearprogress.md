# LinearProgress

## Description
LinearProgress widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Indeterminate linear progress indicator with a fixed width.
    // When no `value` is provided, it displays an animated looping bar.
    return const SizedBox(
      width: 200,
      child: LinearProgressIndicator(),
    );
```

## Full Example Class
```dart
class LinearProgressExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Indeterminate linear progress indicator with a fixed width.
        // When no `value` is provided, it displays an animated looping bar.
        return const SizedBox(
          width: 200,
          child: LinearProgressIndicator(),
        );
  }
}
```

## Source
Example extracted from: `linear_progress_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
