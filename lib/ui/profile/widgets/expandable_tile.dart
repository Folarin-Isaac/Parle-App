import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ExpandableTile extends StatelessWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onTap;
  final Widget child;

  const ExpandableTile({
    super.key,
    required this.title,
    required this.isExpanded,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(AppSizes.size20),
            decoration: BoxDecoration(
              color: isExpanded
                  ? (isDarkMode ? AppColors.darkPrimary : AppColors.yellow1)
                  : (isDarkMode ? AppColors.darkCardBackground : const Color(0xFFFFF8E1)),
              borderRadius: BorderRadius.circular(AppSizes.radius8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: isExpanded
                        ? (isDarkMode ? Colors.black : Colors.white)
                        : theme.textTheme.titleLarge?.color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: isExpanded
                      ? (isDarkMode ? Colors.black : Colors.black)
                      : theme.iconTheme.color,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            padding: EdgeInsets.all(AppSizes.size20),
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.darkCardBackground : Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(AppSizes.radius8),
                bottomRight: Radius.circular(AppSizes.radius8),
              ),
            ),
            child: child,
          ),
      ],
    );
  }
}