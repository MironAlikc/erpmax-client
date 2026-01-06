import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

const List<Color> _appPalette = [
  Color(0xFF00C853),
  Color(0xFFF44336),
  Color(0xFFFFB300),
  Color(0xFF2196F3),
  Color(0xFF9C27B0),
  Color(0xFFFF5722),
  Color(0xFF607D8B),
  Color(0xFFE91E63),
  Color(0xFF00BCD4),
];

class ColorPickerPopup extends StatefulWidget {
  const ColorPickerPopup({super.key});

  @override
  State<ColorPickerPopup> createState() => _ColorPickerPopupState();
}

class _ColorPickerPopupState extends State<ColorPickerPopup> {
  Color _selectedColor = _appPalette[0];

  void _showColorPicker(BuildContext context) async {
    final theme = context.theme.appColor;

    final RenderBox button = context.findRenderObject() as RenderBox;
    final RenderBox overlay =
        Navigator.of(context).overlay!.context.findRenderObject() as RenderBox;

    final Offset buttonPosition = button.localToGlobal(
      Offset.zero,
      ancestor: overlay,
    );
    final Size buttonSize = button.size;

    final RelativeRect position = RelativeRect.fromLTRB(
      buttonPosition.dx,
      buttonPosition.dy + buttonSize.height + 4,
      overlay.size.width - buttonPosition.dx - buttonSize.width,
      overlay.size.height - buttonPosition.dy - buttonSize.height,
    );

    final Color? result = await showMenu<Color>(
      context: context,
      position: position,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
        side: BorderSide(color: theme.border, width: 1.0),
      ),
      color: theme.white,
      elevation: 8,
      constraints: const BoxConstraints(maxWidth: 400, minWidth: 368),
      items: [
        PopupMenuItem<Color>(
          enabled: false,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Wrap(
            spacing: 8,
            children: _appPalette
                .map((color) => _buildColorCircle(color))
                .toList(),
          ),
        ),
      ],
    );

    if (result != null) {
      setState(() => _selectedColor = result);
    }
  }

  Widget _buildColorCircle(Color color) {
    bool isSelected = _selectedColor == color;
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(color),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected
                ? context.theme.appColor.black
                : context.theme.appColor.white,
            width: 2,
          ),
        ),
        child: CircleAvatar(radius: 14, backgroundColor: color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColor;

    return GestureDetector(
      onTap: () => _showColorPicker(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: theme.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: theme.border, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.palette, size: 18, color: theme.textTertiary),
            const SizedBox(width: 6),
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: _selectedColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: theme.shadowColor.withValues(alpha: 0.03),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
