import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final bool isPassword;
  final IconData? prefixIcon;
  final int? maxLines;
  final bool enabled;
  final bool useRoundedBorder;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.isPassword = false,
    this.prefixIcon,
    this.maxLines = 1,
    this.enabled = true,
    this.useRoundedBorder = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    final borderColor = isDarkMode
        ? AppColors.darkInputBorder
        : AppColors.lightInputBorder;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.useRoundedBorder)
          Text(
            widget.label,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 12,
              color: theme.textTheme.bodySmall?.color,
            ),
          ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscureText : false,
          style: theme.textTheme.bodyLarge,
          maxLines: widget.maxLines,
          enabled: widget.enabled,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
            ),
            filled: false,
            contentPadding: widget.useRoundedBorder
                ? EdgeInsets.all(AppSizes.size16)
                : EdgeInsets.symmetric(vertical: AppSizes.size12),

            // ✅ Conditional border styling
            border: widget.useRoundedBorder
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
              borderSide: BorderSide(color: borderColor),
            )
                : UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            enabledBorder: widget.useRoundedBorder
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
              borderSide: BorderSide(color: borderColor),
            )
                : UnderlineInputBorder(
              borderSide: BorderSide(color: borderColor),
            ),
            focusedBorder: widget.useRoundedBorder
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            )
                : UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: widget.useRoundedBorder
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
              borderSide: BorderSide(color: theme.colorScheme.error),
            )
                : UnderlineInputBorder(
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: widget.useRoundedBorder
                ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 2,
              ),
            )
                : UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 2,
              ),
            ),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
              widget.prefixIcon,
              color: theme.iconTheme.color,
            )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: theme.iconTheme.color,
                size: AppSizes.size20,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : null,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}