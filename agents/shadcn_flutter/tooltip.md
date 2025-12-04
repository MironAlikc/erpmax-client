# Tooltip

## Description
Tooltip widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Tooltip(
      // Tooltip wraps a target widget and shows TooltipContainer on hover/focus.
      tooltip: const TooltipContainer(
        child: Text('This is a tooltip.'),
      ),
      child: PrimaryButton(
        onPressed: () {},
        child: const Text('Hover over me'),
      ),
    );
```

## Full Example Class
```dart
class TooltipExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Tooltip(
          // Tooltip wraps a target widget and shows TooltipContainer on hover/focus.
          tooltip: const TooltipContainer(
            child: Text('This is a tooltip.'),
          ),
          child: PrimaryButton(
            onPressed: () {},
            child: const Text('Hover over me'),
          ),
        );
  }
}
```

## Source
Example extracted from: `tooltip_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
