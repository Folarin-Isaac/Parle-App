import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/app_logo.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/constants/constants.dart';
import 'package:parle_app/gen/assets.gen.dart';
import 'package:parle_app/ui/common/onboarding/widgets/speech_bubble_button.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({super.key});

  @override
  State<CategorySelectionScreen> createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  String? _selectedCategory;

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _continue() {
    if (_selectedCategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category'),
        ),
      );
      return;
    }

    // Navigate based on selection
    // print('Selected: $_selectedCategory');
    // Navigator.push(...) to next screen
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightCream,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSizes.size24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppLogo(),
                  Gap(AppSizes.size40),
                  Text(
                    'You are a...',
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(AppSizes.size8),
                  Text(
                    'Kindly choose the appropriate category',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: SpeechBubbleButton(
                      label: 'Student',
                      isSelected: _selectedCategory == 'Student',
                      pointsRight: true,
                      onTap: () => _selectCategory('Student'),
                    ),
                  ),

                  Gap(AppSizes.size40),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SpeechBubbleButton(
                      label: 'Counsellor',
                      isSelected: _selectedCategory == 'Counsellor',
                      pointsRight: false,
                      onTap: () => _selectCategory('Counsellor'),
                    ),
                  ),

                  const Spacer(),
                  SizedBox(
                    height: 85,
                    child: Image.asset(
                      Assets.images.illustration.path,
                      fit: BoxFit.fill,
                      height: AppSizes.size120,
                      width: AppSizes.size220,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Text(
                            AppStrings.illustration,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: isDarkMode
                                  ? AppColors.darkTextSecondary
                                  : Colors.black38,
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Gap(AppSizes.size80),
                ],
              ),
            ),
            Positioned(
              bottom: AppSizes.size24,
              right: AppSizes.size24,
              child: FloatingActionButton(
                onPressed: _continue,
                backgroundColor: isDarkMode
                    ? AppColors.darkPrimary
                    : const Color(0xFFFDB827),
                shape: const CircleBorder(),
                child: Icon(
                  Icons.arrow_forward,
                  color: isDarkMode ? Colors.black : Colors.white,
                  size: 28,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}