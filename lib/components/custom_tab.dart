import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class CustomTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;
  final int? badgeCount;

  const CustomTab({
    super.key,
    required this.label,
    required this.isActive,
    required this.onTap,
    this.badgeCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSizes.size16,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? (isDarkMode
                ? AppColors.darkPrimary
                : const Color(0xFFFDB827)) // ✅ Yellow background when active
                : Colors.transparent, // ✅ Transparent when inactive
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  label,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                    color: isActive
                        ? (isDarkMode ? Colors.black : Colors.black87) // ✅ Dark text on yellow
                        : (isDarkMode
                        ? Colors.white70
                        : Colors.black54),
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              if (badgeCount != null && badgeCount! > 0) ...[
                SizedBox(width: AppSizes.size8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.darkPrimary
                        : const Color(0xFFFDB827),
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Center(
                    child: Text(
                      '$badgeCount',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: isDarkMode ? Colors.black : Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}