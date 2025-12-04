# Collapsible

## Description
Collapsible widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Collapsible(
      children: [
        const CollapsibleTrigger(
          child: Text('@sunarya-thito starred 3 repositories'),
        ),
        OutlinedContainer(
          child: const Text('@sunarya-thito/shadcn_flutter')
              .small()
              .mono()
              .withPadding(horizontal: 16, vertical: 8),
        ).withPadding(top: 8),
        CollapsibleContent(
          child: OutlinedContainer(
            child: const Text('@flutter/flutter')
                .small()
                .mono()
                .withPadding(horizontal: 16, vertical: 8),
          ).withPadding(top: 8),
        ),
        CollapsibleContent(
          child: OutlinedContainer(
            child: const Text('@dart-lang/sdk')
                .small()
                .mono()
                .withPadding(horizontal: 16, vertical: 8),
          ).withPadding(top: 8),
        ),
      ],
    );
```

## Full Example Class
```dart
class CollapsibleExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Collapsible(
          children: [
            const CollapsibleTrigger(
              child: Text('@sunarya-thito starred 3 repositories'),
            ),
            OutlinedContainer(
              child: const Text('@sunarya-thito/shadcn_flutter')
                  .small()
                  .mono()
                  .withPadding(horizontal: 16, vertical: 8),
            ).withPadding(top: 8),
            CollapsibleContent(
              child: OutlinedContainer(
                child: const Text('@flutter/flutter')
                    .small()
                    .mono()
                    .withPadding(horizontal: 16, vertical: 8),
              ).withPadding(top: 8),
            ),
            CollapsibleContent(
              child: OutlinedContainer(
                child: const Text('@dart-lang/sdk')
                    .small()
                    .mono()
                    .withPadding(horizontal: 16, vertical: 8),
              ).withPadding(top: 8),
            ),
          ],
        );
  }
}
```

## Source
Example extracted from: `collapsible_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
