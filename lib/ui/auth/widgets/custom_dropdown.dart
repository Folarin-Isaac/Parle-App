import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String? value;
  final double? width;
  final List<String> items;
  final Function(String?)? onChanged;
  final String? hintText;

  const CustomDropdown({
    super.key,
    required this.label,
    this.width,
    required this.value,
    required this.items,
    this.onChanged,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.textTheme.bodySmall?.color?.withAlpha(190),
          ),
        ),
        SizedBox(height: AppSizes.size8),
        SizedBox(
          width: width,
          child: DropdownButtonFormField<String>(
            initialValue: value,
            isExpanded: true,
            decoration: InputDecoration(
              filled: false,
              contentPadding: EdgeInsets.symmetric(
                vertical: AppSizes.size12,
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode
                      ? AppColors.darkInputBorder
                      : AppColors.lightInputBorder,
                ),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: isDarkMode
                      ? AppColors.darkInputBorder
                      : AppColors.lightInputBorder,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
            hint: Text(
              hintText ?? 'Select $label',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.textTheme.bodySmall?.color?.withAlpha(102),
              ),
            ),
            items: items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: theme.textTheme.bodyLarge,
                ),
              );
            }).toList(),
            onChanged: onChanged,
            icon: Icon(
              Icons.keyboard_arrow_down,
              color: theme.iconTheme.color,
            ),
          ),
        ),
      ],
    );
  }
}