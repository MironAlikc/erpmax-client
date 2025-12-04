# Steps

## Description
Steps widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return const Steps(
      // Static steps list with titles and supporting content lines.
      children: [
        StepItem(
          title: Text('Create a project'),
          content: [
            Text('Create a new project in the project manager.'),
            Text('Add the required files to the project.'),
          ],
        ),
        StepItem(
          title: Text('Add dependencies'),
          content: [
            Text('Add the required dependencies to the project.'),
          ],
        ),
        StepItem(
          title: Text('Run the project'),
          content: [
            Text('Run the project in the project manager.'),
          ],
        ),
      ],
    );
```

## Full Example Class
```dart
class StepsExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Steps(
          // Static steps list with titles and supporting content lines.
          children: [
            StepItem(
              title: Text('Create a project'),
              content: [
                Text('Create a new project in the project manager.'),
                Text('Add the required files to the project.'),
              ],
            ),
            StepItem(
              title: Text('Add dependencies'),
              content: [
                Text('Add the required dependencies to the project.'),
              ],
            ),
            StepItem(
              title: Text('Run the project'),
              content: [
                Text('Run the project in the project manager.'),
              ],
            ),
          ],
        );
  }
}
```

## Source
Example extracted from: `steps_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
