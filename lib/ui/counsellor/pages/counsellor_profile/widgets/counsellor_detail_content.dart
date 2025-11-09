import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/components/custom_text_field.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/ui/utils/form_helper.dart';

class CounsellorDetailsContent extends StatelessWidget {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController professionController;

  const CounsellorDetailsContent({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.professionController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          label: AppStrings.fullName,
          hintText: 'John Doe',
          controller: fullNameController,
          keyboardType: TextInputType.name,
          validator: FormHelper.validateFullName,
        ),
        Gap(AppSizes.size24),
        CustomTextField(
          label: AppStrings.email,
          hintText: 'example@gmail.com',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: FormHelper.validateEmail,
        ),
        Gap(AppSizes.size24),
        CustomTextField(
          label: AppStrings.profession,
          hintText: 'johndoe123',
          controller: professionController,
          keyboardType: TextInputType.text,
          validator: FormHelper.validateUsername,
        ),
        Gap(AppSizes.size8),
      ],
    );
  }
}