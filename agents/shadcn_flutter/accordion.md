# Accordion

## Description
Accordion widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// The Accordion itself simply receives a list of items.
    // Note: Using `const` here keeps the widget tree immutable since
    // the items are static in this example.
    return const Accordion(
      items: [
        // Item 1: Demonstrates a basic trigger and a longer content body.
        AccordionItem(
          trigger: AccordionTrigger(child: Text('Lorem ipsum dolor sit amet')),
          content: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        ),
        // Item 2: Another entry with its own header and body.
        AccordionItem(
          trigger: AccordionTrigger(
              child: Text(
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')),
          content: Text(
              'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        ),
        // Item 3: A third example to show multiple items expand independently.
        AccordionItem(
          trigger: AccordionTrigger(
              child: Text(
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')),
          content: Text(
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
              'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
              'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
        ),
      ],
    );
```

## Full Example Class
```dart
class AccordionExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The Accordion itself simply receives a list of items.
        // Note: Using `const` here keeps the widget tree immutable since
        // the items are static in this example.
        return const Accordion(
          items: [
            // Item 1: Demonstrates a basic trigger and a longer content body.
            AccordionItem(
              trigger: AccordionTrigger(child: Text('Lorem ipsum dolor sit amet')),
              content: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
            // Item 2: Another entry with its own header and body.
            AccordionItem(
              trigger: AccordionTrigger(
                  child: Text(
                      'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua')),
              content: Text(
                  'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
            // Item 3: A third example to show multiple items expand independently.
            AccordionItem(
              trigger: AccordionTrigger(
                  child: Text(
                      'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat')),
              content: Text(
                  'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. '
                  'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                  'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
          ],
        );
  }
}
```

## Source
Example extracted from: `accordion_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
