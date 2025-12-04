# ItemPicker

## Description
ItemPicker widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return PrimaryButton(
      onPressed: () {
        // Show a popover item picker (non-dialog) with a virtual list of 1000 items.
        showItemPicker<int>(
          context,
          title: const Text('Pick an item'),
          items: ItemBuilder(
            itemCount: 1000,
            itemBuilder: (index) {
              return index;
            },
          ),
          builder: (context, item) {
            return ItemPickerOption(
                value: item, child: Text(item.toString()).large);
          },
        ).then(
          (value) {
            if (value != null) {
              // Feedback via toast when a selection is made.
              showToast(
                context: context,
                builder: (context, overlay) {
                  return SurfaceCard(
                    child: Text('You picked $value!'),
                  );
                },
              );
            } else {
              showToast(
                context: context,
                builder: (context, overlay) {
                  return const SurfaceCard(
                    child: Text('You picked nothing!'),
                  );
                },
              );
            }
          },
        );
      },
      child: const Text('Show Item Picker'),
    );
```

## Full Example Class
```dart
class ItemPickerExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
          onPressed: () {
            // Show a popover item picker (non-dialog) with a virtual list of 1000 items.
            showItemPicker<int>(
              context,
              title: const Text('Pick an item'),
              items: ItemBuilder(
                itemCount: 1000,
                itemBuilder: (index) {
                  return index;
                },
              ),
              builder: (context, item) {
                return ItemPickerOption(
                    value: item, child: Text(item.toString()).large);
              },
            ).then(
              (value) {
                if (value != null) {
                  // Feedback via toast when a selection is made.
                  showToast(
                    context: context,
                    builder: (context, overlay) {
                      return SurfaceCard(
                        child: Text('You picked $value!'),
                      );
                    },
                  );
                } else {
                  showToast(
                    context: context,
                    builder: (context, overlay) {
                      return const SurfaceCard(
                        child: Text('You picked nothing!'),
                      );
                    },
                  );
                }
              },
            );
          },
          child: const Text('Show Item Picker'),
        );
  }
}
```

## Source
Example extracted from: `item_picker_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
