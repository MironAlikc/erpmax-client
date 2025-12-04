# Skeleton

## Description
Skeleton widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Column(
      children: [
        const Basic(
          title: Text('Skeleton Example 1'),
          content:
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          leading: Avatar(
            initials: '',
          ),
          trailing: Icon(Icons.arrow_forward),
        ),
        const Gap(24),
        Basic(
          title: const Text('Skeleton Example 1'),
          content: const Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          leading: const Avatar(
            initials: '',
          ).asSkeleton(),
          // Note: Avatar and other Image related widget needs its own skeleton
          trailing: const Icon(Icons.arrow_forward),
        )
            // Wrap the whole row in a skeleton to show a loading placeholder for text and icons.
            .asSkeleton(),
      ],
    );
```

## Full Example Class
```dart
class SkeletonExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            const Basic(
              title: Text('Skeleton Example 1'),
              content:
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              leading: Avatar(
                initials: '',
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
            const Gap(24),
            Basic(
              title: const Text('Skeleton Example 1'),
              content: const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              leading: const Avatar(
                initials: '',
              ).asSkeleton(),
              // Note: Avatar and other Image related widget needs its own skeleton
              trailing: const Icon(Icons.arrow_forward),
            )
                // Wrap the whole row in a skeleton to show a loading placeholder for text and icons.
                .asSkeleton(),
          ],
        );
  }
}
```

## Source
Example extracted from: `skeleton_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
