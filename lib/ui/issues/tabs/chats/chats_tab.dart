import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/issues/tabs/chats/chat_list_item.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppTheme.isDarkMode(context);

    final List<Map<String, dynamic>> chats = [
      {
        'name': 'Amina Halima',
        'lastMessage': 'How can I help you today?',
        'image': 'https://example.com/avatar1.jpg',
        'unreadCount': 2,
        'isRead': false,
      },
      {
        'name': 'Amanda Uche',
        'lastMessage': 'Thank you so much',
        'image': 'https://example.com/avatar2.jpg',
        'unreadCount': 0,
        'isRead': true,
      },
    ];

    return Container(
      color: isDarkMode ? AppColors.darkSecondaryBackground : Colors.white,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.size16,
          vertical: AppSizes.size12,
        ),
        itemCount: chats.length,
        separatorBuilder: (context, index) => Divider(
          height: AppSizes.size24,
          thickness: 1,
          color: isDarkMode ? AppColors.darkBorder : Colors.grey[200],
        ),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatListItem(
            name: chat['name'],
            lastMessage: chat['lastMessage'],
            imageUrl: chat['image'],
            unreadCount: chat['unreadCount'],
            isRead: chat['isRead'],
            onTap: () {},
          );
        },
      ),
    );
  }
}