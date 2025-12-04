# Choices

## Description
Choices widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
@override
  Widget build(BuildContext context) {
    // MultipleChoice provides a context for building a set of mutually-exclusive
    // or multi-selectable options, depending on the configuration. This stub
    // example keeps an empty Column to demonstrate the container itself.
    // In practical examples, you would place choice items (e.g., ChoiceTile,
    // Checkboxes/Radio or custom widgets) inside the child.
    return const MultipleChoice(
      child: Column(
        children: [],
      ),
    );
  }
```

## Full Example Class
```dart
class ChoicesExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    @override
      Widget build(BuildContext context) {
        // MultipleChoice provides a context for building a set of mutually-exclusive
        // or multi-selectable options, depending on the configuration. This stub
        // example keeps an empty Column to demonstrate the container itself.
        // In practical examples, you would place choice items (e.g., ChoiceTile,
        // Checkboxes/Radio or custom widgets) inside the child.
        return const MultipleChoice(
          child: Column(
            children: [],
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `choices_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
