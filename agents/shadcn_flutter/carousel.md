# Carousel

## Description
Carousel widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Row(
        children: [
          OutlineButton(
              shape: ButtonShape.circle,
              onPressed: () {
                // Animate to previous slide.
                controller.animatePrevious(const Duration(milliseconds: 500));
              },
              child: const Icon(Icons.arrow_back)),
          const Gap(24),
          Expanded(
            child: SizedBox(
              height: 200,
              child: Carousel(
                // frameTransform: Carousel.fadingTransform,
                // Slide items with a 24px gap.
                transition: const CarouselTransition.sliding(gap: 24),
                controller: controller,
                // Each item has a fixed dimension of 200.
                sizeConstraint: const CarouselFixedConstraint(200),
                // Automatically advance every 2 seconds.
                autoplaySpeed: const Duration(seconds: 2),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return NumberedContainer(index: index);
                },
                // Duration of the slide transition animation.
                duration: const Duration(seconds: 1),
              ),
            ),
          ),
          const Gap(24),
          OutlineButton(
              shape: ButtonShape.circle,
              onPressed: () {
                // Animate to next slide.
                controller.animateNext(const Duration(milliseconds: 500));
              },
              child: const Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
```

## Full Example Class
```dart
class CarouselExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();
      @override
      Widget build(BuildContext context) {
        return SizedBox(
          width: 800,
          child: Row(
            children: [
              OutlineButton(
                  shape: ButtonShape.circle,
                  onPressed: () {
                    // Animate to previous slide.
                    controller.animatePrevious(const Duration(milliseconds: 500));
                  },
                  child: const Icon(Icons.arrow_back)),
              const Gap(24),
              Expanded(
                child: SizedBox(
                  height: 200,
                  child: Carousel(
                    // frameTransform: Carousel.fadingTransform,
                    // Slide items with a 24px gap.
                    transition: const CarouselTransition.sliding(gap: 24),
                    controller: controller,
                    // Each item has a fixed dimension of 200.
                    sizeConstraint: const CarouselFixedConstraint(200),
                    // Automatically advance every 2 seconds.
                    autoplaySpeed: const Duration(seconds: 2),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return NumberedContainer(index: index);
                    },
                    // Duration of the slide transition animation.
                    duration: const Duration(seconds: 1),
                  ),
                ),
              ),
              const Gap(24),
              OutlineButton(
                  shape: ButtonShape.circle,
                  onPressed: () {
                    // Animate to next slide.
                    controller.animateNext(const Duration(milliseconds: 500));
                  },
                  child: const Icon(Icons.arrow_forward)),
            ],
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `carousel_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
