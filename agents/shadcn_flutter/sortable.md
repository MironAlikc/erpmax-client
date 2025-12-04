# Sortable

## Description
Sortable widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Two separate lists for demonstrating cross-list drag-and-drop.
  List<SortableData<String>> invited = [
    const SortableData('James'),
    const SortableData('John'),
    const SortableData('Robert'),
    const SortableData('Michael'),
    const SortableData('William'),
  ];
  List<SortableData<String>> reserved = [
    const SortableData('David'),
    const SortableData('Richard'),
    const SortableData('Joseph'),
    const SortableData('Thomas'),
    const SortableData('Charles'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SortableLayer(
        // The SortableLayer coordinates drag-over/accept behavior for nested Sortable zones.
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                child: SortableDropFallback<String>(
                  // If dropped into empty space in this list, append to the end.
                  onAccept: (value) {
                    setState(() {
                      swapItemInLists(
                          [invited, reserved], value, invited, invited.length);
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < invited.length; i++)
                        Sortable<String>(
                          data: invited[i],
                          // Insert above the current index when dropped at the top edge.
                          onAcceptTop: (value) {
                            setState(() {
                              swapItemInLists(
                                  [invited, reserved], value, invited, i);
                            });
                          },
                          // Insert below the current index when dropped at the bottom edge.
                          onAcceptBottom: (value) {
                            setState(() {
                              swapItemInLists(
                                  [invited, reserved], value, invited, i + 1);
                            });
                          },
                          child: OutlinedContainer(
                            padding: const EdgeInsets.all(12),
                            child: Center(child: Text(invited[i].data)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            gap(12),
            Expanded(
              child: Card(
                child: SortableDropFallback<String>(
                  // Same behavior for the second list.
                  onAccept: (value) {
                    setState(() {
                      swapItemInLists([invited, reserved], value, reserved,
                          reserved.length);
                    });
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < reserved.length; i++)
                        Sortable<String>(
                          data: reserved[i],
                          onAcceptTop: (value) {
                            setState(() {
                              swapItemInLists(
                                  [invited, reserved], value, reserved, i);
                            });
                          },
                          onAcceptBottom: (value) {
                            setState(() {
                              swapItemInLists(
                                  [invited, reserved], value, reserved, i + 1);
                            });
                          },
                          child: OutlinedContainer(
                            padding: const EdgeInsets.all(12),
                            child: Center(child: Text(reserved[i].data)),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
```

## Full Example Class
```dart
class SortableExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Two separate lists for demonstrating cross-list drag-and-drop.
      List<SortableData<String>> invited = [
        const SortableData('James'),
        const SortableData('John'),
        const SortableData('Robert'),
        const SortableData('Michael'),
        const SortableData('William'),
      ];
      List<SortableData<String>> reserved = [
        const SortableData('David'),
        const SortableData('Richard'),
        const SortableData('Joseph'),
        const SortableData('Thomas'),
        const SortableData('Charles'),
      ];

      @override
      void initState() {
        super.initState();
      }

      @override
      Widget build(BuildContext context) {
        return SizedBox(
          height: 500,
          child: SortableLayer(
            // The SortableLayer coordinates drag-over/accept behavior for nested Sortable zones.
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Card(
                    child: SortableDropFallback<String>(
                      // If dropped into empty space in this list, append to the end.
                      onAccept: (value) {
                        setState(() {
                          swapItemInLists(
                              [invited, reserved], value, invited, invited.length);
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int i = 0; i < invited.length; i++)
                            Sortable<String>(
                              data: invited[i],
                              // Insert above the current index when dropped at the top edge.
                              onAcceptTop: (value) {
                                setState(() {
                                  swapItemInLists(
                                      [invited, reserved], value, invited, i);
                                });
                              },
                              // Insert below the current index when dropped at the bottom edge.
                              onAcceptBottom: (value) {
                                setState(() {
                                  swapItemInLists(
                                      [invited, reserved], value, invited, i + 1);
                                });
                              },
                              child: OutlinedContainer(
                                padding: const EdgeInsets.all(12),
                                child: Center(child: Text(invited[i].data)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                gap(12),
                Expanded(
                  child: Card(
                    child: SortableDropFallback<String>(
                      // Same behavior for the second list.
                      onAccept: (value) {
                        setState(() {
                          swapItemInLists([invited, reserved], value, reserved,
                              reserved.length);
                        });
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (int i = 0; i < reserved.length; i++)
                            Sortable<String>(
                              data: reserved[i],
                              onAcceptTop: (value) {
                                setState(() {
                                  swapItemInLists(
                                      [invited, reserved], value, reserved, i);
                                });
                              },
                              onAcceptBottom: (value) {
                                setState(() {
                                  swapItemInLists(
                                      [invited, reserved], value, reserved, i + 1);
                                });
                              },
                              child: OutlinedContainer(
                                padding: const EdgeInsets.all(12),
                                child: Center(child: Text(reserved[i].data)),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
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
Example extracted from: `sortable_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
