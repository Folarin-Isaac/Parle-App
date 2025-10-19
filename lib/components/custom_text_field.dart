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
              color: theme.textTheme.bodySmall?.color,
            ),
            filled: false,
            contentPadding: EdgeInsets.symmetric(
              vertical: AppSizes.size12,
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: borderColor,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.error,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
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