import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/constants/app_sizes.dart';

class CounsellorAvatar extends StatelessWidget {
  final String imageUrl;
  final String name;
  final bool isOnline;
  final VoidCallback? onTap;

  const CounsellorAvatar({
    super.key,
    required this.imageUrl,
    required this.name,
    this.isOnline = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(imageUrl),
                // For local assets: AssetImage(imageUrl)
              ),
              if (isOnline)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Gap(AppSizes.size8),
          Text(
            name,
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}







