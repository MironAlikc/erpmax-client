# Dialog

## Description
Dialog widget from shadcn_flutter library.

## Basic Usage

### Imports
```dart
import 'package:shadcn_flutter/shadcn_flutter.dart';
```

### Minimal Example
```dart
return PrimaryButton(
      onPressed: () {
        // Present a Material dialog on top of the current route.
        showDialog(
          context: context,
          builder: (context) {
            final FormController controller = FormController();
            return AlertDialog(
              title: const Text('Edit profile'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Make changes to your profile here. Click save when you\'re done'),
                  const Gap(16),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Form(
                      controller: controller,
                      child: const FormTableLayout(rows: [
                        FormField<String>(
                          key: FormKey(#name),
                          label: Text('Name'),
                          child: TextField(
                            initialValue: 'Thito Yalasatria Sunarya',
                            autofocus: true,
                          ),
                        ),
                        FormField<String>(
                          key: FormKey(#username),
                          label: Text('Username'),
                          child: TextField(
                            initialValue: '@sunaryathito',
                          ),
                        ),
                      ]),
                    ).withPadding(vertical: 16),
                  ),
                ],
              ),
              actions: [
                PrimaryButton(
                  child: const Text('Save changes'),
                  onPressed: () {
                    // Return the form values and close the dialog.
                    Navigator.of(context).pop(controller.values);
                  },
                ),
              ],
            );
          },
        );
      },
      child: const Text('Edit Profile'),
    );
```

## Full Example Class
```dart
class DialogExample1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
          onPressed: () {
            // Present a Material dialog on top of the current route.
            showDialog(
              context: context,
              builder: (context) {
                final FormController controller = FormController();
                return AlertDialog(
                  title: const Text('Edit profile'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                          'Make changes to your profile here. Click save when you\'re done'),
                      const Gap(16),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 400),
                        child: Form(
                          controller: controller,
                          child: const FormTableLayout(rows: [
                            FormField<String>(
                              key: FormKey(#name),
                              label: Text('Name'),
                              child: TextField(
                                initialValue: 'Thito Yalasatria Sunarya',
                                autofocus: true,
                              ),
                            ),
                            FormField<String>(
                              key: FormKey(#username),
                              label: Text('Username'),
                              child: TextField(
                                initialValue: '@sunaryathito',
                              ),
                            ),
                          ]),
                        ).withPadding(vertical: 16),
                      ),
                    ],
                  ),
                  actions: [
                    PrimaryButton(
                      child: const Text('Save changes'),
                      onPressed: () {
                        // Return the form values and close the dialog.
                        Navigator.of(context).pop(controller.values);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: const Text('Edit Profile'),
        );
  }
}
```

## Source
Example extracted from: `dialog_example_1.dart`

## Additional Resources
- [shadcn_flutter Documentation](https://github.com/sunarya-thito/shadcn_flutter)
- [Official Examples](https://github.com/sunarya-thito/shadcn_flutter/tree/main/docs/lib/pages/docs/components)
