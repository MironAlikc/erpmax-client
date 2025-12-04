# DropdownMenu

## Description
DropdownMenu widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return OutlineButton(
      onPressed: () {
        // Show the dropdown relative to the button.
        showDropdown(
          context: context,
          builder: (context) {
            return const DropdownMenu(
              children: [
                MenuLabel(child: Text('My Account')),
                MenuDivider(),
                MenuButton(
                  child: Text('Profile'),
                ),
                MenuButton(
                  child: Text('Billing'),
                ),
                MenuButton(
                  child: Text('Settings'),
                ),
                MenuButton(
                  child: Text('Keyboard shortcuts'),
                ),
                MenuDivider(),
                MenuButton(
                  child: Text('Team'),
                ),
                MenuButton(
                  // Demonstrates a nested submenu.
                  subMenu: [
                    MenuButton(
                      child: Text('Email'),
                    ),
                    MenuButton(
                      child: Text('Message'),
                    ),
                    MenuDivider(),
                    MenuButton(
                      child: Text('More...'),
                    ),
                  ],
                  child: Text('Invite users'),
                ),
                MenuButton(
                  child: Text('New Team'),
                ),
                MenuDivider(),
                MenuButton(
                  child: Text('GitHub'),
                ),
                MenuButton(
                  child: Text('Support'),
                ),
                MenuButton(
                  enabled: false,
                  child: Text('API'),
                ),
                MenuButton(
                  child: Text('Log out'),
                ),
              ],
            );
          },
        ).future.then((_) {
          // Called when the dropdown is closed.
          print('Closed');
        });
      },
      child: const Text('Open'),
    );
```

## Full Example Class
```dart
class DropdownMenuExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
          onPressed: () {
            // Show the dropdown relative to the button.
            showDropdown(
              context: context,
              builder: (context) {
                return const DropdownMenu(
                  children: [
                    MenuLabel(child: Text('My Account')),
                    MenuDivider(),
                    MenuButton(
                      child: Text('Profile'),
                    ),
                    MenuButton(
                      child: Text('Billing'),
                    ),
                    MenuButton(
                      child: Text('Settings'),
                    ),
                    MenuButton(
                      child: Text('Keyboard shortcuts'),
                    ),
                    MenuDivider(),
                    MenuButton(
                      child: Text('Team'),
                    ),
                    MenuButton(
                      // Demonstrates a nested submenu.
                      subMenu: [
                        MenuButton(
                          child: Text('Email'),
                        ),
                        MenuButton(
                          child: Text('Message'),
                        ),
                        MenuDivider(),
                        MenuButton(
                          child: Text('More...'),
                        ),
                      ],
                      child: Text('Invite users'),
                    ),
                    MenuButton(
                      child: Text('New Team'),
                    ),
                    MenuDivider(),
                    MenuButton(
                      child: Text('GitHub'),
                    ),
                    MenuButton(
                      child: Text('Support'),
                    ),
                    MenuButton(
                      enabled: false,
                      child: Text('API'),
                    ),
                    MenuButton(
                      child: Text('Log out'),
                    ),
                  ],
                );
              },
            ).future.then((_) {
              // Called when the dropdown is closed.
              print('Closed');
            });
          },
          child: const Text('Open'),
        );
  }
}
```

## Source
Example extracted from: `dropdown_menu_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
