# Window

## Description
Window widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
final GlobalKey<WindowNavigatorHandle> navigatorKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        OutlinedContainer(
          height: 600, // for example purpose
          child: WindowNavigator(
            key: navigatorKey,
            // Pre-populate with two windows, each with its own bounds and title.
            initialWindows: [
              Window(
                bounds: const Rect.fromLTWH(0, 0, 200, 200),
                title: const Text('Window 1'),
                content: const RebuildCounter(),
              ),
              Window(
                bounds: const Rect.fromLTWH(200, 0, 200, 200),
                title: const Text('Window 2'),
                content: const RebuildCounter(),
              ),
            ],
            child: const Center(
              child: Text('Desktop'),
            ),
          ),
        ),
        PrimaryButton(
          child: const Text('Add Window'),
          onPressed: () {
            // Push a new window via the navigator; title uses the current count.
            navigatorKey.currentState?.pushWindow(
              Window(
                bounds: const Rect.fromLTWH(0, 0, 200, 200),
                title: Text(
                    'Window ${navigatorKey.currentState!.windows.length + 1}'),
                content: const RebuildCounter(),
              ),
            );
          },
        )
      ],
    );
  }
```

## Full Example Class
```dart
class WindowExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<WindowNavigatorHandle> navigatorKey = GlobalKey();
      @override
      Widget build(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedContainer(
              height: 600, // for example purpose
              child: WindowNavigator(
                key: navigatorKey,
                // Pre-populate with two windows, each with its own bounds and title.
                initialWindows: [
                  Window(
                    bounds: const Rect.fromLTWH(0, 0, 200, 200),
                    title: const Text('Window 1'),
                    content: const RebuildCounter(),
                  ),
                  Window(
                    bounds: const Rect.fromLTWH(200, 0, 200, 200),
                    title: const Text('Window 2'),
                    content: const RebuildCounter(),
                  ),
                ],
                child: const Center(
                  child: Text('Desktop'),
                ),
              ),
            ),
            PrimaryButton(
              child: const Text('Add Window'),
              onPressed: () {
                // Push a new window via the navigator; title uses the current count.
                navigatorKey.currentState?.pushWindow(
                  Window(
                    bounds: const Rect.fromLTWH(0, 0, 200, 200),
                    title: Text(
                        'Window ${navigatorKey.currentState!.windows.length + 1}'),
                    content: const RebuildCounter(),
                  ),
                );
              },
            )
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `window_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
