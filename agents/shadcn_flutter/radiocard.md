# RadioCard

## Description
RadioCard widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Currently selected option. The RadioGroup below binds to this value.
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      // Provide the selected value so RadioCard children can render checked state.
      value: value,
      onChanged: (value) {
        setState(() {
          // Update selection when any RadioCard is tapped.
          this.value = value;
        });
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Each RadioCard acts as a large tappable radio option.
          // Assign a unique 'value' for identification within the RadioGroup.
          RadioCard(
            value: 1,
            child: Basic(
              // 'Basic' is a helper layout that shows a title and a content line.
              title: Text('8-core CPU'),
              content: Text('32 GB RAM'),
            ),
          ),
          RadioCard(
            value: 2,
            child: Basic(
              title: Text('6-core CPU'),
              content: Text('24 GB RAM'),
            ),
          ),
          RadioCard(
            value: 3,
            child: Basic(
              title: Text('4-core CPU'),
              content: Text('16 GB RAM'),
            ),
          ),
        ],
      )
          // Add horizontal spacing between the cards via the .gap extension.
          .gap(12),
    );
  }
```

## Full Example Class
```dart
class RadioCardExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Currently selected option. The RadioGroup below binds to this value.
      int value = 1;
      @override
      Widget build(BuildContext context) {
        return RadioGroup(
          // Provide the selected value so RadioCard children can render checked state.
          value: value,
          onChanged: (value) {
            setState(() {
              // Update selection when any RadioCard is tapped.
              this.value = value;
            });
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Each RadioCard acts as a large tappable radio option.
              // Assign a unique 'value' for identification within the RadioGroup.
              RadioCard(
                value: 1,
                child: Basic(
                  // 'Basic' is a helper layout that shows a title and a content line.
                  title: Text('8-core CPU'),
                  content: Text('32 GB RAM'),
                ),
              ),
              RadioCard(
                value: 2,
                child: Basic(
                  title: Text('6-core CPU'),
                  content: Text('24 GB RAM'),
                ),
              ),
              RadioCard(
                value: 3,
                child: Basic(
                  title: Text('4-core CPU'),
                  content: Text('16 GB RAM'),
                ),
              ),
            ],
          )
              // Add horizontal spacing between the cards via the .gap extension.
              .gap(12),
        );
      }
  }
}
```

## Source
Example extracted from: `radio_card_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
