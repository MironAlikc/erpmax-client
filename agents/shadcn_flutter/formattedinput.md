# FormattedInput

## Description
FormattedInput widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return FormattedInput(
      // Demonstrates a date-like formatted input built from editable and static parts.
      onChanged: (value) {
        List<String> parts = [];
        for (FormattedValuePart part in value.values) {
          parts.add(part.value ?? '');
        }
        print(parts.join('/'));
      },
      initialValue: FormattedValue([
        const InputPart.editable(length: 2, width: 40, placeholder: Text('MM'))
            .withValue('01'),
        const InputPart.static('/'),
        const InputPart.editable(length: 2, width: 40, placeholder: Text('DD'))
            .withValue('02'),
        const InputPart.static('/'),
        const InputPart.editable(
                length: 4, width: 60, placeholder: Text('YYYY'))
            .withValue('2021'),
      ]),
    );
```

## Full Example Class
```dart
class FormattedInputExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormattedInput(
          // Demonstrates a date-like formatted input built from editable and static parts.
          onChanged: (value) {
            List<String> parts = [];
            for (FormattedValuePart part in value.values) {
              parts.add(part.value ?? '');
            }
            print(parts.join('/'));
          },
          initialValue: FormattedValue([
            const InputPart.editable(length: 2, width: 40, placeholder: Text('MM'))
                .withValue('01'),
            const InputPart.static('/'),
            const InputPart.editable(length: 2, width: 40, placeholder: Text('DD'))
                .withValue('02'),
            const InputPart.static('/'),
            const InputPart.editable(
                    length: 4, width: 60, placeholder: Text('YYYY'))
                .withValue('2021'),
          ]),
        );
  }
}
```

## Source
Example extracted from: `formatted_input_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
