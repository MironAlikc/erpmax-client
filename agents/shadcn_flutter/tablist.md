# TabList

## Description
TabList widget from shadcn_flutter library.

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
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabList(
          // TabList is a lower-level tab header; it doesn't manage content.
          index: index,
          onChanged: (value) {
            setState(() {
              index = value;
            });
          },
          children: const [
            TabItem(
              child: Text('Tab 1'),
            ),
            TabItem(
              child: Text('Tab 2'),
            ),
            TabItem(
              child: Text('Tab 3'),
            ),
          ],
        ),
        const Gap(16),
        // Like Tabs example, use an IndexedStack to switch the content area.
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
class TabListExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int index = 0;
      @override
      Widget build(BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TabList(
              // TabList is a lower-level tab header; it doesn't manage content.
              index: index,
              onChanged: (value) {
                setState(() {
                  index = value;
                });
              },
              children: const [
                TabItem(
                  child: Text('Tab 1'),
                ),
                TabItem(
                  child: Text('Tab 2'),
                ),
                TabItem(
                  child: Text('Tab 3'),
                ),
              ],
            ),
            const Gap(16),
            // Like Tabs example, use an IndexedStack to switch the content area.
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
Example extracted from: `tab_list_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
