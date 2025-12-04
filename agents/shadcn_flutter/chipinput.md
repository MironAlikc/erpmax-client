# ChipInput

## Description
ChipInput widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Current filtered suggestions for the token at the cursor.
  List<String> _suggestions = [];
  // Controller manages both chips and text entry.
  final ChipEditingController<String> _controller = ChipEditingController();
  // Static suggestion pool to match against.
  static const List<String> _availableSuggestions = [
    'hello world',
    'lorem ipsum',
    'do re mi',
    'foo bar',
    'flutter dart',
  ];

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        setState(() {
          // IMPORTANT: use textAtCursor instead of text so we only consider
          // the current token under the caret when filtering suggestions.
          var value = _controller.textAtCursor;
          if (value.isNotEmpty) {
            _suggestions = _availableSuggestions.where((element) {
              return element.startsWith(value);
            }).toList();
          } else {
            _suggestions = [];
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AutoComplete(
          // Provide suggestions to show below the input as the user types.
          suggestions: _suggestions,
          child: ChipInput<String>(
            controller: _controller,
            onChipSubmitted: (value) {
              setState(() {
                _suggestions = [];
              });
              // Transform the chip value before storing it.
              return '@$value';
            },
            chipBuilder: (context, chip) {
              return Text(chip);
            },
          ),
        ),
        gap(24),
        ListenableBuilder(
          listenable: _controller,
          builder: (context, child) {
            // Reflect the current chip list for demonstration.
            return Text('Current chips: ${_controller.chips.join(', ')}');
          },
        ),
      ],
    );
  }
```

## Full Example Class
```dart
class ChipInputExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Current filtered suggestions for the token at the cursor.
      List<String> _suggestions = [];
      // Controller manages both chips and text entry.
      final ChipEditingController<String> _controller = ChipEditingController();
      // Static suggestion pool to match against.
      static const List<String> _availableSuggestions = [
        'hello world',
        'lorem ipsum',
        'do re mi',
        'foo bar',
        'flutter dart',
      ];

      @override
      void initState() {
        super.initState();
        _controller.addListener(
          () {
            setState(() {
              // IMPORTANT: use textAtCursor instead of text so we only consider
              // the current token under the caret when filtering suggestions.
              var value = _controller.textAtCursor;
              if (value.isNotEmpty) {
                _suggestions = _availableSuggestions.where((element) {
                  return element.startsWith(value);
                }).toList();
              } else {
                _suggestions = [];
              }
            });
          },
        );
      }

      @override
      Widget build(BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoComplete(
              // Provide suggestions to show below the input as the user types.
              suggestions: _suggestions,
              child: ChipInput<String>(
                controller: _controller,
                onChipSubmitted: (value) {
                  setState(() {
                    _suggestions = [];
                  });
                  // Transform the chip value before storing it.
                  return '@$value';
                },
                chipBuilder: (context, chip) {
                  return Text(chip);
                },
              ),
            ),
            gap(24),
            ListenableBuilder(
              listenable: _controller,
              builder: (context, child) {
                // Reflect the current chip list for demonstration.
                return Text('Current chips: ${_controller.chips.join(', ')}');
              },
            ),
          ],
        );
      }
  }
}
```

## Source
Example extracted from: `chip_input_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
