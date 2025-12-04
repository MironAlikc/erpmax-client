# Drawer

## Description
Drawer widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Sequence of positions to cycle through as drawers are stacked.
  List<OverlayPosition> positions = [
    OverlayPosition.end,
    OverlayPosition.end,
    OverlayPosition.bottom,
    OverlayPosition.bottom,
    OverlayPosition.top,
    OverlayPosition.top,
    OverlayPosition.start,
    OverlayPosition.start,
  ];
  // Open a drawer and optionally open another from within it.
  void open(BuildContext context, int count) {
    openDrawer(
      context: context,
      expands: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(48),
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                    'Drawer ${count + 1} at ${positions[count % positions.length].name}'),
                const Gap(16),
                PrimaryButton(
                  onPressed: () {
                    // Open another drawer on top.
                    open(context, count + 1);
                  },
                  child: const Text('Open Another Drawer'),
                ),
                const Gap(8),
                SecondaryButton(
                  onPressed: () {
                    // Close the current top-most overlay.
                    closeOverlay(context);
                  },
                  child: const Text('Close Drawer'),
                ),
              ],
            ),
          ),
        );
      },
      position: positions[count % positions.length],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        open(context, 0);
      },
      child: const Text('Open Drawer'),
    );
  }
```

## Full Example Class
```dart
class DrawerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Sequence of positions to cycle through as drawers are stacked.
      List<OverlayPosition> positions = [
        OverlayPosition.end,
        OverlayPosition.end,
        OverlayPosition.bottom,
        OverlayPosition.bottom,
        OverlayPosition.top,
        OverlayPosition.top,
        OverlayPosition.start,
        OverlayPosition.start,
      ];
      // Open a drawer and optionally open another from within it.
      void open(BuildContext context, int count) {
        openDrawer(
          context: context,
          expands: true,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.all(48),
              child: IntrinsicWidth(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                        'Drawer ${count + 1} at ${positions[count % positions.length].name}'),
                    const Gap(16),
                    PrimaryButton(
                      onPressed: () {
                        // Open another drawer on top.
                        open(context, count + 1);
                      },
                      child: const Text('Open Another Drawer'),
                    ),
                    const Gap(8),
                    SecondaryButton(
                      onPressed: () {
                        // Close the current top-most overlay.
                        closeOverlay(context);
                      },
                      child: const Text('Close Drawer'),
                    ),
                  ],
                ),
              ),
            );
          },
          position: positions[count % positions.length],
        );
      }

      @override
      Widget build(BuildContext context) {
        return PrimaryButton(
          onPressed: () {
            open(context, 0);
          },
          child: const Text('Open Drawer'),
        );
      }
  }
}
```

## Source
Example extracted from: `drawer_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
