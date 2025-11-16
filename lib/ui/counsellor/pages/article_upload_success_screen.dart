import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/components/app_logo.dart';
import 'package:parle_app/components/custom_button.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/constants/app_strings.dart';

class ArticleUploadSuccessScreen extends StatelessWidget {
  const ArticleUploadSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                'assets/images/article_uploaded.png',
                width: 180,
                height: 180,
                fit: BoxFit.contain,
              ),
              Gap(AppSizes.size40),
              Text(
                AppStrings.articleUploadedSuccessfully,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              PrimaryButton(text: AppStrings.backToHome, onPressed: () {}),
              Gap(AppSizes.size24),
            ],
          ),
        ),
      ),
    );
  }
}
