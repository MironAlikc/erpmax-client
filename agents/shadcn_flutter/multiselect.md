# Multiselect

## Description
Multiselect widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
Iterable<String>? selectedValues;
  @override
  Widget build(BuildContext context) {
    // Basic multi-select with a popup list and chips as selected items.
    // onChanged returns the new iterable of selected values.
    return MultiSelect<String>(
      itemBuilder: (context, item) {
        // Render each selected value as a chip.
        return MultiSelectChip(value: item, child: Text(item));
      },
      popup: const SelectPopup(
          items: SelectItemList(children: [
        SelectItemButton(
          value: 'Apple',
          child: Text('Apple'),
        ),
        SelectItemButton(
          value: 'Banana',
          child: Text('Banana'),
        ),
        SelectItemButton(
          value: 'Cherry',
          child: Text('Cherry'),
        ),
      ])),
      onChanged: (value) {
        setState(() {
          selectedValues = value;
        });
      },
      constraints: const BoxConstraints(
        minWidth: 200,
      ),
      value: selectedValues,
      placeholder: const Text('Select a fruit'),
    );
  }
```

## Full Example Class
```dart
class MultiSelectExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    Iterable<String>? selectedValues;
      @override
      Widget build(BuildContext context) {
        // Basic multi-select with a popup list and chips as selected items.
        // onChanged returns the new iterable of selected values.
        return MultiSelect<String>(
          itemBuilder: (context, item) {
            // Render each selected value as a chip.
            return MultiSelectChip(value: item, child: Text(item));
          },
          popup: const SelectPopup(
              items: SelectItemList(children: [
            SelectItemButton(
              value: 'Apple',
              child: Text('Apple'),
            ),
            SelectItemButton(
              value: 'Banana',
              child: Text('Banana'),
            ),
            SelectItemButton(
              value: 'Cherry',
              child: Text('Cherry'),
            ),
          ])),
          onChanged: (value) {
            setState(() {
              selectedValues = value;
            });
          },
          constraints: const BoxConstraints(
            minWidth: 200,
          ),
          value: selectedValues,
          placeholder: const Text('Select a fruit'),
        );
      }
  }
}
```

## Source
Example extracted from: `multiselect_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
