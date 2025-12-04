# Resizable

## Description
Resizable widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
@override
  Widget build(BuildContext context) {
    return const OutlinedContainer(
      clipBehavior: Clip.antiAlias,
      // A horizontal panel splits available width into multiple resizable panes.
      child: ResizablePanel.horizontal(
        children: [
          ResizablePane(
            // Initial width in logical pixels for this pane.
            initialSize: 80,
            child: NumberedContainer(
              index: 0,
              height: 200,
              fill: false,
            ),
          ),
          ResizablePane(
            initialSize: 80,
            child: NumberedContainer(
              index: 1,
              height: 200,
              fill: false,
            ),
          ),
          ResizablePane(
            initialSize: 120,
            child: NumberedContainer(
              index: 2,
              height: 200,
              fill: false,
            ),
          ),
          ResizablePane(
            initialSize: 80,
            child: NumberedContainer(
              index: 3,
              height: 200,
              fill: false,
            ),
          ),
          ResizablePane(
            initialSize: 80,
            child: NumberedContainer(
              index: 4,
              height: 200,
              fill: false,
            ),
          ),
        ],
      ),
    );
  }
```

## Full Example Class
```dart
class ResizableExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    @override
      Widget build(BuildContext context) {
        return const OutlinedContainer(
          clipBehavior: Clip.antiAlias,
          // A horizontal panel splits available width into multiple resizable panes.
          child: ResizablePanel.horizontal(
            children: [
              ResizablePane(
                // Initial width in logical pixels for this pane.
                initialSize: 80,
                child: NumberedContainer(
                  index: 0,
                  height: 200,
                  fill: false,
                ),
              ),
              ResizablePane(
                initialSize: 80,
                child: NumberedContainer(
                  index: 1,
                  height: 200,
                  fill: false,
                ),
              ),
              ResizablePane(
                initialSize: 120,
                child: NumberedContainer(
                  index: 2,
                  height: 200,
                  fill: false,
                ),
              ),
              ResizablePane(
                initialSize: 80,
                child: NumberedContainer(
                  index: 3,
                  height: 200,
                  fill: false,
                ),
              ),
              ResizablePane(
                initialSize: 80,
                child: NumberedContainer(
                  index: 4,
                  height: 200,
                  fill: false,
                ),
              ),
            ],
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `resizable_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
