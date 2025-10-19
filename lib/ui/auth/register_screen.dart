import 'package:flutter/material.dart';
import 'package:parle_app/ui/auth/topic_selection_screen.dart';
import 'package:parle_app/ui/auth/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _remainAnonymous = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.size24,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppSizes.size40),
                const AppLogo(),
                Gap(AppSizes.size64),
                Text(
                  AppStrings.welcomeToParle,
                  style: theme.textTheme.displaySmall,
                ),
                Gap(AppSizes.size8),
                Text(
                  AppStrings.welcomeMessage,
                  style: theme.textTheme.bodyMedium,
                ),
                Gap(AppSizes.size40),
                CustomTextField(
                  label: AppStrings.fullName,
                  hintText: '',
                  controller: _fullNameController,
                  keyboardType: TextInputType.name,
                  validator: FormHelper.validateFullName
                ),
                Gap(AppSizes.size24),
                CustomTextField(
                  label: AppStrings.email,
                  hintText: '',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: FormHelper.validateEmail,
                ),
                Gap(AppSizes.size24),
                CustomTextField(
                  label: AppStrings.userName,
                  hintText: '',
                  controller: _userNameController,
                  keyboardType: TextInputType.text,
                  validator: FormHelper.validateUsername,
                ),
                Gap(AppSizes.size24),
                CustomTextField(
                  label: AppStrings.password,
                  hintText: '',
                  controller: _passwordController,
                  isPassword: true,
                  validator: FormHelper.validatePassword,
                ),
                Gap(AppSizes.size24),
                CustomTextField(
                  label: AppStrings.confirmPassword,
                  hintText: '',
                  controller: _confirmPasswordController,
                  isPassword: true,
                  validator: (value) => FormHelper.validateConfirmPassword(
                    confirmPassword: value,
                    originalPassword: _passwordController.text,
                  ),
                ),
                Gap(AppSizes.size16),
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
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
                Gap(AppSizes.size24),
                PrimaryButton(
                  text: AppStrings.createAccount,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                    }
                  },
                ),
                Gap(AppSizes.size24),
                Row(
                  children: [
                    Expanded(child: Divider(color: theme.dividerTheme.color)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.size16,
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
                        TextSpan(text: AppStrings.alreadyHaveAccount),
                        TextSpan(
                          text: AppStrings.signIn,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TopicSelectionScreen(),
                                ));
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
    );
  }
}