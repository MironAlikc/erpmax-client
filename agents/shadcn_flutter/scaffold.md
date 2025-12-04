# Scaffold

## Description
Scaffold widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Simple counter to demonstrate updating content inside the Scaffold body.
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Show an indeterminate progress indicator in the header area (for demo purposes).
      loadingProgressIndeterminate: true,
      headers: [
        AppBar(
          title: const Text('Counter App'),
          subtitle: const Text('A simple counter app'),
          leading: [
            OutlineButton(
              onPressed: () {},
              density: ButtonDensity.icon,
              child: const Icon(Icons.menu),
            ),
          ],
          trailing: [
            OutlineButton(
              onPressed: () {},
              density: ButtonDensity.icon,
              child: const Icon(Icons.search),
            ),
            OutlineButton(
              onPressed: () {},
              density: ButtonDensity.icon,
              child: const Icon(Icons.add),
            ),
          ],
        ),
        // Divider between the header and the body.
        const Divider(),
      ],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // The .p() extension adds default padding around the widget.
            const Text('You have pushed the button this many times:').p(),
            Text(
              '$_counter',
            ).h1(),
            PrimaryButton(
              onPressed: _incrementCounter,
              density: ButtonDensity.icon,
              child: const Icon(Icons.add),
            ).p(),
          ],
        ),
      ),
    );
  }
```

## Full Example Class
```dart
class ScaffoldExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Simple counter to demonstrate updating content inside the Scaffold body.
      int _counter = 0;

      void _incrementCounter() {
        setState(() {
          _counter++;
        });
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          // Show an indeterminate progress indicator in the header area (for demo purposes).
          loadingProgressIndeterminate: true,
          headers: [
            AppBar(
              title: const Text('Counter App'),
              subtitle: const Text('A simple counter app'),
              leading: [
                OutlineButton(
                  onPressed: () {},
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.menu),
                ),
              ],
              trailing: [
                OutlineButton(
                  onPressed: () {},
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.search),
                ),
                OutlineButton(
                  onPressed: () {},
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            // Divider between the header and the body.
            const Divider(),
          ],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // The .p() extension adds default padding around the widget.
                const Text('You have pushed the button this many times:').p(),
                Text(
                  '$_counter',
                ).h1(),
                PrimaryButton(
                  onPressed: _incrementCounter,
                  density: ButtonDensity.icon,
                  child: const Icon(Icons.add),
                ).p(),
              ],
            ),
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `scaffold_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
