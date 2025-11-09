import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/app_header.dart';
import 'package:parle_app/components/custom_button.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/ui/common/counsellors/widgets/specialty_chip.dart';

class CounsellorProfileScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String bio;
  final String location;
  final String availability;
  final bool isOnline;
  final List<String> specialties;

  const CounsellorProfileScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.location,
    required this.availability,
    this.isOnline = false,
    required this.specialties,
  });

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
                        'Counsellors Profile',
                        style: theme.textTheme.displaySmall,
                      ),
                      Gap(AppSizes.size32),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                radius: 55,
                                backgroundColor: isDarkMode
                                    ? AppColors.darkCardBackground
                                    : Colors.grey[300],
                                child: ClipOval(
                                  child: Image.network(
                                    imageUrl,
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.person_outline,
                                        size: 55,
                                        color: isDarkMode
                                            ? AppColors.darkTextSecondary
                                            : Colors.grey[600],
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (isOnline)
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: theme.scaffoldBackgroundColor,
                                        width: 3,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          Gap(AppSizes.size20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  style: theme.textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: AppSizes.size18
                                  ),
                                ),
                                Gap(AppSizes.size4),
                                Text(
                                  isOnline ? 'Online' : 'Offline',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    fontSize: AppSizes.size10,
                                  ),
                                ),
                                Gap(AppSizes.size12),
                                Text(
                                  bio,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppSizes.size10,
                                  ),
                                ),
                                Gap(AppSizes.size12),
                                Text(
                                  availability,
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: AppSizes.size10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(AppSizes.size40),
                      Text(
                        'Specialities',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(AppSizes.size20),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: AppSizes.size16,
                          mainAxisSpacing: AppSizes.size16,
                          childAspectRatio: 4,
                        ),
                        itemCount: specialties.length,
                        itemBuilder: (context, index) {
                          return SpecialtyChip(label: specialties[index]);
                        },
                      ),
                      Gap(AppSizes.size40),
                      PrimaryButton(
                          text: AppStrings.bookAsCounsellor,
                          // AppStrings.chatWithCounsellor
                          onPressed: (){}
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