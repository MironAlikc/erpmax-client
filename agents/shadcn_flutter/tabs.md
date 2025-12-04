# Tabs

## Description
Tabs widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Tabs(
          // Bind the active tab index; Tabs is the header-only control.
          index: index,
          children: const [
            TabItem(child: Text('Tab 1')),
            TabItem(child: Text('Tab 2')),
            TabItem(child: Text('Tab 3')),
          ],
          onChanged: (int value) {
            // Keep header and body in sync by updating state.
            setState(() {
              index = value;
            });
          },
        ),
        const Gap(8),
        // The IndexedStack acts as the tab body; it switches content by index
        // without unmounting inactive children.
        IndexedStack(
          index: index,
          children: const [
            NumberedContainer(
              index: 1,
            ),
            NumberedContainer(
              index: 2,
            ),
            NumberedContainer(
              index: 3,
            ),
          ],
        ).sized(height: 300),
      ],
    );
  }
```

## Full Example Class
```dart
class TabsExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int index = 0;
      @override
      Widget build(BuildContext context) {
        return Column(
          children: [
            Tabs(
              // Bind the active tab index; Tabs is the header-only control.
              index: index,
              children: const [
                TabItem(child: Text('Tab 1')),
                TabItem(child: Text('Tab 2')),
                TabItem(child: Text('Tab 3')),
              ],
              onChanged: (int value) {
                // Keep header and body in sync by updating state.
                setState(() {
                  index = value;
                });
              },
            ),
            const Gap(8),
            // The IndexedStack acts as the tab body; it switches content by index
            // without unmounting inactive children.
            IndexedStack(
              index: index,
              children: const [
                NumberedContainer(
                  index: 1,
                ),
                NumberedContainer(
                  index: 2,
                ),
                NumberedContainer(
                  index: 3,
                ),
              ],
            ).sized(height: 300),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `tabs_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
