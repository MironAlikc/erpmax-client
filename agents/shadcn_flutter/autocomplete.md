# Autocomplete

## Description
Autocomplete widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
// Source data for suggestions.
  final List<String> suggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Grape',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Pineapple',
    'Strawberry',
    'Watermelon',
  ];

  // Filtered suggestions for the current input word.
  List<String> _currentSuggestions = [];
  // Controller for reading the current text and word at the caret.
  final TextEditingController _controller = TextEditingController();

  // Update the filtered suggestions based on the current word being typed.
  void _updateSuggestions(String value) {
    String? currentWord = _controller.currentWord;
    if (currentWord == null || currentWord.isEmpty) {
      setState(() {
        _currentSuggestions = [];
      });
      return;
    }
    setState(() {
      _currentSuggestions = suggestions
          .where((element) =>
              element.toLowerCase().contains(currentWord.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AutoComplete(
      // Provide the list to be shown in the overlay.
      suggestions: _currentSuggestions,
      child: TextField(
        controller: _controller,
        // Each keystroke recalculates the suggestions.
        onChanged: _updateSuggestions,
        features: const [
          InputFeature.clear(),
        ],
      ),
    );
  }
```

## Full Example Class
```dart
class AutoCompleteExample1 extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    // Source data for suggestions.
      final List<String> suggestions = [
        'Apple',
        'Banana',
        'Cherry',
        'Date',
        'Grape',
        'Kiwi',
        'Lemon',
        'Mango',
        'Orange',
        'Peach',
        'Pear',
        'Pineapple',
        'Strawberry',
        'Watermelon',
      ];

      // Filtered suggestions for the current input word.
      List<String> _currentSuggestions = [];
      // Controller for reading the current text and word at the caret.
      final TextEditingController _controller = TextEditingController();

      // Update the filtered suggestions based on the current word being typed.
      void _updateSuggestions(String value) {
        String? currentWord = _controller.currentWord;
        if (currentWord == null || currentWord.isEmpty) {
          setState(() {
            _currentSuggestions = [];
          });
          return;
        }
        setState(() {
          _currentSuggestions = suggestions
              .where((element) =>
                  element.toLowerCase().contains(currentWord.toLowerCase()))
              .toList();
        });
      }

      @override
      Widget build(BuildContext context) {
        return AutoComplete(
          // Provide the list to be shown in the overlay.
          suggestions: _currentSuggestions,
          child: TextField(
            controller: _controller,
            // Each keystroke recalculates the suggestions.
            onChanged: _updateSuggestions,
            features: const [
              InputFeature.clear(),
            ],
          ),
        );
      }
  }
}
```

## Source
Example extracted from: `autocomplete_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
