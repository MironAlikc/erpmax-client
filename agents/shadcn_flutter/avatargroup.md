# AvatarGroup

## Description
AvatarGroup widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
/// Helper that returns a few colored avatars to visualize overlap.
  List<AvatarWidget> getAvatars() {
    return [
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.red,
      ),
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.green,
      ),
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.blue,
      ),
      Avatar(
        initials: Avatar.getInitials('sunarya-thito'),
        backgroundColor: Colors.yellow,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        // Overlap avatars towards the left.
        AvatarGroup.toLeft(children: getAvatars()),
        // Overlap avatars towards the right.
        AvatarGroup.toRight(children: getAvatars()),
        // Stack vertically upwards.
        AvatarGroup.toTop(children: getAvatars()),
        // Stack vertically downwards.
        AvatarGroup.toBottom(children: getAvatars()),
      ],
    );
  }
```

## Full Example Class
```dart
class AvatarGroupExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    /// Helper that returns a few colored avatars to visualize overlap.
      List<AvatarWidget> getAvatars() {
        return [
          Avatar(
            initials: Avatar.getInitials('sunarya-thito'),
            backgroundColor: Colors.red,
          ),
          Avatar(
            initials: Avatar.getInitials('sunarya-thito'),
            backgroundColor: Colors.green,
          ),
          Avatar(
            initials: Avatar.getInitials('sunarya-thito'),
            backgroundColor: Colors.blue,
          ),
          Avatar(
            initials: Avatar.getInitials('sunarya-thito'),
            backgroundColor: Colors.yellow,
          ),
        ];
      }

      @override
      Widget build(BuildContext context) {
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            // Overlap avatars towards the left.
            AvatarGroup.toLeft(children: getAvatars()),
            // Overlap avatars towards the right.
            AvatarGroup.toRight(children: getAvatars()),
            // Stack vertically upwards.
            AvatarGroup.toTop(children: getAvatars()),
            // Stack vertically downwards.
            AvatarGroup.toBottom(children: getAvatars()),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `avatar_group_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
