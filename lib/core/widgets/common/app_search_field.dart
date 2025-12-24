import 'package:erpmax_client/core/theme/app_theme.dart';
import 'package:erpmax_client/core/theme/text_style_source.dart';
import 'package:flutter/material.dart';

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
    final theme = context.theme.appColor;

    return Container(
      width:
          widget.width ??
          (MediaQuery.sizeOf(context).width > 600 ? 320 : double.infinity),
      height: 44,
      decoration: BoxDecoration(
        color: theme.bgLight,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: theme.borderLight.withValues(alpha: 0.2)),
      ),
      child: Center(
        child: TextField(
          controller: _internalController,
          onChanged: widget.onChanged,
          style: AppTextStyles.bodyMedium.copyWith(
            color: theme.textPrimary,
            decoration: TextDecoration.none,
          ),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.bodySmall.copyWith(
              color: theme.textDisabled,
            ),
            prefixIcon: Icon(
              Icons.search_rounded,
              size: 20,
              color: theme.textDisabled,
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
                      color: theme.textSecondary,
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
