# AppBar

## Description
AppBar widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return OutlinedContainer(
      clipBehavior: Clip.antiAlias,
      child: AppBar(
        // Optional top line above the main title area.
        header: const Text('This is Header'),
        // Primary title and an optional subtitle.
        title: const Text('This is Title'),
        subtitle: const Text('This is Subtitle'),
        leading: [
          // Leading actions typically appear on the left.
          OutlineButton(
            density: ButtonDensity.icon,
            onPressed: () {},
            child: const Icon(Icons.arrow_back),
          ),
        ],
        trailing: [
          // Trailing actions typically appear on the right.
          OutlineButton(
            density: ButtonDensity.icon,
            onPressed: () {},
            child: const Icon(Icons.search),
          ),
          OutlineButton(
            density: ButtonDensity.icon,
            onPressed: () {},
            child: const Icon(Icons.more_vert),
          ),
        ],
      ),
    );
```

## Full Example Class
```dart
class AppBarExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
          clipBehavior: Clip.antiAlias,
          child: AppBar(
            // Optional top line above the main title area.
            header: const Text('This is Header'),
            // Primary title and an optional subtitle.
            title: const Text('This is Title'),
            subtitle: const Text('This is Subtitle'),
            leading: [
              // Leading actions typically appear on the left.
              OutlineButton(
                density: ButtonDensity.icon,
                onPressed: () {},
                child: const Icon(Icons.arrow_back),
              ),
            ],
            trailing: [
              // Trailing actions typically appear on the right.
              OutlineButton(
                density: ButtonDensity.icon,
                onPressed: () {},
                child: const Icon(Icons.search),
              ),
              OutlineButton(
                density: ButtonDensity.icon,
                onPressed: () {},
                child: const Icon(Icons.more_vert),
              ),
            ],
          ),
        );
  }
}
```

## Source
Example extracted from: `app_bar_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
