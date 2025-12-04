# Avatar

## Description
Avatar widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Avatar(
      backgroundColor: Colors.red,
      // Helper to derive initials from a username or full name.
      initials: Avatar.getInitials('sunarya-thito'),
      provider: const NetworkImage(
          'https://avatars.githubusercontent.com/u/64018564?v=4'),
    );
```

## Full Example Class
```dart
class AvatarExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Avatar(
          backgroundColor: Colors.red,
          // Helper to derive initials from a username or full name.
          initials: Avatar.getInitials('sunarya-thito'),
          provider: const NetworkImage(
              'https://avatars.githubusercontent.com/u/64018564?v=4'),
        );
  }
}
```

## Source
Example extracted from: `avatar_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
