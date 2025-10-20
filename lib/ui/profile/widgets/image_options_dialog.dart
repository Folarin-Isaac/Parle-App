import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ImageOptionsDialog extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback onSelectFromGallery;

  const ImageOptionsDialog({
    super.key,
    required this.onRemove,
    required this.onSelectFromGallery,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              onRemove();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.size15),
              child: Text(
                'Remove Image',
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppSizes.size15, right: AppSizes.size15),
            child: Divider(
              height: 0.3,
              color: theme.dividerColor.withAlpha(179),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              onSelectFromGallery();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(AppSizes.size15),
              child: Text(
                'Select Image from Gallery',
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ),
        ],
      ),
    );
  }
}