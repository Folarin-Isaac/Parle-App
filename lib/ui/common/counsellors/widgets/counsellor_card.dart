import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/common/counsellors/counsellor_profile_screen.dart';

class CounsellorCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String availability;
  final bool isOnline;
  final String? bio;
  final String? location;
  final List<String>? specialties;
  final VoidCallback? onTap;

  const CounsellorCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.availability,
    this.isOnline = false,
    this.bio,
    this.location,
    this.specialties,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return GestureDetector(
      onTap: onTap ?? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CounsellorProfileScreen(
              name: name,
              imageUrl: imageUrl,
              bio: bio ?? 'Counsellor since June 2015\nCareer Counselling in Kaduna, Nigeria',
              location: location ?? 'Kaduna, Nigeria',
              availability: availability,
              isOnline: isOnline,
              specialties: specialties ?? ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
            ),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: isDarkMode
                    ? AppColors.darkCardBackground
                    : Colors.grey[300],
                child: ClipOval(
                  child: Image.network(
                    imageUrl,
                    width: AppSizes.size90,
                    height: AppSizes.size90,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.person_outline,
                        size: 45,
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
                    width: 20,
                    height: 20,
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
          Gap(AppSizes.size8),
          Text(
            name,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(AppSizes.size4),
          Text(
            availability,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.6),
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}