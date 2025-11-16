import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String confirmText;
  final String cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  const ConfirmationDialog({
    super.key,
    required this.title,
    this.confirmText = 'Yes',
    this.cancelText = 'No',
    required this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Dialog(
       shape: RoundedRectangleBorder(),
      backgroundColor: isDarkMode
          ? AppColors.darkCardBackground
          : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(AppSizes.size32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(AppSizes.size32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (onCancel != null) {
                        onCancel!();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? AppColors.darkPrimary
                          : const Color(0xFFFDB827),
                      foregroundColor: isDarkMode
                          ? Colors.black
                          : Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.size16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radius8),
                      ),
                    ),
                    child: Text(
                      cancelText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Gap(AppSizes.size16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onConfirm();
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: isDarkMode
                          ? AppColors.darkPrimary
                          : const Color(0xFFFDB827),
                      side: BorderSide(
                        color: isDarkMode
                            ? AppColors.darkPrimary
                            : const Color(0xFFFDB827),
                        width: 2,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: AppSizes.size16,
                      ),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(AppSizes.radius8),
                       ),
                    ),
                    child: Text(
                      confirmText,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isDarkMode
                            ? AppColors.darkPrimary
                            : const Color(0xFFFDB827),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}