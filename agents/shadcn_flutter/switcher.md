# Switcher

## Description
Switcher widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
List<AxisDirection> directions = const [
    AxisDirection.up,
    AxisDirection.down,
    AxisDirection.left,
    AxisDirection.right,
  ];
  List<Size> sizes = const [
    Size(200, 300),
    Size(300, 200),
  ];
  int directionIndex = 0;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryButton(
            child: Text(
                'Switch Direction (${directions[directionIndex % directions.length]})'),
            onPressed: () {
              setState(() {
                directionIndex++;
              });
            }),
        gap(8),
        PrimaryButton(
            child: const Text('Next Item'),
            onPressed: () {
              setState(() {
                index++;
              });
            }),
        gap(24),
        ClipRect(
          child: Switcher(
            // The index selects which child is visible; transitions are directional.
            index: index,
            direction: directions[directionIndex % directions.length],
            onIndexChanged: (index) {
              setState(() {
                this.index = index;
              });
            },
            children: [
              for (int i = 0; i < 100; i++)
                NumberedContainer(
                  index: i,
                  // Demonstrate different sizes to show animated size transitions.
                  width: sizes[i % sizes.length].width,
                  height: sizes[i % sizes.length].height,
                )
            ],
          ),
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class SwitcherExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    List<AxisDirection> directions = const [
        AxisDirection.up,
        AxisDirection.down,
        AxisDirection.left,
        AxisDirection.right,
      ];
      List<Size> sizes = const [
        Size(200, 300),
        Size(300, 200),
      ];
      int directionIndex = 0;
      int index = 0;

      @override
      Widget build(BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryButton(
                child: Text(
                    'Switch Direction (${directions[directionIndex % directions.length]})'),
                onPressed: () {
                  setState(() {
                    directionIndex++;
                  });
                }),
            gap(8),
            PrimaryButton(
                child: const Text('Next Item'),
                onPressed: () {
                  setState(() {
                    index++;
                  });
                }),
            gap(24),
            ClipRect(
              child: Switcher(
                // The index selects which child is visible; transitions are directional.
                index: index,
                direction: directions[directionIndex % directions.length],
                onIndexChanged: (index) {
                  setState(() {
                    this.index = index;
                  });
                },
                children: [
                  for (int i = 0; i < 100; i++)
                    NumberedContainer(
                      index: i,
                      // Demonstrate different sizes to show animated size transitions.
                      width: sizes[i % sizes.length].width,
                      height: sizes[i % sizes.length].height,
                    )
                ],
              ),
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `switcher_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
