import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/common/counsellors/widgets/counsellor_card.dart';

class SuggestedCounsellorsTab extends StatelessWidget {
  const SuggestedCounsellorsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    // Sample counsellors data
    final List<Map<String, dynamic>> counsellors = [
      {
        'name': 'Amina Halima',
        'availability': '9:00am - 9:00pm',
        'image': 'https://example.com/avatar1.jpg',
        'isOnline': true,
      },
      {
        'name': 'Kazeem Raman',
        'availability': '5:00am - 9:00pm',
        'image': 'https://example.com/avatar2.jpg',
        'isOnline': true,
      },
      {
        'name': 'Christina Okor',
        'availability': '9:00am - 12:00pm',
        'image': 'https://example.com/avatar3.jpg',
        'isOnline': false,
      },
      {
        'name': 'Amanda Uche',
        'availability': '7:00am - 7:00pm',
        'image': 'https://example.com/avatar4.jpg',
        'isOnline': true,
      },
      {
        'name': 'Fatima Dantata',
        'availability': '9:00am - 5:00pm',
        'image': 'https://example.com/avatar5.jpg',
        'isOnline': false,
      },
      {
        'name': 'Kelechi Emalie',
        'availability': '9:00am - 5:00pm',
        'image': 'https://example.com/avatar6.jpg',
        'isOnline': false,
      },
    ];

    return Container(
      color: isDarkMode ? AppColors.darkSecondaryBackground : Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.size24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppSizes.size16,
              mainAxisSpacing: AppSizes.size24,
              childAspectRatio: 0.7,
            ),
            itemCount: counsellors.length,
            itemBuilder: (context, index) {
              final counsellor = counsellors[index];
              return CounsellorCard(
                imageUrl: counsellor['image'],
                name: counsellor['name'],
                availability: counsellor['availability'],
                isOnline: counsellor['isOnline'],
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}