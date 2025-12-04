# Card

## Description
Card widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Card(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Create project').semiBold(),
          const SizedBox(height: 4),
          const Text('Deploy your new project in one-click').muted().small(),
          const SizedBox(height: 24),
          const Text('Name').semiBold().small(),
          const SizedBox(height: 4),
          const TextField(placeholder: Text('Name of your project')),
          const SizedBox(height: 16),
          const Text('Description').semiBold().small(),
          const SizedBox(height: 4),
          const TextField(placeholder: Text('Description of your project')),
          const SizedBox(height: 24),
          Row(
            children: [
              OutlineButton(
                child: const Text('Cancel'),
                onPressed: () {},
              ),
              const Spacer(),
              PrimaryButton(
                child: const Text('Deploy'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ).intrinsic();
```

## Full Example Class
```dart
class CardExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Create project').semiBold(),
              const SizedBox(height: 4),
              const Text('Deploy your new project in one-click').muted().small(),
              const SizedBox(height: 24),
              const Text('Name').semiBold().small(),
              const SizedBox(height: 4),
              const TextField(placeholder: Text('Name of your project')),
              const SizedBox(height: 16),
              const Text('Description').semiBold().small(),
              const SizedBox(height: 4),
              const TextField(placeholder: Text('Description of your project')),
              const SizedBox(height: 24),
              Row(
                children: [
                  OutlineButton(
                    child: const Text('Cancel'),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  PrimaryButton(
                    child: const Text('Deploy'),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ).intrinsic();
  }
}
```

## Source
Example extracted from: `card_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
