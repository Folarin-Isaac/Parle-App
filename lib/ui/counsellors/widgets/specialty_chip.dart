import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/constants/app_sizes.dart';

class SpecialtyChip extends StatelessWidget {
  final String label;

  const SpecialtyChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          size: 16,
          color: theme.textTheme.bodyMedium?.color,
        ),
        Gap(AppSizes.size8),
        Text(
          label,
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}