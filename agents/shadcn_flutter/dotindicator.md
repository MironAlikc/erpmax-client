# DotIndicator

## Description
DotIndicator widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int _index = 0;
  @override
  Widget build(BuildContext context) {
    // A simple pager-like dot indicator with 5 steps.
    // Tap/click updates the current index via onChanged.
    return DotIndicator(
        index: _index,
        length: 5,
        onChanged: (index) {
          setState(() {
            _index = index;
          });
        });
  }
```

## Full Example Class
```dart
class DotIndicatorExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int _index = 0;
      @override
      Widget build(BuildContext context) {
        // A simple pager-like dot indicator with 5 steps.
        // Tap/click updates the current index via onChanged.
        return DotIndicator(
            index: _index,
            length: 5,
            onChanged: (index) {
              setState(() {
                _index = index;
              });
            });
      }
  }
}
```

## Source
Example extracted from: `dot_indicator_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
