# PhoneInput

## Description
PhoneInput widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
PhoneNumber? _phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PhoneInput(
          // Preselect a country; phone parsing/formatting adapt accordingly.
          initialCountry: Country.indonesia,
          onChanged: (value) {
            setState(() {
              _phoneNumber = value;
            });
          },
        ),
        const Gap(24),
        Text(
          _phoneNumber?.value ?? '(No value)',
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class PhoneInputExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    PhoneNumber? _phoneNumber;
      @override
      Widget build(BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PhoneInput(
              // Preselect a country; phone parsing/formatting adapt accordingly.
              initialCountry: Country.indonesia,
              onChanged: (value) {
                setState(() {
                  _phoneNumber = value;
                });
              },
            ),
            const Gap(24),
            Text(
              _phoneNumber?.value ?? '(No value)',
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `phone_input_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
