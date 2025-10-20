import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/auth/widgets/custom_dropdown.dart';

class FaithReligionContent extends StatefulWidget {
  final String? selectedReligion;
  final String? selectedDenomination;
  final String? similarReligionCounsellor;
  final String? spiritualCounselling;
  final Function(String?)? onReligionChanged;
  final Function(String?)? onDenominationChanged;
  final Function(String?)? onSimilarReligionChanged;
  final Function(String?)? onSpiritualCounsellingChanged;

  const FaithReligionContent({
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
  State<FaithReligionContent> createState() => _FaithReligionContentState();
}

class _FaithReligionContentState extends State<FaithReligionContent> {
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
                label: 'Would you like a Counsellor with a similar Religion',
                value: widget.similarReligionCounsellor,
                width: MediaQuery.sizeOf(context).width / 2.7,
                items: const ['Yes', 'No'],
                onChanged: widget.onSimilarReligionChanged,
              ),
            ),
            Gap(AppSizes.size12),
          ],
        ),
        Gap(AppSizes.size24),
        CustomDropdown(
          label: 'Would you like a spiritual based counselling?',
          value: widget.spiritualCounselling,
          items: const [
            'Yes',
            'No, I would prefer to keep our sessions clinical',
          ],
          onChanged: widget.onSpiritualCounsellingChanged,
        ),
      ],
    );
  }
}
