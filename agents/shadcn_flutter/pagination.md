# Pagination

## Description
Pagination widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int page = 1;
  @override
  Widget build(BuildContext context) {
    return Pagination(
      page: page,
      totalPages: 20,
      // Limit how many page buttons are visible at once (rest via ellipsis).
      onPageChanged: (value) {
        setState(() {
          page = value;
        });
      },
      maxPages: 3,
    );
  }
```

## Full Example Class
```dart
class PaginationExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int page = 1;
      @override
      Widget build(BuildContext context) {
        return Pagination(
          page: page,
          totalPages: 20,
          // Limit how many page buttons are visible at once (rest via ellipsis).
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          maxPages: 3,
        );
      }
  }
}
```

## Source
Example extracted from: `pagination_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
