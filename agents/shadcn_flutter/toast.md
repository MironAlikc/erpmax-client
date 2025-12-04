# Toast

## Description
Toast widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Builder for the toast content; receives an overlay handle so we can close it.
  Widget buildToast(BuildContext context, ToastOverlay overlay) {
    return SurfaceCard(
      child: Basic(
        title: const Text('Event has been created'),
        subtitle: const Text('Sunday, July 07, 2024 at 12:00 PM'),
        trailing: PrimaryButton(
            size: ButtonSize.small,
            onPressed: () {
              // Close the toast programmatically when clicking Undo.
              overlay.close();
            },
            child: const Text('Undo')),
        trailingAlignment: Alignment.center,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        PrimaryButton(
          onPressed: () {
            showToast(
              context: context,
              builder: buildToast,
              // Position bottom-left.
              location: ToastLocation.bottomLeft,
            );
          },
          child: const Text('Show Bottom Left Toast'),
        ),
        PrimaryButton(
          onPressed: () {
            showToast(
              context: context,
              builder: buildToast,
              // Position bottom-right.
              location: ToastLocation.bottomRight,
            );
          },
          child: const Text('Show Bottom Right Toast'),
        ),
        PrimaryButton(
          onPressed: () {
            showToast(
              context: context,
              builder: buildToast,
              // Position top-left.
              location: ToastLocation.topLeft,
            );
          },
          child: const Text('Show Top Left Toast'),
        ),
        PrimaryButton(
          onPressed: () {
            showToast(
              context: context,
              builder: buildToast,
              // Position top-right.
              location: ToastLocation.topRight,
            );
          },
          child: const Text('Show Top Right Toast'),
        ),
        // bottom center
        PrimaryButton(
          onPressed: () {
            showToast(
              context: context,
              builder: buildToast,
              location: ToastLocation.bottomCenter,
            );
          },
          child: const Text('Show Bottom Center Toast'),
        ),
        // top center
        PrimaryButton(
          onPressed: () {
            showToast(
              context: context,
              builder: buildToast,
              location: ToastLocation.topCenter,
            );
          },
          child: const Text('Show Top Center Toast'),
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class ToastExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Builder for the toast content; receives an overlay handle so we can close it.
      Widget buildToast(BuildContext context, ToastOverlay overlay) {
        return SurfaceCard(
          child: Basic(
            title: const Text('Event has been created'),
            subtitle: const Text('Sunday, July 07, 2024 at 12:00 PM'),
            trailing: PrimaryButton(
                size: ButtonSize.small,
                onPressed: () {
                  // Close the toast programmatically when clicking Undo.
                  overlay.close();
                },
                child: const Text('Undo')),
            trailingAlignment: Alignment.center,
          ),
        );
      }

      @override
      Widget build(BuildContext context) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            PrimaryButton(
              onPressed: () {
                showToast(
                  context: context,
                  builder: buildToast,
                  // Position bottom-left.
                  location: ToastLocation.bottomLeft,
                );
              },
              child: const Text('Show Bottom Left Toast'),
            ),
            PrimaryButton(
              onPressed: () {
                showToast(
                  context: context,
                  builder: buildToast,
                  // Position bottom-right.
                  location: ToastLocation.bottomRight,
                );
              },
              child: const Text('Show Bottom Right Toast'),
            ),
            PrimaryButton(
              onPressed: () {
                showToast(
                  context: context,
                  builder: buildToast,
                  // Position top-left.
                  location: ToastLocation.topLeft,
                );
              },
              child: const Text('Show Top Left Toast'),
            ),
            PrimaryButton(
              onPressed: () {
                showToast(
                  context: context,
                  builder: buildToast,
                  // Position top-right.
                  location: ToastLocation.topRight,
                );
              },
              child: const Text('Show Top Right Toast'),
            ),
            // bottom center
            PrimaryButton(
              onPressed: () {
                showToast(
                  context: context,
                  builder: buildToast,
                  location: ToastLocation.bottomCenter,
                );
              },
              child: const Text('Show Bottom Center Toast'),
            ),
            // top center
            PrimaryButton(
              onPressed: () {
                showToast(
                  context: context,
                  builder: buildToast,
                  location: ToastLocation.topCenter,
                );
              },
              child: const Text('Show Top Center Toast'),
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `toast_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
