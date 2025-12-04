# ColorPicker

## Description
ColorPicker widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
ColorDerivative color = ColorDerivative.fromColor(Colors.blue);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 32,
            height: 32,
            child: ColorInput(
              // A compact square color input that opens a popover prompt.
              color: color,
              mode: PromptMode.popover,
              onChanged: (value) {
                setState(() {
                  color = value;
                });
              },
              // Tracks color history across the app via inherited storage.
              storage: ColorHistoryStorage.of(context),
            ),
          ),
          const Gap(16),
          ColorInput(
            color: color,
            // Full dialog mode with a title.
            mode: PromptMode.dialog,
            dialogTitle: const Text('Select Color'),
            onChanged: (value) {
              setState(() {
                color = value;
              });
            },
            // Show the textual label/hex alongside the swatch.
            showLabel: true,
            storage: ColorHistoryStorage.of(context),
          ),
        ],
      ),
    );
  }
```

## Full Example Class
```dart
class ColorPickerExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    ColorDerivative color = ColorDerivative.fromColor(Colors.blue);
      @override
      Widget build(BuildContext context) {
        return SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 32,
                height: 32,
                child: ColorInput(
                  // A compact square color input that opens a popover prompt.
                  color: color,
                  mode: PromptMode.popover,
                  onChanged: (value) {
                    setState(() {
                      color = value;
                    });
                  },
                  // Tracks color history across the app via inherited storage.
                  storage: ColorHistoryStorage.of(context),
                ),
              ),
              const Gap(16),
              ColorInput(
                color: color,
                // Full dialog mode with a title.
                mode: PromptMode.dialog,
                dialogTitle: const Text('Select Color'),
                onChanged: (value) {
                  setState(() {
                    color = value;
                  });
                },
                // Show the textual label/hex alongside the swatch.
                showLabel: true,
                storage: ColorHistoryStorage.of(context),
              ),
            ],
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `color_picker_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
