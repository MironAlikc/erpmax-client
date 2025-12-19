# NavigationRail

## Description
NavigationRail widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
int selected = 0;

  NavigationRailAlignment alignment = NavigationRailAlignment.start;
  NavigationLabelType labelType = NavigationLabelType.none;
  NavigationLabelPosition labelPosition = NavigationLabelPosition.bottom;
  bool AppButtonStyle = false;
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
    return Scaffold(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          NavigationRail(
            alignment: alignment,
            labelType: labelType,
            index: selected,
            labelPosition: labelPosition,
            expanded: expanded,
            onSelected: (index) {
              setState(() {
                selected = index;
              });
            },
            children: [
              buildButton('Home', BootstrapIcons.house),
              buildButton('Explore', BootstrapIcons.compass),
              buildButton('Library', BootstrapIcons.musicNoteList),
              const NavigationDivider(),
              const NavigationLabel(child: Text('Settings')),
              buildButton('Profile', BootstrapIcons.person),
              buildButton('App', BootstrapIcons.appIndicator),
              const NavigationDivider(),
              const NavigationGap(12),
              const NavigationWidget(
                child: FlutterLogo(),
              ),
            ],
          ),
          const VerticalDivider(),
          Expanded(
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
                    // Alignment of items within the rail.
                    Select<NavigationRailAlignment>(
                      value: alignment,
                      itemBuilder:
                          (BuildContext context, NavigationRailAlignment item) {
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
                        for (var value in NavigationRailAlignment.values)
                          SelectItemButton(
                            value: value,
                            child: Text(value.name),
                          ),
                      ])),
                    ),
                    // Label visibility behavior for each destination.
                    Select<NavigationLabelType>(
                      value: labelType,
                      itemBuilder:
                          (BuildContext context, NavigationLabelType item) {
                        return Text(item.name);
                      },
                      popupConstraints:
                          BoxConstraints.tight(const Size(200, 200)),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            labelType = value;
                          });
                        }
                      },
                      popup: SelectPopup(
                        items: SelectItemList(
                          children: [
                            for (var value in NavigationLabelType.values)
                              SelectItemButton(
                                value: value,
                                child: Text(value.name),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Where the label appears relative to the icon.
                    Select<NavigationLabelPosition>(
                      value: labelPosition,
                      itemBuilder:
                          (BuildContext context, NavigationLabelPosition item) {
                        return Text(item.name);
                      },
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            labelPosition = value;
                          });
                        }
                      },
                      popup: SelectPopup(
                        items: SelectItemList(
                          children: [
                            for (var value in NavigationLabelPosition.values)
                              SelectItemButton(
                                value: value,
                                child: Text(value.name),
                              ),
                          ],
                        ),
                      ),
                    ),
                    // Toggle custom vs default button styles for normal/selected.
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
                    // Whether the rail is in expanded mode (shows labels, etc.).
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
        ],
      ),
    );
  }
```

## Full Example Class
```dart
class NavigationRailExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    int selected = 0;

      NavigationRailAlignment alignment = NavigationRailAlignment.start;
      NavigationLabelType labelType = NavigationLabelType.none;
      NavigationLabelPosition labelPosition = NavigationLabelPosition.bottom;
      bool AppButtonStyle = false;
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
        return Scaffold(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NavigationRail(
                alignment: alignment,
                labelType: labelType,
                index: selected,
                labelPosition: labelPosition,
                expanded: expanded,
                onSelected: (index) {
                  setState(() {
                    selected = index;
                  });
                },
                children: [
                  buildButton('Home', BootstrapIcons.house),
                  buildButton('Explore', BootstrapIcons.compass),
                  buildButton('Library', BootstrapIcons.musicNoteList),
                  const NavigationDivider(),
                  const NavigationLabel(child: Text('Settings')),
                  buildButton('Profile', BootstrapIcons.person),
                  buildButton('App', BootstrapIcons.appIndicator),
                  const NavigationDivider(),
                  const NavigationGap(12),
                  const NavigationWidget(
                    child: FlutterLogo(),
                  ),
                ],
              ),
              const VerticalDivider(),
              Expanded(
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
                        // Alignment of items within the rail.
                        Select<NavigationRailAlignment>(
                          value: alignment,
                          itemBuilder:
                              (BuildContext context, NavigationRailAlignment item) {
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
                            for (var value in NavigationRailAlignment.values)
                              SelectItemButton(
                                value: value,
                                child: Text(value.name),
                              ),
                          ])),
                        ),
                        // Label visibility behavior for each destination.
                        Select<NavigationLabelType>(
                          value: labelType,
                          itemBuilder:
                              (BuildContext context, NavigationLabelType item) {
                            return Text(item.name);
                          },
                          popupConstraints:
                              BoxConstraints.tight(const Size(200, 200)),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                labelType = value;
                              });
                            }
                          },
                          popup: SelectPopup(
                            items: SelectItemList(
                              children: [
                                for (var value in NavigationLabelType.values)
                                  SelectItemButton(
                                    value: value,
                                    child: Text(value.name),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        // Where the label appears relative to the icon.
                        Select<NavigationLabelPosition>(
                          value: labelPosition,
                          itemBuilder:
                              (BuildContext context, NavigationLabelPosition item) {
                            return Text(item.name);
                          },
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                labelPosition = value;
                              });
                            }
                          },
                          popup: SelectPopup(
                            items: SelectItemList(
                              children: [
                                for (var value in NavigationLabelPosition.values)
                                  SelectItemButton(
                                    value: value,
                                    child: Text(value.name),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        // Toggle custom vs default button styles for normal/selected.
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
                        // Whether the rail is in expanded mode (shows labels, etc.).
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
            ],
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `navigation_rail_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
