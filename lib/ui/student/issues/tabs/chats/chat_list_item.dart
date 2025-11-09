import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ChatListItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final int unreadCount;
  final bool isRead;
  final VoidCallback? onTap;

  const ChatListItem({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    this.unreadCount = 0,
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
          vertical: AppSizes.size8,
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
            if (unreadCount > 0)
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? AppColors.darkPrimary
                      : const Color(0xFFFDB827),
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: AppSizes.size20,
                  minHeight: AppSizes.size20,
                ),
                child: Center(
                  child: Text(
                    '$unreadCount',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}