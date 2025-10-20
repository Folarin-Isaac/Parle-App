import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ArticleListCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final VoidCallback? onTap;

  const ArticleListCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: AppSizes.size16),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkCardBackground : Colors.white,
          borderRadius: BorderRadius.circular(AppSizes.radius12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSizes.radius12),
                topRight: Radius.circular(AppSizes.radius12),
              ),
              child: Image.network(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 180,
                    width: double.infinity,
                    color: isDarkMode ? AppColors.darkCardBackground : Colors.grey[300],
                    child: Icon(
                      Icons.image,
                      size: 60,
                      color: isDarkMode ? AppColors.darkTextSecondary : Colors.grey[600],
                    ),
                  );
                },
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(AppSizes.size16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(AppSizes.size8),
                  Text(
                    'By $author',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}