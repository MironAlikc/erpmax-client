# RefreshTrigger

## Description
RefreshTrigger widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// A GlobalKey lets us access the RefreshTrigger's state so we can
  // trigger a programmatic refresh (via a button) in addition to pull-to-refresh.
  final GlobalKey<RefreshTriggerState> _refreshTriggerKey =
      GlobalKey<RefreshTriggerState>();
  @override
  Widget build(BuildContext context) {
    return RefreshTrigger(
      key: _refreshTriggerKey,
      // Called when the user pulls down far enough or when we call .refresh().
      // Here we simulate a network call with a short delay.
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 2));
      },
      child: SingleChildScrollView(
        child: Container(
          // Give the scroll view some height so pull-to-refresh can be triggered.
          height: 800,
          padding: const EdgeInsets.only(top: 32),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              const Text('Pull Me'),
              const Gap(16),
              PrimaryButton(
                onPressed: () {
                  // Programmatically trigger the refresh without a pull gesture.
                  _refreshTriggerKey.currentState!.refresh();
                },
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
```

## Full Example Class
```dart
class RefreshTriggerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // A GlobalKey lets us access the RefreshTrigger's state so we can
      // trigger a programmatic refresh (via a button) in addition to pull-to-refresh.
      final GlobalKey<RefreshTriggerState> _refreshTriggerKey =
          GlobalKey<RefreshTriggerState>();
      @override
      Widget build(BuildContext context) {
        return RefreshTrigger(
          key: _refreshTriggerKey,
          // Called when the user pulls down far enough or when we call .refresh().
          // Here we simulate a network call with a short delay.
          onRefresh: () async {
            await Future.delayed(const Duration(seconds: 2));
          },
          child: SingleChildScrollView(
            child: Container(
              // Give the scroll view some height so pull-to-refresh can be triggered.
              height: 800,
              padding: const EdgeInsets.only(top: 32),
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Text('Pull Me'),
                  const Gap(16),
                  PrimaryButton(
                    onPressed: () {
                      // Programmatically trigger the refresh without a pull gesture.
                      _refreshTriggerKey.currentState!.refresh();
                    },
                    child: const Text('Refresh'),
                  ),
                ],
              ),
            ),
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `refresh_trigger_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
