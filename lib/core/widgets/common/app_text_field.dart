import 'package:flutter/material.dart';
import 'package:erpmax_client/core/design/app_color_extension.dart';

class AppTextField extends StatefulWidget {
  final String? label;
  final String hintText;
  final bool isPassword;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  final bool readOnly;
  final bool enabled;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  const AppTextField({
    this.label,
    required this.hintText,
    this.isPassword = false,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.enabled = true,
    this.textInputAction,
    this.onChanged,
    this.obscureText = false,
    super.key,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late bool _isContentObscured;

  @override
  void initState() {
    super.initState();
    _isContentObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColorExtension.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: theme.textTheme.labelMedium?.copyWith(
              color: widget.enabled ? colors.textPrimary : colors.textDisabled,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
        ],
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword
              ? _isContentObscured
              : widget.obscureText,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          onTap: widget.onTap,
          readOnly: widget.readOnly,
          enabled: widget.enabled,
          onChanged: widget.onChanged,
          textInputAction: widget.textInputAction,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: widget.enabled ? colors.textPrimary : colors.textDisabled,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _isContentObscured
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: 20,
                      color: colors.textSecondary,
                    ),
                    onPressed: widget.enabled
                        ? () => setState(
                            () => _isContentObscured = !_isContentObscured,
                          )
                        : null,
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }
}
