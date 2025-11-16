import 'package:flutter/material.dart';
import 'package:parle_app/ui/common/auth/pin_security_screen.dart';
import 'package:parle_app/ui/common/auth/auth.dart';
import 'package:parle_app/ui/utils/topics_data.dart';

class TopicSelectionScreen extends StatefulWidget {
  const TopicSelectionScreen({super.key});

  @override
  State<TopicSelectionScreen> createState() => _TopicSelectionScreenState();
}

class _TopicSelectionScreenState extends State<TopicSelectionScreen> {
  final Set<String> _selectedTopics = {};

  void _toggleTopic(String topic) {
    setState(() {
      if (_selectedTopics.contains(topic)) {
        _selectedTopics.remove(topic);
      } else {
        _selectedTopics.add(topic);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.size24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppSizes.size24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.whatWouldYouLike,
                            //AppStrings.selectYourArea
                            style: theme.textTheme.displaySmall,
                          ),
                          Gap(AppSizes.size8),
                          Text(
                            'You can select as many as possible.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(AppSizes.size10),
                if (_selectedTopics.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.size12,
                        vertical: AppSizes.size4,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withAlpha(25),
                        borderRadius: BorderRadius.circular(AppSizes.radius8),
                      ),
                      child: Text(
                        '${_selectedTopics.length} Selected',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                Gap(AppSizes.size10),
                Wrap(
                  spacing: AppSizes.size12,
                  runSpacing: AppSizes.size12,
                  children: TopicsData.topics.map((topic) {
                    final isSelected = _selectedTopics.contains(topic);
                    final hasCustomColor = TopicsData.topicColors.containsKey(topic);
                    final backgroundColor = isSelected
                        ? (hasCustomColor
                        ? TopicsData.topicColors[topic]!
                        : theme.colorScheme.primary)
                        : Colors.transparent;
                    final textColor = isSelected
                        ?  Colors.white
                        : theme.textTheme.bodyMedium?.color;
                    return GestureDetector(
                      onTap: () => _toggleTopic(topic),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.size16,
                          vertical: AppSizes.size12,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor,
                          border: Border.all(
                            color: isSelected
                                ? Colors.transparent
                                : (isDarkMode
                                ? AppColors.darkBorder
                                : AppColors.lightBorder),
                          ),
                          borderRadius: BorderRadius.circular(AppSizes.radius24),
                        ),
                        child: Text(
                          topic,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: textColor,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: _selectedTopics.isNotEmpty
          ? FloatingActionButton(
        shape: CircleBorder(),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PinSecurityScreen(),
              ));
        },
        backgroundColor: AppColors.yellow1,
        child: const Icon(Icons.arrow_forward, color: Colors.white, size: AppSizes.size30,),
      )
          : null,
    );
  }
}