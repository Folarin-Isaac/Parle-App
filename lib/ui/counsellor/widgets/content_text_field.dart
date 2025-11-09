import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ContentTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final int maxLines;
  final TextStyle? style;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;
  final bool enabled;

  const ContentTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines = 15,
    this.style,
    this.contentPadding,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        color: isDarkMode
            ? AppColors.darkSecondaryBackground
            : const Color(0xFFFFFAEC),
        borderRadius: BorderRadius.circular(AppSizes.radius8),
        border: Border.all(
          color: isDarkMode
              ? AppColors.darkBorder
              : Colors.grey[300]!,
        ),
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        enabled: enabled,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText ?? 'Enter Text',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radius8),
            borderSide: BorderSide.none,
          ),
          contentPadding: contentPadding ?? EdgeInsets.all(AppSizes.size16),
        ),
        style: style ?? theme.textTheme.bodyMedium,
      ),
    );
  }
}