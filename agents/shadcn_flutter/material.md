# Material

## Description
Material widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int _counter = 0;

  void _incrementCounter() {
    // Demonstrates using a Material SnackBar inside a typical Scaffold app.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You have pushed the button $_counter times'),
      ),
    );
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('My Material App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const shadcnui.Gap(64),
            // You can compose shadcn_flutter widgets inside a Material app.
            // Wrapping with ShadcnUI ensures inherited theme/semantics are properly applied.
            shadcnui.ShadcnUI(
                child: shadcnui.Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                      'You can also use shadcn_flutter widgets inside Material widgets'),
                  const shadcnui.Gap(16),
                  shadcnui.PrimaryButton(
                    onPressed: () {
                      // Show a native Material dialog
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Hello'),
                            content: const Text('This is Material dialog'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Open Material Dialog'),
                  ),
                  const shadcnui.Gap(8),
                  shadcnui.SecondaryButton(
                    onPressed: () {
                      // Show a shadcn_flutter dialog side-by-side for comparison
                      shadcnui.showDialog(
                        context: context,
                        builder: (context) {
                          return shadcnui.AlertDialog(
                            title: const Text('Hello'),
                            content:
                                const Text('This is shadcn_flutter dialog'),
                            actions: [
                              shadcnui.PrimaryButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Text('Open shadcn_flutter Dialog'),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
```

## Full Example Class
```dart
class MaterialExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int _counter = 0;

      void _incrementCounter() {
        // Demonstrates using a Material SnackBar inside a typical Scaffold app.
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You have pushed the button $_counter times'),
          ),
        );
        setState(() {
          _counter++;
        });
      }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('My Material App'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const shadcnui.Gap(64),
                // You can compose shadcn_flutter widgets inside a Material app.
                // Wrapping with ShadcnUI ensures inherited theme/semantics are properly applied.
                shadcnui.ShadcnUI(
                    child: shadcnui.Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                          'You can also use shadcn_flutter widgets inside Material widgets'),
                      const shadcnui.Gap(16),
                      shadcnui.PrimaryButton(
                        onPressed: () {
                          // Show a native Material dialog
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Hello'),
                                content: const Text('This is Material dialog'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Open Material Dialog'),
                      ),
                      const shadcnui.Gap(8),
                      shadcnui.SecondaryButton(
                        onPressed: () {
                          // Show a shadcn_flutter dialog side-by-side for comparison
                          shadcnui.showDialog(
                            context: context,
                            builder: (context) {
                              return shadcnui.AlertDialog(
                                title: const Text('Hello'),
                                content:
                                    const Text('This is shadcn_flutter dialog'),
                                actions: [
                                  shadcnui.PrimaryButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: const Text('Open shadcn_flutter Dialog'),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `material_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
