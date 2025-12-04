# Chip

## Description
Chip widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        Chip(
          // Trailing action; in real apps you might remove the chip.
          trailing: ChipButton(
            onPressed: () {},
            child: const Icon(Icons.close),
          ),
          child: const Text('Apple'),
        ),
        Chip(
          // Primary-styled chip.
          style: const ButtonStyle.primary(),
          trailing: ChipButton(
            onPressed: () {},
            child: const Icon(Icons.close),
          ),
          child: const Text('Banana'),
        ),
        Chip(
          // Outlined chip.
          style: const ButtonStyle.outline(),
          trailing: ChipButton(
            onPressed: () {},
            child: const Icon(Icons.close),
          ),
          child: const Text('Cherry'),
        ),
        Chip(
          // Ghost chip (very subtle background).
          style: const ButtonStyle.ghost(),
          trailing: ChipButton(
            onPressed: () {},
            child: const Icon(Icons.close),
          ),
          child: const Text('Durian'),
        ),
        Chip(
          // Destructive-styled chip for warning/critical labels.
          style: const ButtonStyle.destructive(),
          trailing: ChipButton(
            onPressed: () {},
            child: const Icon(Icons.close),
          ),
          child: const Text('Elderberry'),
        ),
      ],
    );
```

## Full Example Class
```dart
class ChipExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            Chip(
              // Trailing action; in real apps you might remove the chip.
              trailing: ChipButton(
                onPressed: () {},
                child: const Icon(Icons.close),
              ),
              child: const Text('Apple'),
            ),
            Chip(
              // Primary-styled chip.
              style: const ButtonStyle.primary(),
              trailing: ChipButton(
                onPressed: () {},
                child: const Icon(Icons.close),
              ),
              child: const Text('Banana'),
            ),
            Chip(
              // Outlined chip.
              style: const ButtonStyle.outline(),
              trailing: ChipButton(
                onPressed: () {},
                child: const Icon(Icons.close),
              ),
              child: const Text('Cherry'),
            ),
            Chip(
              // Ghost chip (very subtle background).
              style: const ButtonStyle.ghost(),
              trailing: ChipButton(
                onPressed: () {},
                child: const Icon(Icons.close),
              ),
              child: const Text('Durian'),
            ),
            Chip(
              // Destructive-styled chip for warning/critical labels.
              style: const ButtonStyle.destructive(),
              trailing: ChipButton(
                onPressed: () {},
                child: const Icon(Icons.close),
              ),
              child: const Text('Elderberry'),
            ),
          ],
        );
  }
}
```

## Source
Example extracted from: `chip_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
