import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/app_logo.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/common/notifications/widgets/empty_notification_state.dart';
import 'package:parle_app/ui/common/notifications/widgets/notification_card.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    final List<Map<String, dynamic>> notifications = [
      {
        'category': 'REMINDER!',
        'title': 'Next Meeting with Amina',
        'date': '10/11/2020',
        'time': '9:45 a.m.',
      },
      {
        'category': 'RATING!',
        'title': 'Rate meeting with Amanda',
        'date': null,
        'time': null,
      },
    ];

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkBackground
          : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSizes.size24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLogo(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: notifications.isEmpty
                  ? _buildEmptyState(context)
                  : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.size24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification',
                        style: theme.textTheme.displaySmall,
                      ),
                      Gap(AppSizes.size24),
                      if (notifications.isEmpty)
                        const EmptyNotificationState()
                      else ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: notifications.length,
                        separatorBuilder: (context, index) =>
                            Gap(AppSizes.size16),
                        itemBuilder: (context, index) {
                          final notification = notifications[index];
                          return NotificationCard(
                            category: notification['category'],
                            title: notification['title'],
                            date: notification['date'],
                            time: notification['time'],
                            onTap: () {},
                          );
                        },
                      ),

                      Gap(AppSizes.size24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.size24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_outlined,
              size: 80,
              color: theme.iconTheme.color?.withValues(alpha: 0.3),
            ),
            Gap(AppSizes.size16),
            Text(
              'No Notifications',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(AppSizes.size8),
            Text(
              'You have no notifications at the moment',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}