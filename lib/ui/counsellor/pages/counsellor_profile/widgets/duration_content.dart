import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/components/custom_dropdown.dart';
import 'package:parle_app/constants/app_sizes.dart';

class DurationContent extends StatefulWidget {
  final String? selectedYearsOfExperience;
  final String? selectedHoursPerDay;
  final String? selectedTime;
  final Function(String?)? onSelectedHoursPerDayChanged;
  final Function(String?)? onSelectedTimeChanged;
  final Function(String?)? onSelectedYearsOfExperienceChanged;

  const DurationContent({
    super.key,
    required this.selectedYearsOfExperience,
    required this.selectedHoursPerDay,
    required this.selectedTime,
    required this.onSelectedTimeChanged,
    this.onSelectedYearsOfExperienceChanged,
    this.onSelectedHoursPerDayChanged,
  });

  @override
  State<DurationContent> createState() => _DurationContentState();
}

class _DurationContentState extends State<DurationContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: CustomDropdown(
                label: 'Years of experience in counselling',
                value: widget.selectedYearsOfExperience,
                width: MediaQuery.sizeOf(context).width / 2.7,
                items: const ['3 years', '2 years'],
                onChanged: widget.onSelectedYearsOfExperienceChanged,
              ),
            ),
            Gap(AppSizes.size12),
          ],
        ),
        Gap(AppSizes.size24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomDropdown(
                label: 'Available Hours Per Day',
                value: '2 Hours',
                items: const [
                  '2 Hours',
                  '3 Hours',
                  '4 Hours'
                ],
                onChanged: widget.onSelectedHoursPerDayChanged,
              ),
            ),
            Gap(AppSizes.size16),
            Expanded(
              child: CustomDropdown(
                label: 'Start Time',
                value: widget.selectedTime,
                items: const [
                  '9:00 AM',
                  '10:00 AM',
                  '12:00 AM',
                ],
                onChanged: widget.onSelectedTimeChanged,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
