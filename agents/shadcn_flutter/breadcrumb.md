# Breadcrumb

## Description
Breadcrumb widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Breadcrumb(
      // Use a built-in arrow separator for a conventional look.
      separator: Breadcrumb.arrowSeparator,
      children: [
        TextButton(
          onPressed: () {},
          density: ButtonDensity.compact,
          child: const Text('Home'),
        ),
        const MoreDots(),
        TextButton(
          onPressed: () {},
          density: ButtonDensity.compact,
          child: const Text('Components'),
        ),
        // Final segment as a non-interactive label.
        const Text('Breadcrumb'),
      ],
    );
```

## Full Example Class
```dart
class BreadcrumbExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Breadcrumb(
          // Use a built-in arrow separator for a conventional look.
          separator: Breadcrumb.arrowSeparator,
          children: [
            TextButton(
              onPressed: () {},
              density: ButtonDensity.compact,
              child: const Text('Home'),
            ),
            const MoreDots(),
            TextButton(
              onPressed: () {},
              density: ButtonDensity.compact,
              child: const Text('Components'),
            ),
            // Final segment as a non-interactive label.
            const Text('Breadcrumb'),
          ],
        );
  }
}
```

## Source
Example extracted from: `breadcrumb_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
