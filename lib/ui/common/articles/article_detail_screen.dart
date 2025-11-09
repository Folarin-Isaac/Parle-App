import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/constants/app_sizes.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String author;
  final String imageUrl;
  final String content;

  const ArticleDetailScreen({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSizes.size16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: theme.iconTheme.color,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            title,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Gap(AppSizes.size12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'By $author',
                                style: theme.textTheme.bodyMedium,
                              ),
                              Text(
                                '5 mins read',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5),
                                ),
                              ),
                            ],
                          ),
                          Gap(AppSizes.size24),
                        ],
                      ),
                    ),
                    Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 250,
                          color: Colors.grey[300],
                          child: const Icon(Icons.image, size: 80),
                        );
                      },
                    ),
                    Gap(AppSizes.size24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                      child: Text(
                        content,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          height: 1.6,
                        ),
                      ),
                    ),
                    Gap(AppSizes.size40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}