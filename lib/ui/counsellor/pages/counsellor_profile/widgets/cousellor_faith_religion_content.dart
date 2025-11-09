import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/components/custom_dropdown.dart';
import 'package:parle_app/constants/app_sizes.dart';

class CounsellorFaithReligionContent extends StatefulWidget {
  final String? selectedReligion;
  final String? selectedDenomination;
  final String? similarReligionCounsellor;
  final String? spiritualCounselling;
  final Function(String?)? onReligionChanged;
  final Function(String?)? onDenominationChanged;
  final Function(String?)? onSimilarReligionChanged;
  final Function(String?)? onSpiritualCounsellingChanged;

  const CounsellorFaithReligionContent({
    super.key,
    required this.selectedReligion,
    required this.selectedDenomination,
    required this.similarReligionCounsellor,
    required this.spiritualCounselling,
    this.onReligionChanged,
    this.onDenominationChanged,
    this.onSimilarReligionChanged,
    this.onSpiritualCounsellingChanged,
  });

  @override
  State<CounsellorFaithReligionContent> createState() => _CounsellorFaithReligionContentState();
}

class _CounsellorFaithReligionContentState extends State<CounsellorFaithReligionContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomDropdown(
                label: 'Religion',
                value: widget.selectedReligion,
                items: const [
                  'Christian',
                  'Muslim',
                  'Hindu',
                  'Buddhist',
                  'Other',
                ],
                onChanged: widget.onReligionChanged,
              ),
            ),
            Gap(AppSizes.size16),
            Expanded(
              child: CustomDropdown(
                label: 'Denomination',
                value: widget.selectedDenomination,
                items: const [
                  'Catholic',
                  'Protestant',
                  'Pentecostal',
                  'Orthodox',
                  'Other',
                ],
                onChanged: widget.onDenominationChanged,
              ),
            ),
          ],
        ),
        Gap(AppSizes.size24),
        Row(
          children: [
            Expanded(
              child: CustomDropdown(
                label: 'Can you counsel based on your faith',
                value: widget.similarReligionCounsellor,
                width: MediaQuery.sizeOf(context).width / 2.7,
                items: const ['Yes', 'No'],
                onChanged: widget.onSimilarReligionChanged,
              ),
            ),
            Gap(AppSizes.size12),
          ],
        ),
      ],
    );
  }
}
