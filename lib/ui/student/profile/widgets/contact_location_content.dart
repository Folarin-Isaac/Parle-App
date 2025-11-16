import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/components/custom_dropdown.dart';
import 'package:parle_app/components/custom_text_field.dart';

class ContactLocationContent extends StatefulWidget {
  final String? selectedCountry;
  final String? selectedState;
  final TextEditingController phoneController;
  final TextEditingController dobController;
  final Function(String?)? onCountryChanged;
  final Function(String?)? onStateChanged;

  const ContactLocationContent({
    super.key,
    required this.selectedCountry,
    required this.selectedState,
    required this.phoneController,
    required this.dobController,
    this.onCountryChanged,
    this.onStateChanged,
  });

  @override
  State<ContactLocationContent> createState() => _ContactLocationContentState();
}

class _ContactLocationContentState extends State<ContactLocationContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Country and State - Two Column Layout
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomDropdown(
                label: 'Country of residence',
                value: widget.selectedCountry,
                items: const ['Nigeria', 'Ghana', 'Kenya', 'South Africa'],
                onChanged: widget.onCountryChanged,
              ),
            ),
            Gap(AppSizes.size16),
            Expanded(
              child: CustomDropdown(
                label: 'State',
                value: widget.selectedState,
                items: const ['Lagos', 'Abuja', 'Kano', 'Rivers'],
                onChanged: widget.onStateChanged,
              ),
            ),
          ],
        ),

        Gap(AppSizes.size24),

        // Phone Number and Date of Birth - Two Column Layout
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTextField(
                label: 'Phone Number',
                hintText: '0802 505 3698',
                controller: widget.phoneController,
                keyboardType: TextInputType.phone,
              ),
            ),
            Gap(AppSizes.size16),
            Expanded(
              child: CustomTextField(
                label: 'Date of Birth',
                hintText: 'DD/MM/YY',
                controller: widget.dobController,
                keyboardType: TextInputType.datetime,
              ),
            ),
          ],
        ),
      ],
    );
  }
}