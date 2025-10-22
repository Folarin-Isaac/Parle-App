import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final bool hasNotification;
  final bool isRead;
  final VoidCallback? onTap;

  const ChatListItem({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    this.hasNotification = false,
    this.isRead = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radius8),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.size8,
          vertical: AppSizes.size12,
        ),
        child: Row(
          children: [
            // Profile Picture
            CircleAvatar(
              radius: 24,
              backgroundColor: isDarkMode
                  ? AppColors.darkCardBackground
                  : Colors.grey[300],
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.person_outline,
                      size: 24,
                      color: isDarkMode
                          ? AppColors.darkTextSecondary
                          : Colors.grey[600],
                    );
                  },
                ),
              ),
            ),

            Gap(AppSizes.size12),

            // Name and Message
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(AppSizes.size4),
                  Row(
                    children: [
                      if (isRead)
                        Padding(
                          padding: EdgeInsets.only(right: AppSizes.size4),
                          child: Icon(
                            Icons.done_all,
                            size: 16,
                            color: isDarkMode
                                ? AppColors.darkPrimary
                                : const Color(0xFFFDB827),
                          ),
                        ),
                      Expanded(
                        child: Text(
                          lastMessage,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.textTheme.bodySmall?.color
                                ?.withValues(alpha: 0.7),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Notification Badge
            if (hasNotification)
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkPrimary
                      : const Color(0xFFFDB827),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}