import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class FileSelectionField extends StatelessWidget {
  final String? selectedFileName;
  final String placeholderText;
  final String buttonText;
  final VoidCallback? onSelectFile;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;

  const FileSelectionField({
    super.key,
    this.selectedFileName,
    this.placeholderText = 'Select file',
    this.buttonText = 'Select File',
    this.onSelectFile,
    this.enabled = true,
    this.padding,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Container(
      padding: padding ?? EdgeInsets.all(AppSizes.size16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isDarkMode
              ? AppColors.darkBorder
              : Colors.grey[300]!,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(AppSizes.radius8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              selectedFileName ?? placeholderText,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: selectedFileName != null
                    ? theme.textTheme.bodyMedium?.color
                    : theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Gap(AppSizes.size12),
          OutlinedButton(
            onPressed: enabled ? onSelectFile : null,
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: enabled
                    ? (isDarkMode
                    ? AppColors.darkPrimary
                    : const Color(0xFFFDB827))
                    : (isDarkMode
                    ? AppColors.darkBorder
                    : Colors.grey[400]!),
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radius8),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSizes.size20,
                vertical: AppSizes.size10,
              ),
            ),
            child: Text(
              buttonText,
              style: TextStyle(
                color: enabled
                    ? (isDarkMode
                    ? AppColors.darkPrimary
                    : const Color(0xFFFDB827))
                    : (isDarkMode
                    ? AppColors.darkBorder
                    : Colors.grey[400]!),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}