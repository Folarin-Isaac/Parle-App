import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/constants.dart';

class UploadedDocumentItem extends StatelessWidget {
  final String documentName;
  final VoidCallback onView;
  final VoidCallback onDelete;

  const UploadedDocumentItem({
    super.key,
    required this.documentName,
    required this.onView,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Row(
      children: [
        // Document Name
        Expanded(
          child: Text(
            documentName,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        Gap(AppSizes.size12),

        // View Button (Filled)
        ElevatedButton(
          onPressed: onView,
          style: ElevatedButton.styleFrom(
            backgroundColor: isDarkMode
                ? AppColors.darkPrimary
                : const Color(0xFF1E5A7D), // Dark blue
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.size24,
              vertical: AppSizes.size12,
            ),
            elevation: 0,
          ),
          child: const Text(
            'View',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        Gap(AppSizes.size12),

        // Delete Button (Outlined)
        OutlinedButton(
          onPressed: onDelete,
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: isDarkMode ? AppColors.darkBorder : Colors.grey[400]!,
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.radius8),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.size24,
              vertical: AppSizes.size12,
            ),
          ),
          child: Text(
            'Delete',
            style: TextStyle(
              color: theme.textTheme.bodyMedium?.color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}