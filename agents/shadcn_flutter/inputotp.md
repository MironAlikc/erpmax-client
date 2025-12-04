# InputOtp

## Description
InputOtp widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
String value = '';
  String? submittedValue;
  @override
  Widget build(BuildContext context) {
    // Basic OTP input with onChanged and onSubmitted callbacks.
    // The example groups 3 digits, a visual separator, then 3 more digits.
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InputOTP(
          onChanged: (value) {
            setState(() {
              this.value = value.otpToString();
            });
          },
          onSubmitted: (value) {
            setState(() {
              submittedValue = value.otpToString();
            });
          },
          children: [
            // Each character cell allows digits. The separator is a visual divider only.
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.separator,
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
            InputOTPChild.character(allowDigit: true),
          ],
        ),
        gap(16),
        Text('Value: $value'),
        Text('Submitted Value: $submittedValue'),
      ],
    );
  }
```

## Full Example Class
```dart
class InputOTPExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    String value = '';
      String? submittedValue;
      @override
      Widget build(BuildContext context) {
        // Basic OTP input with onChanged and onSubmitted callbacks.
        // The example groups 3 digits, a visual separator, then 3 more digits.
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputOTP(
              onChanged: (value) {
                setState(() {
                  this.value = value.otpToString();
                });
              },
              onSubmitted: (value) {
                setState(() {
                  submittedValue = value.otpToString();
                });
              },
              children: [
                // Each character cell allows digits. The separator is a visual divider only.
                InputOTPChild.character(allowDigit: true),
                InputOTPChild.character(allowDigit: true),
                InputOTPChild.character(allowDigit: true),
                InputOTPChild.separator,
                InputOTPChild.character(allowDigit: true),
                InputOTPChild.character(allowDigit: true),
                InputOTPChild.character(allowDigit: true),
              ],
            ),
            gap(16),
            Text('Value: $value'),
            Text('Submitted Value: $submittedValue'),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `input_otp_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
