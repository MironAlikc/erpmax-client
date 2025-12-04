# CardImage

## Description
CardImage widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < 10; i++)
                CardImage(
                  // Simple interaction: open a dialog on tap.
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Card Image'),
                          content: const Text('You clicked on a card image.'),
                          actions: [
                            PrimaryButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  // Network image; replace with your own provider as needed.
                  image: Image.network(
                    'https://picsum.photos/200/300',
                  ),
                  // Title and subtitle appear over the image.
                  title: Text('Card Number ${i + 1}'),
                  subtitle: const Text('Lorem ipsum dolor sit amet'),
                ),
            ],
          ).gap(8),
        ),
      ),
    );
```

## Full Example Class
```dart
class CardImageExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < 10; i++)
                    CardImage(
                      // Simple interaction: open a dialog on tap.
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Card Image'),
                              content: const Text('You clicked on a card image.'),
                              actions: [
                                PrimaryButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      // Network image; replace with your own provider as needed.
                      image: Image.network(
                        'https://picsum.photos/200/300',
                      ),
                      // Title and subtitle appear over the image.
                      title: Text('Card Number ${i + 1}'),
                      subtitle: const Text('Lorem ipsum dolor sit amet'),
                    ),
                ],
              ).gap(8),
            ),
          ),
        );
  }
}
```

## Source
Example extracted from: `card_image_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
