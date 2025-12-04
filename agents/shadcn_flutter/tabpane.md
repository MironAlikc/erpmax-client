# TabPane

## Description
TabPane widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
final String title;
  final int count;
  final String content;
  MyTab(this.title, this.count, this.content);

  @override
  String toString() {
    return 'TabData{title: $title, count: $count, content: $content}';
  }
```

## Full Example Class
```dart
class TabPaneExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final String title;
      final int count;
      final String content;
      MyTab(this.title, this.count, this.content);

      @override
      String toString() {
        return 'TabData{title: $title, count: $count, content: $content}';
      }
  }
}
```

## Source
Example extracted from: `tab_pane_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
