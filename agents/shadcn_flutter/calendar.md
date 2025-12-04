# Calendar

## Description
Calendar widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Holds the current selection (start/end) when in range mode.
  CalendarValue? _value;
  // Tracks the current month/year view independent of selection.
  CalendarView _view = CalendarView.now();
  @override
  Widget build(BuildContext context) {
    ShadcnLocalizations localizations = ShadcnLocalizations.of(context);
    return Card(
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                OutlineButton(
                  density: ButtonDensity.icon,
                  onPressed: () {
                    setState(() {
                      // Move the calendar view to the previous month.
                      _view = _view.previous;
                    });
                  },
                  child: const Icon(Icons.arrow_back).iconXSmall(),
                ),
                Text('${localizations.getMonth(_view.month)} ${_view.year}')
                    .small()
                    .medium()
                    .center()
                    .expanded(),
                OutlineButton(
                  density: ButtonDensity.icon,
                  onPressed: () {
                    setState(() {
                      // Move the calendar view to the next month.
                      _view = _view.next;
                    });
                  },
                  child: const Icon(Icons.arrow_forward).iconXSmall(),
                ),
              ],
            ),
            const Gap(16),
            Calendar(
              value: _value,
              view: _view,
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
              // Range selection allows choosing a start and end date.
              selectionMode: CalendarSelectionMode.range,
            ),
          ],
        ),
      ),
    );
  }
```

## Full Example Class
```dart
class CalendarExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Holds the current selection (start/end) when in range mode.
      CalendarValue? _value;
      // Tracks the current month/year view independent of selection.
      CalendarView _view = CalendarView.now();
      @override
      Widget build(BuildContext context) {
        ShadcnLocalizations localizations = ShadcnLocalizations.of(context);
        return Card(
          child: IntrinsicWidth(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    OutlineButton(
                      density: ButtonDensity.icon,
                      onPressed: () {
                        setState(() {
                          // Move the calendar view to the previous month.
                          _view = _view.previous;
                        });
                      },
                      child: const Icon(Icons.arrow_back).iconXSmall(),
                    ),
                    Text('${localizations.getMonth(_view.month)} ${_view.year}')
                        .small()
                        .medium()
                        .center()
                        .expanded(),
                    OutlineButton(
                      density: ButtonDensity.icon,
                      onPressed: () {
                        setState(() {
                          // Move the calendar view to the next month.
                          _view = _view.next;
                        });
                      },
                      child: const Icon(Icons.arrow_forward).iconXSmall(),
                    ),
                  ],
                ),
                const Gap(16),
                Calendar(
                  value: _value,
                  view: _view,
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  },
                  // Range selection allows choosing a start and end date.
                  selectionMode: CalendarSelectionMode.range,
                ),
              ],
            ),
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `calendar_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
