# NavigationBar

## Description
NavigationBar widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int selected = 0;

  NavigationBarAlignment alignment = NavigationBarAlignment.spaceAround;
  bool expands = true;
  NavigationLabelType labelType = NavigationLabelType.none;
  bool AppButtonStyle = true;
  bool expanded = true;

  NavigationItem buildButton(String label, IconData icon) {
    return NavigationItem(
      style: AppButtonStyle
          ? const ButtonStyle.muted(density: ButtonDensity.icon)
          : null,
      selectedStyle: AppButtonStyle
          ? const ButtonStyle.fixed(density: ButtonDensity.icon)
          : null,
      label: Text(label),
      child: Icon(icon),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      width: 500,
      height: 400,
      child: Scaffold(
        footers: [
          const Divider(),
          NavigationBar(
            alignment: alignment,
            labelType: labelType,
            expanded: expanded,
            expands: expands,
            onSelected: (index) {
              setState(() {
                selected = index;
              });
            },
            index: selected,
            children: [
              buildButton('Home', BootstrapIcons.house),
              buildButton('Explore', BootstrapIcons.compass),
              buildButton('Library', BootstrapIcons.musicNoteList),
              buildButton('Profile', BootstrapIcons.person),
              buildButton('App', BootstrapIcons.appIndicator),
            ],
          ),
        ],
        child: Container(
          color: Colors.primaries[Colors.primaries.length - selected - 1],
          padding: const EdgeInsets.all(24),
          child: Card(
            child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 8,
              spacing: 8,
              children: [
                // Configure how the items are distributed across the bar.
                Select<NavigationBarAlignment>(
                  value: alignment,
                  itemBuilder:
                      (BuildContext context, NavigationBarAlignment item) {
                    return Text(item.name);
                  },
                  popupWidthConstraint: PopoverConstraint.anchorFixedSize,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        alignment = value;
                      });
                    }
                  },
                  popup: SelectPopup(
                      items: SelectItemList(children: [
                    for (var value in NavigationBarAlignment.values)
                      SelectItemButton(
                        value: value,
                        child: Text(value.name),
                      ),
                  ])),
                ),
                // Control how labels are shown for each navigation item.
                Select<NavigationLabelType>(
                  value: labelType,
                  itemBuilder:
                      (BuildContext context, NavigationLabelType item) {
                    return Text(item.name);
                  },
                  popupWidthConstraint: PopoverConstraint.anchorFixedSize,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        labelType = value;
                      });
                    }
                  },
                  popup: SelectPopup(
                      items: SelectItemList(children: [
                    for (var value in NavigationLabelType.values)
                      SelectItemButton(
                        value: value,
                        child: Text(value.name),
                      ),
                  ])),
                ),
                // Whether the navigation bar can expand to fill width.
                Checkbox(
                  state:
                      expands ? CheckboxState.checked : CheckboxState.unchecked,
                  onChanged: (value) {
                    setState(() {
                      expands = value == CheckboxState.checked;
                    });
                  },
                  trailing: const Text('Expands'),
                ),
                // Use custom button styles for normal vs selected states.
                Checkbox(
                  state: AppButtonStyle
                      ? CheckboxState.checked
                      : CheckboxState.unchecked,
                  onChanged: (value) {
                    setState(() {
                      AppButtonStyle = value == CheckboxState.checked;
                    });
                  },
                  trailing: const Text('Custom Button Style'),
                ),
                // Toggle the expanded label behavior.
                Checkbox(
                  state: expanded
                      ? CheckboxState.checked
                      : CheckboxState.unchecked,
                  onChanged: (value) {
                    setState(() {
                      expanded = value == CheckboxState.checked;
                    });
                  },
                  trailing: const Text('Expanded'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
```

## Full Example Class
```dart
class NavigationBarExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int selected = 0;

      NavigationBarAlignment alignment = NavigationBarAlignment.spaceAround;
      bool expands = true;
      NavigationLabelType labelType = NavigationLabelType.none;
      bool AppButtonStyle = true;
      bool expanded = true;

      NavigationItem buildButton(String label, IconData icon) {
        return NavigationItem(
          style: AppButtonStyle
              ? const ButtonStyle.muted(density: ButtonDensity.icon)
              : null,
          selectedStyle: AppButtonStyle
              ? const ButtonStyle.fixed(density: ButtonDensity.icon)
              : null,
          label: Text(label),
          child: Icon(icon),
        );
      }

      @override
      Widget build(BuildContext context) {
        return OutlinedContainer(
          width: 500,
          height: 400,
          child: Scaffold(
            footers: [
              const Divider(),
              NavigationBar(
                alignment: alignment,
                labelType: labelType,
                expanded: expanded,
                expands: expands,
                onSelected: (index) {
                  setState(() {
                    selected = index;
                  });
                },
                index: selected,
                children: [
                  buildButton('Home', BootstrapIcons.house),
                  buildButton('Explore', BootstrapIcons.compass),
                  buildButton('Library', BootstrapIcons.musicNoteList),
                  buildButton('Profile', BootstrapIcons.person),
                  buildButton('App', BootstrapIcons.appIndicator),
                ],
              ),
            ],
            child: Container(
              color: Colors.primaries[Colors.primaries.length - selected - 1],
              padding: const EdgeInsets.all(24),
              child: Card(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runSpacing: 8,
                  spacing: 8,
                  children: [
                    // Configure how the items are distributed across the bar.
                    Select<NavigationBarAlignment>(
                      value: alignment,
                      itemBuilder:
                          (BuildContext context, NavigationBarAlignment item) {
                        return Text(item.name);
                      },
                      popupWidthConstraint: PopoverConstraint.anchorFixedSize,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            alignment = value;
                          });
                        }
                      },
                      popup: SelectPopup(
                          items: SelectItemList(children: [
                        for (var value in NavigationBarAlignment.values)
                          SelectItemButton(
                            value: value,
                            child: Text(value.name),
                          ),
                      ])),
                    ),
                    // Control how labels are shown for each navigation item.
                    Select<NavigationLabelType>(
                      value: labelType,
                      itemBuilder:
                          (BuildContext context, NavigationLabelType item) {
                        return Text(item.name);
                      },
                      popupWidthConstraint: PopoverConstraint.anchorFixedSize,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            labelType = value;
                          });
                        }
                      },
                      popup: SelectPopup(
                          items: SelectItemList(children: [
                        for (var value in NavigationLabelType.values)
                          SelectItemButton(
                            value: value,
                            child: Text(value.name),
                          ),
                      ])),
                    ),
                    // Whether the navigation bar can expand to fill width.
                    Checkbox(
                      state:
                          expands ? CheckboxState.checked : CheckboxState.unchecked,
                      onChanged: (value) {
                        setState(() {
                          expands = value == CheckboxState.checked;
                        });
                      },
                      trailing: const Text('Expands'),
                    ),
                    // Use custom button styles for normal vs selected states.
                    Checkbox(
                      state: AppButtonStyle
                          ? CheckboxState.checked
                          : CheckboxState.unchecked,
                      onChanged: (value) {
                        setState(() {
                          AppButtonStyle = value == CheckboxState.checked;
                        });
                      },
                      trailing: const Text('Custom Button Style'),
                    ),
                    // Toggle the expanded label behavior.
                    Checkbox(
                      state: expanded
                          ? CheckboxState.checked
                          : CheckboxState.unchecked,
                      onChanged: (value) {
                        setState(() {
                          expanded = value == CheckboxState.checked;
                        });
                      },
                      trailing: const Text('Expanded'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `navigation_bar_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
