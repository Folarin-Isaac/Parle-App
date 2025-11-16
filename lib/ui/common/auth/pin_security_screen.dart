import 'package:flutter/material.dart';
import 'package:parle_app/ui/common/auth/auth.dart';

class PinSecurityScreen extends StatefulWidget {
  const PinSecurityScreen({super.key});

  @override
  State<PinSecurityScreen> createState() => _PinSecurityScreenState();
}

class _PinSecurityScreenState extends State<PinSecurityScreen> {
  final List<String?> _pinDigits = [null, null, null, null];
  int _currentIndex = 0;

  void _onNumberPressed(String number) {
    if (_currentIndex < 4) {
      setState(() {
        _pinDigits[_currentIndex] = number;
        _currentIndex++;
      });

      if (_currentIndex == 4) {
        _submitPin();
      }
    }
  }

  void _onBackspace() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pinDigits[_currentIndex] = null;
      });
    }
  }

  void _submitPin() {
    //final pin = _pinDigits.join('');
  }

  bool get _isPinComplete => _currentIndex == 4;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightCream,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.size30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(AppSizes.size40),
              const AppLogo(),
              Gap(AppSizes.size64),
              Text(
                AppStrings.securityPin,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: AppSizes.size20,
                  fontWeight: FontWeight.w600,
                  color: isDarkMode
                      ? AppColors.darkTextPrimary
                      : AppColors.darkGray,
                ),
              ),
              Gap(AppSizes.size48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  AppSizes.int4,
                      (index) => Container(
                    width: AppSizes.size56,
                    height: AppSizes.size72,
                    margin: EdgeInsets.symmetric(horizontal: AppSizes.size8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isDarkMode
                            ? AppColors.darkBorder
                            : AppColors.lightGray,
                        width: AppSizes.size2,
                      ),
                    ),
                    child: Center(
                      child: _pinDigits[index] != null
                          ? Text(
                        AppStrings.dot,
                        style: TextStyle(
                          fontSize: AppSizes.size40,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode
                              ? AppColors.darkTextPrimary
                              : AppColors.gray1,
                        ),
                      )
                          : const SizedBox(),
                    ),
                  ),
                ),
              ),
              Gap(AppSizes.size48),
              Column(
                children: [
                  _buildNumberRow([AppStrings.one, AppStrings.two, AppStrings.three], isDarkMode),
                  Gap(AppSizes.size16),
                  _buildNumberRow([AppStrings.four, AppStrings.five, AppStrings.six], isDarkMode),
                  Gap(AppSizes.size16),
                  _buildNumberRow([AppStrings.seven, AppStrings.eight, AppStrings.nine], isDarkMode),
                  Gap(AppSizes.size16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Gap(AppSizes.size40),
                      _buildNumberButton(AppStrings.zero, isDarkMode),
                      _buildBackspaceButton(isDarkMode),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 85,
                child: Image.asset(
                  PNGImageUrl.illustration,
                  fit: BoxFit.fill,
                  height: AppSizes.size120,
                  width: AppSizes.size220,
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Text(
                        AppStrings.illustration,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: isDarkMode
                              ? AppColors.darkTextSecondary
                              : Colors.black38,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _isPinComplete
          ? FloatingActionButton(
        onPressed: _submitPin,
        shape: const CircleBorder(),
        backgroundColor: isDarkMode
            ? AppColors.darkPrimary
            : AppColors.yellow1,
        child: Icon(
          Icons.arrow_forward,
          color: isDarkMode
              ? Colors.black
              : Colors.white,
          size: AppSizes.size30,
        ),
      )
          : null,
    );
  }

  Widget _buildNumberRow(List<String> numbers, bool isDarkMode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: numbers.map((n) => _buildNumberButton(n, isDarkMode)).toList(),
    );
  }

  Widget _buildNumberButton(String number, bool isDarkMode) {
    return InkWell(
      onTap: () => _onNumberPressed(number),
      borderRadius: BorderRadius.circular(AppSizes.radius36),
      child: Container(
        width: AppSizes.size72,
        height: AppSizes.size72,
        alignment: Alignment.center,
        child: Text(
          number,
          style: TextStyle(
            fontSize: AppSizes.size28,
            fontWeight: FontWeight.w500,
            color: isDarkMode
                ? AppColors.darkTextPrimary
                : AppColors.gray1,
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceButton(bool isDarkMode) {
    return InkWell(
      onTap: _onBackspace,
      child: Icon(
        Icons.backspace_sharp,
        color: isDarkMode
            ? AppColors.darkPrimary
            : AppColors.blue1,
        size: AppSizes.size30,
      ),
    );
  }
}