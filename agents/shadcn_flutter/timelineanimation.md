# TimelineAnimation

## Description
TimelineAnimation widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Timeline of Offset values combining absolute and relative keyframes.
  // AbsoluteKeyframe defines a start and end value over a fixed duration.
  // RelativeKeyframe appends a delta over the given duration.
  final TimelineAnimation<Offset> offsetTimeline = TimelineAnimation(
    keyframes: [
      const AbsoluteKeyframe(
        Duration(seconds: 1),
        Offset(-100, -100),
        Offset(100, -100),
      ),
      const RelativeKeyframe(
        Duration(seconds: 2),
        Offset(100, 100),
      ),
      const RelativeKeyframe(
        Duration(seconds: 1),
        Offset(-100, 100),
      ),
      const RelativeKeyframe(
        Duration(seconds: 2),
        Offset(-100, -100),
      ),
    ],
    // Provide a lerp function for Offset values.
    lerp: Transformers.typeOffset,
  );
  // A separate timeline animating rotation in radians. StillKeyframe pauses movement.
  final TimelineAnimation<double> rotationTimeline = TimelineAnimation(
    keyframes: [
      const AbsoluteKeyframe(
        Duration(seconds: 1),
        0,
        pi / 2,
      ),
      const StillKeyframe(
        Duration(seconds: 2),
      ),
      const RelativeKeyframe(
        Duration(seconds: 1),
        0,
      ),
      const StillKeyframe(
        Duration(seconds: 2),
      ),
    ],
    // Provide a lerp function for double values.
    lerp: Transformers.typeDouble,
  );

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      // Use the maximum duration across all timelines so they loop together.
      duration: timelineMaxDuration([
        offsetTimeline,
        rotationTimeline,
      ]),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          // Sample the offset timeline using the shared controller.
          offset: offsetTimeline.transformWithController(controller),
          child: Transform.rotate(
            // Sample the rotation timeline using the shared controller.
            angle: rotationTimeline.transformWithController(controller),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
```

## Full Example Class
```dart
class TimelineAnimationExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Timeline of Offset values combining absolute and relative keyframes.
      // AbsoluteKeyframe defines a start and end value over a fixed duration.
      // RelativeKeyframe appends a delta over the given duration.
      final TimelineAnimation<Offset> offsetTimeline = TimelineAnimation(
        keyframes: [
          const AbsoluteKeyframe(
            Duration(seconds: 1),
            Offset(-100, -100),
            Offset(100, -100),
          ),
          const RelativeKeyframe(
            Duration(seconds: 2),
            Offset(100, 100),
          ),
          const RelativeKeyframe(
            Duration(seconds: 1),
            Offset(-100, 100),
          ),
          const RelativeKeyframe(
            Duration(seconds: 2),
            Offset(-100, -100),
          ),
        ],
        // Provide a lerp function for Offset values.
        lerp: Transformers.typeOffset,
      );
      // A separate timeline animating rotation in radians. StillKeyframe pauses movement.
      final TimelineAnimation<double> rotationTimeline = TimelineAnimation(
        keyframes: [
          const AbsoluteKeyframe(
            Duration(seconds: 1),
            0,
            pi / 2,
          ),
          const StillKeyframe(
            Duration(seconds: 2),
          ),
          const RelativeKeyframe(
            Duration(seconds: 1),
            0,
          ),
          const StillKeyframe(
            Duration(seconds: 2),
          ),
        ],
        // Provide a lerp function for double values.
        lerp: Transformers.typeDouble,
      );

      late AnimationController controller;

      @override
      void initState() {
        super.initState();
        controller = AnimationController(
          vsync: this,
          // Use the maximum duration across all timelines so they loop together.
          duration: timelineMaxDuration([
            offsetTimeline,
            rotationTimeline,
          ]),
        )..repeat();
      }

      @override
      void dispose() {
        controller.dispose();
        super.dispose();
      }

      @override
      Widget build(BuildContext context) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Transform.translate(
              // Sample the offset timeline using the shared controller.
              offset: offsetTimeline.transformWithController(controller),
              child: Transform.rotate(
                // Sample the rotation timeline using the shared controller.
                angle: rotationTimeline.transformWithController(controller),
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
              ),
            );
          },
        );
      }
  }
}
```

## Source
Example extracted from: `timeline_animation_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
