import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';

class CircularBadge extends StatelessWidget {
  final String text;
  final double? size;
  final Color? backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final double? minWidth;
  final double? minHeight;

  const CircularBadge({
    super.key,
    required this.text,
    this.size,
    this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.minWidth,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppTheme.isDarkMode(context);

    final effectiveBackgroundColor = backgroundColor ??
        (isDarkMode ? AppColors.darkPrimary : AppColors.lightPrimary);

    final effectiveTextColor = textColor ??
        (isDarkMode ? Colors.black : Colors.white);

    return Container(
      padding: padding ?? const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        shape: BoxShape.circle,
      ),
      constraints: BoxConstraints(
        minWidth: minWidth ?? size ?? 20,
        minHeight: minHeight ?? size ?? 20,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize ?? 11,
            fontWeight: fontWeight ?? FontWeight.w700,
            color: effectiveTextColor,
          ),
        ),
      ),
    );
  }
}