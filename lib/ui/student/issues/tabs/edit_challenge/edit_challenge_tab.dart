import 'package:parle_app/ui/student/issues/issues.dart';

class EditChallengeTab extends StatefulWidget {
  final Set<String> selectedTopics;
  final Function(String) onTopicToggle;
  final VoidCallback onClearSelection;

  const EditChallengeTab({
    super.key,
    required this.selectedTopics,
    required this.onTopicToggle,
    required this.onClearSelection,
  });

  @override
  State<EditChallengeTab> createState() => _EditChallengeTabState();
}

class _EditChallengeTabState extends State<EditChallengeTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(AppSizes.size24),
            Text(
              AppStrings.selectAsMany,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodyMedium?.color,
              ),
            ),
            Gap(AppSizes.size16),
            if (widget.selectedTopics.isNotEmpty)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.size12,
                    vertical: AppSizes.size6,
                  ),
                  decoration: BoxDecoration(
                    color: isDarkMode
                        ? AppColors.darkSecondaryBackground
                        : Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.radius16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${widget.selectedTopics.length} Selected',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      Gap(AppSizes.size8),
                      GestureDetector(
                        onTap: widget.onClearSelection,
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: theme.textTheme.bodySmall?.color
                              ?.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Gap(AppSizes.size16),
            Wrap(
              spacing: AppSizes.size12,
              runSpacing: AppSizes.size12,
              children: TopicsData.topics.map((topic) {
                final isSelected = widget.selectedTopics.contains(topic);
                final hasCustomColor =
                TopicsData.topicColors.containsKey(topic);
                final backgroundColor = isSelected
                    ? (hasCustomColor
                    ? TopicsData.topicColors[topic]!
                    : (isDarkMode
                    ? AppColors.darkPrimary
                    : AppColors.lightPrimary))
                    : (isDarkMode
                    ? AppColors.darkSecondaryBackground
                    : Colors.white);
                final textColor = isSelected
                    ? Colors.white
                    : theme.textTheme.bodyMedium?.color;
                return GestureDetector(
                  onTap: () => widget.onTopicToggle(topic),
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
                            : Colors.black12),
                      ),
                      borderRadius: BorderRadius.circular(AppSizes.radius24),
                    ),
                    child: Text(
                      topic,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: textColor,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Gap(AppSizes.size80),
          ],
        ),
      ),
    );
  }
}