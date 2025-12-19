import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';

class AppSearchField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;
  final double? width;

  const AppSearchField({
    super.key,
    this.hintText = "Search by name, code, or serial...",
    this.onChanged,
    this.onClear,
    this.controller,
    this.width,
  });

  @override
  State<AppSearchField> createState() => _AppSearchFieldState();
}

class _AppSearchFieldState extends State<AppSearchField> {
  late final TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
    _internalController.addListener(_handleControllerChange);
  }

  @override
  void dispose() {
    _internalController.removeListener(_handleControllerChange);
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  void _handleControllerChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColorExtension.of(context);
    final theme = Theme.of(context);

    return Container(
      width:
          widget.width ??
          (MediaQuery.sizeOf(context).width > 600 ? 320 : double.infinity),
      height: 44,
      decoration: BoxDecoration(
        color: colors.backgroundLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: theme.colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Center(
        child: TextField(
          controller: _internalController,
          onChanged: widget.onChanged,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: colors.textPrimary,
            decoration: TextDecoration.none,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodySmall?.copyWith(
              color: colors.textDisabled,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
              color: colors.textDisabled,
            ),
            suffixIcon: _internalController.text.isNotEmpty
                ? GestureDetector(
                    onTap: () {
                      _internalController.clear();
                      widget.onChanged?.call('');
                      widget.onClear?.call();
                    },
                    child: Icon(
                      Icons.close_rounded,
                      size: 18,
                      color: colors.textSecondary,
                    ),
                  )
                : null,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
