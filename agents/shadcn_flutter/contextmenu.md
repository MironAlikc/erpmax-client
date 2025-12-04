# ContextMenu

## Description
ContextMenu widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int people = 0;
  bool showBookmarksBar = false;
  bool showFullUrls = true;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContextMenu(
        items: [
          // Simple command with Ctrl+[ shortcut.
          const MenuButton(
            trailing: MenuShortcut(
              activator: SingleActivator(
                LogicalKeyboardKey.bracketLeft,
                control: true,
              ),
            ),
            child: Text('Back'),
          ),
          // Disabled command example with Ctrl+] shortcut.
          const MenuButton(
            trailing: MenuShortcut(
              activator: SingleActivator(
                LogicalKeyboardKey.bracketRight,
                control: true,
              ),
            ),
            enabled: false,
            child: Text('Forward'),
          ),
          // Enabled command with Ctrl+R shortcut.
          const MenuButton(
            trailing: MenuShortcut(
              activator: SingleActivator(
                LogicalKeyboardKey.keyR,
                control: true,
              ),
            ),
            child: Text('Reload'),
          ),
          // Submenu with additional tools and a divider.
          const MenuButton(
            subMenu: [
              MenuButton(
                trailing: MenuShortcut(
                  activator: SingleActivator(
                    LogicalKeyboardKey.keyS,
                    control: true,
                  ),
                ),
                child: Text('Save Page As...'),
              ),
              MenuButton(
                child: Text('Create Shortcut...'),
              ),
              MenuButton(
                child: Text('Name Window...'),
              ),
              MenuDivider(),
              MenuButton(
                child: Text('Developer Tools'),
              ),
            ],
            child: Text('More Tools'),
          ),
          const MenuDivider(),
          // Checkbox item; keep menu open while toggling for quick changes.
          MenuCheckbox(
            value: showBookmarksBar,
            onChanged: (context, value) {
              setState(() {
                showBookmarksBar = value;
              });
            },
            autoClose: false,
            trailing: const MenuShortcut(
              activator: SingleActivator(
                LogicalKeyboardKey.keyB,
                control: true,
                shift: true,
              ),
            ),
            child: const Text('Show Bookmarks Bar'),
          ),
          MenuCheckbox(
            value: showFullUrls,
            onChanged: (context, value) {
              setState(() {
                showFullUrls = value;
              });
            },
            autoClose: false,
            child: const Text('Show Full URLs'),
          ),
          const MenuDivider(),
          const MenuLabel(child: Text('People')),
          const MenuDivider(),
          // Radio group; only one person can be selected at a time.
          MenuRadioGroup(
            value: people,
            onChanged: (context, value) {
              setState(() {
                people = value;
              });
            },
            children: const [
              MenuRadio(
                value: 0,
                autoClose: false,
                child: Text('Pedro Duarte'),
              ),
              MenuRadio(
                value: 1,
                autoClose: false,
                child: Text('Colm Tuite'),
              ),
            ],
          ),
        ],
        child: DashedContainer(
          // Right-click target with a dashed border and rounded corners.
          borderRadius: BorderRadius.circular(theme.radiusMd),
          strokeWidth: 2,
          gap: 2,
          child: const Text('Right click here').center(),
        ).constrained(
          maxWidth: 300,
          maxHeight: 200,
        ));
  }
```

## Full Example Class
```dart
class ContextMenuExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int people = 0;
      bool showBookmarksBar = false;
      bool showFullUrls = true;
      @override
      Widget build(BuildContext context) {
        final theme = Theme.of(context);
        return ContextMenu(
            items: [
              // Simple command with Ctrl+[ shortcut.
              const MenuButton(
                trailing: MenuShortcut(
                  activator: SingleActivator(
                    LogicalKeyboardKey.bracketLeft,
                    control: true,
                  ),
                ),
                child: Text('Back'),
              ),
              // Disabled command example with Ctrl+] shortcut.
              const MenuButton(
                trailing: MenuShortcut(
                  activator: SingleActivator(
                    LogicalKeyboardKey.bracketRight,
                    control: true,
                  ),
                ),
                enabled: false,
                child: Text('Forward'),
              ),
              // Enabled command with Ctrl+R shortcut.
              const MenuButton(
                trailing: MenuShortcut(
                  activator: SingleActivator(
                    LogicalKeyboardKey.keyR,
                    control: true,
                  ),
                ),
                child: Text('Reload'),
              ),
              // Submenu with additional tools and a divider.
              const MenuButton(
                subMenu: [
                  MenuButton(
                    trailing: MenuShortcut(
                      activator: SingleActivator(
                        LogicalKeyboardKey.keyS,
                        control: true,
                      ),
                    ),
                    child: Text('Save Page As...'),
                  ),
                  MenuButton(
                    child: Text('Create Shortcut...'),
                  ),
                  MenuButton(
                    child: Text('Name Window...'),
                  ),
                  MenuDivider(),
                  MenuButton(
                    child: Text('Developer Tools'),
                  ),
                ],
                child: Text('More Tools'),
              ),
              const MenuDivider(),
              // Checkbox item; keep menu open while toggling for quick changes.
              MenuCheckbox(
                value: showBookmarksBar,
                onChanged: (context, value) {
                  setState(() {
                    showBookmarksBar = value;
                  });
                },
                autoClose: false,
                trailing: const MenuShortcut(
                  activator: SingleActivator(
                    LogicalKeyboardKey.keyB,
                    control: true,
                    shift: true,
                  ),
                ),
                child: const Text('Show Bookmarks Bar'),
              ),
              MenuCheckbox(
                value: showFullUrls,
                onChanged: (context, value) {
                  setState(() {
                    showFullUrls = value;
                  });
                },
                autoClose: false,
                child: const Text('Show Full URLs'),
              ),
              const MenuDivider(),
              const MenuLabel(child: Text('People')),
              const MenuDivider(),
              // Radio group; only one person can be selected at a time.
              MenuRadioGroup(
                value: people,
                onChanged: (context, value) {
                  setState(() {
                    people = value;
                  });
                },
                children: const [
                  MenuRadio(
                    value: 0,
                    autoClose: false,
                    child: Text('Pedro Duarte'),
                  ),
                  MenuRadio(
                    value: 1,
                    autoClose: false,
                    child: Text('Colm Tuite'),
                  ),
                ],
              ),
            ],
            child: DashedContainer(
              // Right-click target with a dashed border and rounded corners.
              borderRadius: BorderRadius.circular(theme.radiusMd),
              strokeWidth: 2,
              gap: 2,
              child: const Text('Right click here').center(),
            ).constrained(
              maxWidth: 300,
              maxHeight: 200,
            ));
      }
  }
}
```

## Source
Example extracted from: `context_menu_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
