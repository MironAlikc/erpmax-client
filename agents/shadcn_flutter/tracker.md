# Tracker

## Description
Tracker widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
@override
  Widget build(BuildContext context) {
    // Build a simple sequence of tracker cells with different severity levels.
    List<TrackerData> data = [];
    for (int i = 0; i < 80; i++) {
      data.add(const TrackerData(
        tooltip: Text('Tracker Fine'),
        level: TrackerLevel.fine,
      ));
    }
    // Mark some indices as warnings.
    data[40] = data[35] = const TrackerData(
      tooltip: Text('Tracker Warning'),
      level: TrackerLevel.warning,
    );
    // And a few as critical.
    data[60] = data[68] = data[72] = const TrackerData(
      tooltip: Text('Tracker Critical'),
      level: TrackerLevel.critical,
    );
    // Unknown levels to show a broader legend.
    for (int i = 8; i < 16; i++) {
      data[i] = const TrackerData(
        tooltip: Text('Tracker Unknown'),
        level: TrackerLevel.unknown,
      );
    }
    // Tracker renders a compact heatmap-like strip with tooltips per cell.
    return Tracker(data: data);
  }
```

## Full Example Class
```dart
class TrackerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    @override
      Widget build(BuildContext context) {
        // Build a simple sequence of tracker cells with different severity levels.
        List<TrackerData> data = [];
        for (int i = 0; i < 80; i++) {
          data.add(const TrackerData(
            tooltip: Text('Tracker Fine'),
            level: TrackerLevel.fine,
          ));
        }
        // Mark some indices as warnings.
        data[40] = data[35] = const TrackerData(
          tooltip: Text('Tracker Warning'),
          level: TrackerLevel.warning,
        );
        // And a few as critical.
        data[60] = data[68] = data[72] = const TrackerData(
          tooltip: Text('Tracker Critical'),
          level: TrackerLevel.critical,
        );
        // Unknown levels to show a broader legend.
        for (int i = 8; i < 16; i++) {
          data[i] = const TrackerData(
            tooltip: Text('Tracker Unknown'),
            level: TrackerLevel.unknown,
          );
        }
        // Tracker renders a compact heatmap-like strip with tooltips per cell.
        return Tracker(data: data);
      }
  }
}
```

## Source
Example extracted from: `tracker_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
