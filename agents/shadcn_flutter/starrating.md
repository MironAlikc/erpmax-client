# StarRating

## Description
StarRating widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// The current rating value (supports fractional values like 1.5 for half-stars).
  double value = 1.5;
  @override
  Widget build(BuildContext context) {
    return StarRating(
      // Control the icon size used for each star.
      starSize: 32,
      value: value,
      onChanged: (value) {
        setState(() {
          // Update the rating when the user taps/drags on the stars.
          this.value = value;
        });
      },
    );
  }
```

## Full Example Class
```dart
class StarRatingExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // The current rating value (supports fractional values like 1.5 for half-stars).
      double value = 1.5;
      @override
      Widget build(BuildContext context) {
        return StarRating(
          // Control the icon size used for each star.
          starSize: 32,
          value: value,
          onChanged: (value) {
            setState(() {
              // Update the rating when the user taps/drags on the stars.
              this.value = value;
            });
          },
        );
      }
  }
}
```

## Source
Example extracted from: `star_rating_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
