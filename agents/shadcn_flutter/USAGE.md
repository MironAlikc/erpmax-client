# How to Use shadcn_flutter Documentation in Prompts

## For AI Assistants

When working with shadcn_flutter widgets, reference this documentation to get accurate, minimal examples.

### Quick Reference Format

```
@file:./agents/shadcn_flutter/{widget_name}.md
```

### Example Prompts

1. **Creating a new widget:**
   ```
   Create a dialog using the example from ./agents/shadcn_flutter/dialog.md
   but modify it to show user confirmation
   ```

2. **Fixing existing code:**
   ```
   I have a Select widget that's not working. 
   Check ./agents/shadcn_flutter/select.md for the correct implementation
   ```

3. **Learning widget API:**
   ```
   Show me how to use DatePicker with custom validation.
   Reference: ./agents/shadcn_flutter/datepicker.md
   ```

## For Developers

### Direct File Access

All examples are in: `./agents/shadcn_flutter/`

- **README.md** - Index of all widgets
- **{widget}.md** - Individual widget documentation

### Integration with Tools

#### 1. VS Code Copilot
Add to `.vscode/settings.json`:
```json
{
  "github.copilot.advanced": {
    "contextFiles": [
      "agents/shadcn_flutter/**/*.md"
    ]
  }
}
```

#### 2. Cursor AI
Reference files with `@`:
```
@agents/shadcn_flutter/button.md create a primary button
```

#### 3. Windsurf/Cascade
Use file paths in requests:
```
Read ./agents/shadcn_flutter/form.md and implement a login form
```

## Widget Categories

### Form Controls
- `input.md` - Text input
- `select.md` - Dropdown selection
- `checkbox.md` - Checkboxes
- `switch.md` - Toggle switches
- `datepicker.md` - Date selection
- `textarea.md` - Multi-line text

### Layout
- `card.md` - Content containers
- `dialog.md` - Modal dialogs
- `sheet.md` - Bottom sheets
- `accordion.md` - Collapsible sections
- `tabs.md` - Tab navigation

### Feedback
- `alert.md` - Alert messages
- `toast.md` - Toast notifications
- `progress.md` - Progress indicators
- `skeleton.md` - Loading skeletons

### Navigation
- `navigationmenu.md` - Navigation menus
- `breadcrumb.md` - Breadcrumb navigation
- `pagination.md` - Page navigation

### Data Display
- `table.md` - Data tables
- `avatar.md` - User avatars
- `badge.md` - Status badges
- `timeline.md` - Timeline view

## Best Practices

### 1. Always Check Examples First
Before implementing a widget, read the corresponding .md file to see:
- Required imports
- Minimal working example
- Common patterns

### 2. Combine Examples
You can combine multiple widgets:
```
Use Card from card.md as container, 
Input from input.md for fields,
and Button from button.md for actions
```

### 3. Adapt to Your Needs
Examples are minimal - extend them with:
- Custom styling
- Validation logic
- State management
- Error handling

### 4. Reference in Code Comments
```dart
// Implementation based on: ./agents/shadcn_flutter/select.md
Select<String>(
  itemBuilder: (context, item) => Text(item),
  // ...
)
```

## Common Patterns

### Form with Validation
Combine: `form.md` + `input.md` + `button.md`

### Data Table with Pagination
Combine: `table.md` + `pagination.md`

### Modal with Form
Combine: `dialog.md` + `form.md` + `input.md`

### Navigation Layout
Combine: `scaffold.md` + `navigationmenu.md` + `appbar.md`

## Troubleshooting

If a widget doesn't work as expected:

1. **Check the source file** - Compare your code with the example
2. **Verify imports** - Ensure `import 'package:shadcn_flutter/shadcn_flutter.dart';`
3. **Check widget type** - StatelessWidget vs StatefulWidget
4. **Review full example** - See the complete class implementation

## Updates

To update this documentation:
```bash
python3 extract_shadcn_examples.py
```

This will regenerate all .md files from the latest shadcn_flutter examples.
