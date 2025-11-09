import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class EmptyNotificationState extends StatelessWidget {
  final String? message;

  const EmptyNotificationState({
    super.key,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppSizes.size40,
          horizontal: AppSizes.size24,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // Illustration Container (Speech Bubble Shape)
          Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            color: isDarkMode
                ? AppColors.darkSecondaryBackground.withValues(alpha: 0.3)
                : const Color(0xFFFFF8E1), // Light cream/yellow
            borderRadius: BorderRadius.circular(125),
          ),
          child: Center(
            child: Icon(
              Icons.self_improvement,
              size: 120,
              color: isDarkMode
                  ? AppColors.darkPrimary
                  : const Color(0xFF1E5A7D),
            ),
          ),
        ),

        Gap(AppSizes.size32),

        // Message
        Text(
          message ?? "You don't have any notification set",
        style: theme.textTheme.bodyLarge?.copyWith(
        color: theme.textTheme.bodyMedium?.color,
        ),
        textAlign: TextAlign.center,
      ),
      ],
    ),
    ),
    );
  }
}