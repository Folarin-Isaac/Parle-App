import 'package:flutter/material.dart';
import 'package:parle_app/app/core/di/service_locator.dart';
import 'package:parle_app/data/remote/auth/auth_service.dart';
import 'package:parle_app/providers/user_provider.dart';
import 'package:parle_app/ui/common/auth/auth_view_model.dart';
import 'package:parle_app/ui/common/auth/register_screen.dart';
import 'package:parle_app/ui/common/auth/auth.dart';
import 'package:parle_app/ui/base/base_view.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _remainAnonymous = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BaseView<AuthViewModel>(
        model: AuthViewModel(
          authService: sl.get<AuthService>(),
          userProvider: userProvider,
        ),
        builder: (context, model, _) => SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.size20,
              vertical: AppSizes.size10,
            ),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSizes.size30),
                  const AppLogo(),
                  Gap(AppSizes.size64),
                  Text(
                    AppStrings.welcomeBack,
                    style: theme.textTheme.displaySmall,
                  ),
                  Gap(AppSizes.size8),
                  Text(AppStrings.kindlyLog, style: theme.textTheme.bodyMedium),
                  Gap(AppSizes.size40),
                  CustomTextField(
                    label: AppStrings.email,
                    hintText: AppStrings.logInHint,
                    controller: model.emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    validator: FormHelper.validateEmail,
                  ),
                  Gap(AppSizes.size24),
                  CustomTextField(
                    label: AppStrings.password,
                    hintText: '',
                    controller: model.passwordController,
                    isPassword: true,
                    validator: FormHelper.validatePassword,
                  ),
                  Gap(AppSizes.size16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: AppSizes.size20,
                            height: AppSizes.size20,
                            child: Transform.scale(
                              scale: 0.9,
                              child: Checkbox(
                                value: _remainAnonymous,
                                onChanged: (value) {
                                  setState(() {
                                    _remainAnonymous = value ?? false;
                                  });
                                },
                              ),
                            ),
                          ),
                          Gap(AppSizes.size8),
                          Text(
                            AppStrings.remainAnonymous,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: AppSizes.size12,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        AppStrings.forgotPassword,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: AppSizes.size12,
                        ),
                      ),
                    ],
                  ),
                  Gap(AppSizes.size30),
                  PrimaryButton(text: AppStrings.logIn, onPressed: () {}),
                  Gap(AppSizes.size24),
                  Row(
                    children: [
                      Expanded(child: Divider(color: theme.dividerTheme.color)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppTheme.size16,
                        ),
                        child: Text(
                          AppStrings.or,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      Expanded(child: Divider(color: theme.dividerTheme.color)),
                    ],
                  ),
                  Gap(AppSizes.size24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialLoginButton(
                        svgAssetPath: SVGImageUrl.google,
                        backgroundColor: AppColors.google,
                        iconColor: Colors.white,
                        onPressed: () {},
                      ),
                      Gap(AppSizes.size16),
                      SocialLoginButton(
                        svgAssetPath: SVGImageUrl.apple,
                        backgroundColor: isDarkMode
                            ? AppColors.appleDark
                            : AppColors.apple,
                        iconColor: isDarkMode ? Colors.black : Colors.white,
                        onPressed: () {},
                      ),
                      Gap(AppSizes.size16),
                      SocialLoginButton(
                        svgAssetPath: SVGImageUrl.facebook,
                        backgroundColor: AppColors.facebook,
                        iconColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  Gap(AppSizes.size32),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodyMedium,
                        children: [
                          TextSpan(text: AppStrings.dontHaveAccount),
                          TextSpan(
                            text: AppStrings.signUp,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Gap(AppSizes.size40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
