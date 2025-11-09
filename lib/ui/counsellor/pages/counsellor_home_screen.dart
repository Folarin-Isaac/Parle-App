import 'package:parle_app/components/app_header.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/ui/student/home/home.dart';

class CounsellorHomeScreen extends StatefulWidget {
  const CounsellorHomeScreen({super.key});

  @override
  State<CounsellorHomeScreen> createState() => _CounsellorHomeScreenState();
}

class _CounsellorHomeScreenState extends State<CounsellorHomeScreen> {
  final String _username = 'Sandaliii';

  final List<Map<String, dynamic>> _counsellors = [
    {'name': 'Christiana', 'image': 'url', 'isOnline': true},
    {'name': 'Amarachi', 'image': 'url', 'isOnline': false},
    {'name': 'Omang', 'image': 'url', 'isOnline': false},
    {'name': 'Ose', 'image': 'url', 'isOnline': true},
    {'name': 'Michael', 'image': 'url', 'isOnline': true},
  ];

  final List<Map<String, String>> _articles = [
    {
      'title': 'Cyber Bullying and how to handle it',
      'image': 'url',
    },
    {
      'title': 'Five Ways to Beat Depression',
      'image': 'url',
    },
    {
      'title': 'Managing Stress at Work',
      'image': 'url',
    },
    {
      'title': 'Building Self Confidence',
      'image': 'url',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi $_username!',
                        style: theme.textTheme.headlineMedium,
                      ),
                      Gap(AppSizes.size4),
                      Text(
                        AppStrings.anotherLovelyDay,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      Gap(AppSizes.size32),
                      Text(
                        AppStrings.requestedSessions,
                        style: theme.textTheme.titleLarge?.copyWith(
                          color: isDarkMode
                              ? AppColors.darkSectionHeader
                              : AppColors.lightSectionHeader,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(AppSizes.size4),
                      Text(
                        AppStrings.selectToViewProfile,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
                        ),
                      ),
                      Gap(AppSizes.size16),
                      SizedBox(
                        height: 110,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _counsellors.length,
                          separatorBuilder: (context, index) => Gap(AppSizes.size16),
                          itemBuilder: (context, index) {
                            final counsellor = _counsellors[index];
                            return CounsellorAvatar(
                              imageUrl: counsellor['image'],
                              name: counsellor['name'],
                              isOnline: counsellor['isOnline'],
                              onTap: () {},
                            );
                          },
                        ),
                      ),
                      Gap(AppSizes.size32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Latest Articles',
                            style: theme.textTheme.titleLarge?.copyWith(
                              color: isDarkMode
                                  ? AppColors.darkSectionHeader
                                  : AppColors.lightSectionHeader,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View all',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(AppSizes.size16),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppSizes.size16,
                          mainAxisSpacing: AppSizes.size16,
                          childAspectRatio: 0.95,
                        ),
                        itemCount: _articles.length,
                        itemBuilder: (context, index) {
                          final article = _articles[index];
                          return ArticleCard(
                            imageUrl: article['image']!,
                            title: article['title']!,
                            onTap: () {},
                          );
                        },
                      ),
                      Gap(AppSizes.size40),
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
}