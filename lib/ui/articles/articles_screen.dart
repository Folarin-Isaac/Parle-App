import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/app_logo.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/articles/article_detail_screen.dart';
import 'package:parle_app/ui/articles/widgets/article_list_card.dart';

class ArticlesScreen extends StatefulWidget {
  const ArticlesScreen({super.key});

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> _allArticles = [
    {
      'title': 'Cyber Bullying and how to handle it',
      'author': 'Amina Sumar',
      'image': 'https://example.com/image1.jpg',
    },
    {
      'title': 'Five Ways to Beat Depression',
      'author': 'Amina Sumar',
      'image': 'https://example.com/image2.jpg',
    },
    {
      'title': 'Managing Stress at Work',
      'author': 'John Doe',
      'image': 'https://example.com/image3.jpg',
    },
    {
      'title': 'Building Self Confidence',
      'author': 'Jane Smith',
      'image': 'https://example.com/image4.jpg',
    },
    {
      'title': 'Understanding Anxiety Disorders',
      'author': 'Dr. Michael Chen',
      'image': 'https://example.com/image5.jpg',
    },
    {
      'title': 'The Power of Meditation',
      'author': 'Sarah Johnson',
      'image': 'https://example.com/image6.jpg',
    },
  ];

  List<Map<String, String>> _filteredArticles = [];

  @override
  void initState() {
    super.initState();
    _filteredArticles = _allArticles;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterArticles(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredArticles = _allArticles;
      } else {
        _filteredArticles = _allArticles.where((article) {
          final titleLower = article['title']!.toLowerCase();
          final authorLower = article['author']!.toLowerCase();
          final searchLower = query.toLowerCase();
          return titleLower.contains(searchLower) ||
              authorLower.contains(searchLower);
        }).toList();
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSizes.size24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLogo(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Articles.',
                        style: theme.textTheme.displaySmall,
                      ),
                      Gap(AppSizes.size8),
                      Text(
                        'Whenever you read a good book, somewhere in the world a door opens to allow in more light',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodySmall?.color,
                        ),
                      ),
                      Gap(AppSizes.size24),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.radius8),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _filterArticles,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: 'Search Articles',
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: isDarkMode
                                  ? AppColors.darkSectionHeader
                                  : AppColors.lightSectionHeader,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.size16,
                              vertical: AppSizes.size16,
                            ),
                          ),
                        ),
                      ),
                      Gap(AppSizes.size24),
                      _filteredArticles.isEmpty
                          ? Center(
                        child: Padding(
                          padding: EdgeInsets.all(AppSizes.size40),
                          child: Text(
                            'No articles found',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color,
                            ),
                          ),
                        ),
                      )
                          : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _filteredArticles.length,
                        itemBuilder: (context, index) {
                          final article = _filteredArticles[index];
                          return ArticleListCard(
                            imageUrl: article['image']!,
                            title: article['title']!,
                            author: article['author']!,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetailScreen(
                                    title: article['title']!,
                                    author: article['author']!,
                                    imageUrl: article['image']!,
                                    content: 'Cyberbullying or electronic aggression has already been designated as a serious public health threat. Cyberbullying should also be considered as a cause for new onset psychological symptoms, somatic symptoms of unclear etiology or a drop in academic performance.',
                                  ),
                                ),
                              );
                            },
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