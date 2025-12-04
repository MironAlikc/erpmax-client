# AlertDialog

## Description
AlertDialog widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return PrimaryButton(
      child: const Text('Click Here'),
      onPressed: () {
        // Standard Flutter API to present a dialog above the current route.
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Alert title'),
              content: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              actions: [
                // Secondary action to cancel/dismiss.
                OutlineButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    // Close the dialog.
                    Navigator.pop(context);
                  },
                ),
                // Primary action to accept/confirm.
                PrimaryButton(
                  child: const Text('OK'),
                  onPressed: () {
                    // Close the dialog. In real apps, perform work before closing.
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      },
    );
```

## Full Example Class
```dart
class AlertDialogExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
          child: const Text('Click Here'),
          onPressed: () {
            // Standard Flutter API to present a dialog above the current route.
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Alert title'),
                  content: const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                  actions: [
                    // Secondary action to cancel/dismiss.
                    OutlineButton(
                      child: const Text('Cancel'),
                      onPressed: () {
                        // Close the dialog.
                        Navigator.pop(context);
                      },
                    ),
                    // Primary action to accept/confirm.
                    PrimaryButton(
                      child: const Text('OK'),
                      onPressed: () {
                        // Close the dialog. In real apps, perform work before closing.
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
        );
  }
}
```

## Source
Example extracted from: `alert_dialog_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
