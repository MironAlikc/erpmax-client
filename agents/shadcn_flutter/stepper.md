# Stepper

## Description
Stepper widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
final StepperController controller = StepperController();

  @override
  Widget build(BuildContext context) {
    return Stepper(
      controller: controller,
      // Vertical layout with 3 steps and Next/Prev actions.
      direction: Axis.vertical,
      steps: [
        Step(
          title: const Text('Step 1'),
          contentBuilder: (context) {
            return StepContainer(
              actions: [
                const SecondaryButton(
                  child: Text('Prev'),
                ),
                PrimaryButton(
                    child: const Text('Next'),
                    onPressed: () {
                      // Advance to the next step.
                      controller.nextStep();
                    }),
              ],
              child: const NumberedContainer(
                index: 1,
                height: 200,
              ),
            );
          },
        ),
        Step(
          title: const Text('Step 2'),
          contentBuilder: (context) {
            return StepContainer(
              actions: [
                SecondaryButton(
                  child: const Text('Prev'),
                  onPressed: () {
                    // Move back one step.
                    controller.previousStep();
                  },
                ),
                PrimaryButton(
                    child: const Text('Next'),
                    onPressed: () {
                      controller.nextStep();
                    }),
              ],
              child: const NumberedContainer(
                index: 2,
                height: 200,
              ),
            );
          },
        ),
        Step(
          title: const Text('Step 3'),
          contentBuilder: (context) {
            return StepContainer(
              actions: [
                SecondaryButton(
                  child: const Text('Prev'),
                  onPressed: () {
                    controller.previousStep();
                  },
                ),
                PrimaryButton(
                    child: const Text('Finish'),
                    onPressed: () {
                      controller.nextStep();
                    }),
              ],
              child: const NumberedContainer(
                index: 3,
                height: 200,
              ),
            );
          },
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class StepperExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    final StepperController controller = StepperController();

      @override
      Widget build(BuildContext context) {
        return Stepper(
          controller: controller,
          // Vertical layout with 3 steps and Next/Prev actions.
          direction: Axis.vertical,
          steps: [
            Step(
              title: const Text('Step 1'),
              contentBuilder: (context) {
                return StepContainer(
                  actions: [
                    const SecondaryButton(
                      child: Text('Prev'),
                    ),
                    PrimaryButton(
                        child: const Text('Next'),
                        onPressed: () {
                          // Advance to the next step.
                          controller.nextStep();
                        }),
                  ],
                  child: const NumberedContainer(
                    index: 1,
                    height: 200,
                  ),
                );
              },
            ),
            Step(
              title: const Text('Step 2'),
              contentBuilder: (context) {
                return StepContainer(
                  actions: [
                    SecondaryButton(
                      child: const Text('Prev'),
                      onPressed: () {
                        // Move back one step.
                        controller.previousStep();
                      },
                    ),
                    PrimaryButton(
                        child: const Text('Next'),
                        onPressed: () {
                          controller.nextStep();
                        }),
                  ],
                  child: const NumberedContainer(
                    index: 2,
                    height: 200,
                  ),
                );
              },
            ),
            Step(
              title: const Text('Step 3'),
              contentBuilder: (context) {
                return StepContainer(
                  actions: [
                    SecondaryButton(
                      child: const Text('Prev'),
                      onPressed: () {
                        controller.previousStep();
                      },
                    ),
                    PrimaryButton(
                        child: const Text('Finish'),
                        onPressed: () {
                          controller.nextStep();
                        }),
                  ],
                  child: const NumberedContainer(
                    index: 3,
                    height: 200,
                  ),
                );
              },
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `stepper_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
