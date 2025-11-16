import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class NotificationCard extends StatelessWidget {
  final String category;
  final String title;
  final String? date;
  final String? time;
  final VoidCallback? onTap;

  const NotificationCard({
    super.key,
    required this.category,
    required this.title,
    this.date,
    this.time,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSizes.size16),
        decoration: BoxDecoration(
          color: isDarkMode
              ? AppColors.darkSecondaryBackground
              : const Color(0xFFFFF4E0), // Light beige/cream
          borderRadius: BorderRadius.circular(AppSizes.radius8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category
            Text(
              category.toUpperCase(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: isDarkMode
                    ? AppColors.darkPrimary
                    : const Color(0xFFD4A574), // Gold/brown color
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            Gap(AppSizes.size8),
            // Title
            Text(
              title,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            if (date != null || time != null) ...[
              Gap(AppSizes.size8),
              // Date and Time
              Row(
                children: [
                  if (date != null)
                    Text(
                      date!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                  if (date != null && time != null)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.size8),
                      child: Text(
                        '•',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                    ),
                  if (time != null)
                    Text(
                      time!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.textTheme.bodySmall?.color,
                      ),
                    ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}