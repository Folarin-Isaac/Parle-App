import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/app_strings.dart';

class AppLogo extends StatelessWidget {
  final double? fontSize;
  final Color? color;

  const AppLogo({
    super.key,
    this.fontSize,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppTheme.isDarkMode(context);

    final defaultColor = isDarkMode
        ? const Color(0xFFFFFFFF)
        : const Color(0x5F333333);

    return Text(
      AppStrings.appName,
      style: TextStyle(
        fontFamily: AppStrings.pacifico,
        fontSize: fontSize ?? AppSizes.size18,
        fontWeight: FontWeight.w400,
        color: color ?? defaultColor,
      ),
    );
  }
}