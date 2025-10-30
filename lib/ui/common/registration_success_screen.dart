import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/app_logo.dart';
import 'package:parle_app/components/custom_button.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/app_strings.dart';

class RegistrationSuccessScreen extends StatelessWidget {
  final String userType;

  const RegistrationSuccessScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String message = userType == AppStrings.counsellor
        ? AppStrings.counsellorMessage
        : AppStrings.studentMessage;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.size24),
          child: Column(
            children: [
              const AppLogo(),
              const Spacer(),
              Image.asset(
                'assets/images/counsellor_registered.png',
                width: 220,
                height: 220,
                fit: BoxFit.contain,
              ),
              Gap(AppSizes.size40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.size16),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ),
              const Spacer(),
              PrimaryButton(text: AppStrings.exitApplication, onPressed: () {}),
              Gap(AppSizes.size24),
            ],
          ),
        ),
      ),
    );
  }
}
