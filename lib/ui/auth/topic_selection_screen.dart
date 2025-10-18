import 'package:flutter/material.dart';
import 'package:parle_app/ui/auth/pin_security_screen.dart';
import 'package:parle_app/ui/auth/widgets/auth.dart';


class TopicSelectionScreen extends StatefulWidget {
  const TopicSelectionScreen({super.key});

  @override
  State<TopicSelectionScreen> createState() => _TopicSelectionScreenState();
}

class _TopicSelectionScreenState extends State<TopicSelectionScreen> {
  final Set<String> _selectedTopics = {};

  final List<String> _topics = const [
    'Depression',
    'Stress and Anxiety',
    'Coping with Addictions',
    'Anxiety',
    'Family Issues',
    'Trauma & Abuse',
    'Relationship Issues',
    'Sexuality Issues',
    'Coping with Grief and Loss',
    'Eating Disorder',
    'Sleeping Disorder',
    'Motivation, Self esteem and confidence',
    'Fatigue',
    'Anger Management',
    'Career Choices',
    'Bipolar Disorder',
    'Concentration, memory and focus (ADHD)',
    'Executive and Professional Coaching',
    'Life Changes',
    'Parenting Issues',
  ];

  final Map<String, Color> _topicColors = const {
    'Depression': Color(0xFF003D5C),
    'Stress and Anxiety' : Color(0xFFD32F2F),
    'Coping with Addictions' : Color(0xFFFDB827),
    'Anxiety' : Color(0xFF008B8B),
    'Trauma & Abuse' : Color(0xFFFDB827),
    'Relationship Issues' : Color(0xFFFDB827),
    'Sexuality Issues' : Color(0xFF008B8B),
    'Coping with Grief and Loss' : Color(0xFFD32F2F),
    'Eating Disorder' : Color(0xFFFDB827),
    'Sleeping Disorder' : Color(0xFFD32F2F),
    'Motivation, Self esteem and confidence' : Color(0xFFFDB827),
    'Fatigue' : Color(0xFF003D5C),
    'Anger Management' : Color(0xFFFDB827),
    'Career Choices' : Color(0xFF003D5C),
    'Bipolar Disorder' : Color(0xFFFDB827),
    'Concentration, memory and focus (ADHD)': Color(0xFFD32F2F),
    'Executive and Professional Coaching' : Color(0xFFFDB827),
    'Life Changes' : Color(0xFF008B8B),
    'Parenting Issues' : Color(0xFF008B8B),
  };

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
                            'What would you like to\nconcentrate on?',
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
                    if (_selectedTopics.isNotEmpty)
                      Container(
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
                  ],
                ),
                Gap(AppSizes.size32),
                Wrap(
                  spacing: AppSizes.size12,
                  runSpacing: AppSizes.size12,
                  children: _topics.map((topic) {
                    final isSelected = _selectedTopics.contains(topic);
                    final hasCustomColor = _topicColors.containsKey(topic);
                    final backgroundColor = isSelected
                        ? (hasCustomColor
                        ? _topicColors[topic]!
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
        backgroundColor: const Color(0xFFFDB827),
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      )
          : null,
    );
  }
}