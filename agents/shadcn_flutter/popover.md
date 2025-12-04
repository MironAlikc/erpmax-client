# Popover

## Description
Popover widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
final theme = Theme.of(context);
    return PrimaryButton(
      onPressed: () {
        showPopover(
          context: context,
          // Position the popover above the button, shifted by 8px.
          alignment: Alignment.topCenter,
          offset: const Offset(0, 8),
          // Unless you have full opacity surface,
          // you should explicitly set the overlay barrier.
          overlayBarrier: OverlayBarrier(
            borderRadius: theme.borderRadiusLg,
          ),
          builder: (context) {
            return ModalContainer(
              child: SizedBox(
                width: 300,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text('Dimensions').large().medium(),
                    const Text('Set the dimensions for the layer.').muted(),
                    Form(
                      controller: FormController(),
                      // Compact grid layout for label/field rows.
                      child: const FormTableLayout(
                        rows: [
                          FormField<double>(
                            key: FormKey(#width),
                            label: Text('Width'),
                            child: TextField(
                              initialValue: '100%',
                            ),
                          ),
                          FormField<double>(
                            key: FormKey(#maxWidth),
                            label: Text('Max. Width'),
                            child: TextField(
                              initialValue: '300px',
                            ),
                          ),
                          FormField<double>(
                            key: FormKey(#height),
                            label: Text('Height'),
                            child: TextField(
                              initialValue: '25px',
                            ),
                          ),
                          FormField<double>(
                            key: FormKey(#maxHeight),
                            label: Text('Max. Height'),
                            child: TextField(
                              initialValue: 'none',
                            ),
                          ),
                        ],
                        spacing: 8,
                      ),
                    ).withPadding(vertical: 16),
                    PrimaryButton(
                      onPressed: () {
                        // Close the popover and resolve the returned future.
                        closeOverlay(context);
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          },
        ).future.then((_) {
          // Optional completion hook after the popover is dismissed.
          print('Popover closed');
        });
      },
      child: const Text('Open popover'),
    );
```

## Full Example Class
```dart
class PopoverExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
        return PrimaryButton(
          onPressed: () {
            showPopover(
              context: context,
              // Position the popover above the button, shifted by 8px.
              alignment: Alignment.topCenter,
              offset: const Offset(0, 8),
              // Unless you have full opacity surface,
              // you should explicitly set the overlay barrier.
              overlayBarrier: OverlayBarrier(
                borderRadius: theme.borderRadiusLg,
              ),
              builder: (context) {
                return ModalContainer(
                  child: SizedBox(
                    width: 300,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Dimensions').large().medium(),
                        const Text('Set the dimensions for the layer.').muted(),
                        Form(
                          controller: FormController(),
                          // Compact grid layout for label/field rows.
                          child: const FormTableLayout(
                            rows: [
                              FormField<double>(
                                key: FormKey(#width),
                                label: Text('Width'),
                                child: TextField(
                                  initialValue: '100%',
                                ),
                              ),
                              FormField<double>(
                                key: FormKey(#maxWidth),
                                label: Text('Max. Width'),
                                child: TextField(
                                  initialValue: '300px',
                                ),
                              ),
                              FormField<double>(
                                key: FormKey(#height),
                                label: Text('Height'),
                                child: TextField(
                                  initialValue: '25px',
                                ),
                              ),
                              FormField<double>(
                                key: FormKey(#maxHeight),
                                label: Text('Max. Height'),
                                child: TextField(
                                  initialValue: 'none',
                                ),
                              ),
                            ],
                            spacing: 8,
                          ),
                        ).withPadding(vertical: 16),
                        PrimaryButton(
                          onPressed: () {
                            // Close the popover and resolve the returned future.
                            closeOverlay(context);
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ).future.then((_) {
              // Optional completion hook after the popover is dismissed.
              print('Popover closed');
            });
          },
          child: const Text('Open popover'),
        );
  }
}
```

## Source
Example extracted from: `popover_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
