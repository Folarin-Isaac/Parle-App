import 'package:flutter/material.dart';
import 'package:parle_app/components/app_logo.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/common/notifications/notification_screen.dart';

class AppHeader extends StatelessWidget {
  final bool showNotification;
  final VoidCallback? onNotificationTap;

  const AppHeader({
    super.key,
    this.showNotification = true,
    this.onNotificationTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(AppSizes.size24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AppLogo(),
          if (showNotification)
            IconButton(
              onPressed: onNotificationTap ??
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationScreen(),
                      ),
                    );
                  },
              icon: Icon(
                Icons.notifications_outlined,
                color: theme.iconTheme.color,
              ),
            ),
        ],
      ),
    );
  }
}