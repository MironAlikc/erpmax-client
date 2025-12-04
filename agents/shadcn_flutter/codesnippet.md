# CodeSnippet

## Description
CodeSnippet widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return const CodeSnippet(
      code: 'flutter pub get',
      mode: 'shell',
    );
```

## Full Example Class
```dart
class CodeSnippetExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CodeSnippet(
          code: 'flutter pub get',
          mode: 'shell',
        );
  }
}
```

## Source
Example extracted from: `code_snippet_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
