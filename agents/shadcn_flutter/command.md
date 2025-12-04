# Command

## Description
Command widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return Command(
      // The builder is an async generator producing lists of CommandCategory
      // based on the current search query. Each yield updates the UI.
      builder: (context, query) async* {
        Map<String, List<String>> items = {
          'Suggestions': ['Calendar', 'Search Emoji', 'Launch'],
          'Settings': ['Profile', 'Mail', 'Settings'],
        };
        Map<String, Widget> icons = {
          'Calendar': const Icon(Icons.calendar_today),
          'Search Emoji': const Icon(Icons.emoji_emotions_outlined),
          'Launch': const Icon(Icons.rocket_launch_outlined),
          'Profile': const Icon(Icons.person_outline),
          'Mail': const Icon(Icons.mail_outline),
          'Settings': const Icon(Icons.settings_outlined),
        };
        for (final values in items.entries) {
          List<Widget> resultItems = [];
          for (final item in values.value) {
            if (query == null ||
                item.toLowerCase().contains(query.toLowerCase())) {
              resultItems.add(CommandItem(
                title: Text(item),
                leading: icons[item],
                onTap: () {},
              ));
            }
          }
          if (resultItems.isNotEmpty) {
            // Simulate latency to showcase incremental results.
            await Future.delayed(const Duration(seconds: 1));
            yield [
              CommandCategory(
                title: Text(values.key),
                children: resultItems,
              ),
            ];
          }
        }
      },
    ).sized(width: 300, height: 300);
```

## Full Example Class
```dart
class CommandExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Command(
          // The builder is an async generator producing lists of CommandCategory
          // based on the current search query. Each yield updates the UI.
          builder: (context, query) async* {
            Map<String, List<String>> items = {
              'Suggestions': ['Calendar', 'Search Emoji', 'Launch'],
              'Settings': ['Profile', 'Mail', 'Settings'],
            };
            Map<String, Widget> icons = {
              'Calendar': const Icon(Icons.calendar_today),
              'Search Emoji': const Icon(Icons.emoji_emotions_outlined),
              'Launch': const Icon(Icons.rocket_launch_outlined),
              'Profile': const Icon(Icons.person_outline),
              'Mail': const Icon(Icons.mail_outline),
              'Settings': const Icon(Icons.settings_outlined),
            };
            for (final values in items.entries) {
              List<Widget> resultItems = [];
              for (final item in values.value) {
                if (query == null ||
                    item.toLowerCase().contains(query.toLowerCase())) {
                  resultItems.add(CommandItem(
                    title: Text(item),
                    leading: icons[item],
                    onTap: () {},
                  ));
                }
              }
              if (resultItems.isNotEmpty) {
                // Simulate latency to showcase incremental results.
                await Future.delayed(const Duration(seconds: 1));
                yield [
                  CommandCategory(
                    title: Text(values.key),
                    children: resultItems,
                  ),
                ];
              }
            }
          },
        ).sized(width: 300, height: 300);
  }
}
```

## Source
Example extracted from: `command_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
