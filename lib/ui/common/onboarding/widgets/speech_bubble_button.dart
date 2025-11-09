import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/ui/common/onboarding/widgets/speech_bubble.dart';

class SpeechBubbleButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool pointsRight;
  final VoidCallback onTap;

  const SpeechBubbleButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.pointsRight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 180,
        height: 120,
        child: CustomPaint(
          painter: SpeechBubblePainter(
            isSelected: isSelected,
            pointsRight: pointsRight,
            fillColor: isDarkMode
                ? AppColors.darkSecondaryBackground
                : Colors.white,
            borderColor: isDarkMode
                ? AppColors.darkPrimary
                : const Color(0xFF1E5A7D),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                label,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}