import 'package:flutter/material.dart';
import 'package:parle_app/ui/auth/auth.dart';
import 'package:parle_app/ui/auth/widgets/custom_dropdown.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();

  String? _selectedCountry = AppStrings.nigeria;
  String? _selectedState = AppStrings.lagos;
  String? _selectedReligion = AppStrings.christian;
  String? _selectedDenomination = AppStrings.catholic;
  String? _similarReligionCounsellor = AppStrings.yes;
  String? _spiritualCounselling = AppStrings.preferClinicalSessions;

  @override
  void dispose() {
    _phoneController.dispose();
    _dobController.dispose();
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
          child: Padding(
            padding: EdgeInsets.all(AppSizes.size24),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(AppSizes.size24),
                  const AppLogo(),
                  Gap(AppSizes.size40),
                  Text(
                    AppStrings.personalDetails,
                    style: theme.textTheme.headlineMedium,
                  ),
                  Gap(AppSizes.size8),
                  Text(
                    AppStrings.personalDetailsSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                  Gap(AppSizes.size32),
                  Text(
                    AppStrings.residence,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isDarkMode
                          ? AppColors.darkSectionHeader
                          : AppColors.lightSectionHeader,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(AppSizes.size24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          label: AppStrings.country,
                          value: _selectedCountry,
                          items: const [
                            AppStrings.nigeria,
                            AppStrings.ghana,
                            AppStrings.kenya,
                            AppStrings.southAfrica,
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedCountry = value;
                            });
                          },
                        ),
                      ),
                      Gap(AppSizes.size16),
                      Expanded(
                        child: CustomDropdown(
                          label: AppStrings.state,
                          value: _selectedState,
                          items: const [AppStrings.lagos, AppStrings.abuja, AppStrings.kano, AppStrings.rivers],
                          onChanged: (value) {
                            setState(() {
                              _selectedState = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(AppSizes.size24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: AppStrings.phoneNumber,
                          hintText: AppStrings.phoneNumberHint,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      Gap(AppSizes.size16),
                      Expanded(
                        child: CustomTextField(
                          label: AppStrings.dateOfBirth,
                          hintText: AppStrings.dateOfBirthHint,
                          controller: _dobController,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                    ],
                  ),
                  Gap(AppSizes.size32),
                  Text(
                    AppStrings.faithAndReligion,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: isDarkMode
                          ? AppColors.darkSectionHeader
                          : AppColors.lightSectionHeader,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(AppSizes.size24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomDropdown(
                          label: AppStrings.religion,
                          value: _selectedReligion,
                          items: const [
                            AppStrings.christian,
                            AppStrings.muslim,
                            AppStrings.hindu,
                            AppStrings.baptist,
                            AppStrings.other,
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedReligion = value;
                            });
                          },
                        ),
                      ),
                      Gap(AppSizes.size16),
                      Expanded(
                        child: CustomDropdown(
                          label: AppStrings.denomination,
                          value: _selectedDenomination,
                          items: const [
                            AppStrings.catholic,
                            AppStrings.protestant,
                            AppStrings.pentecostal,
                            AppStrings.orthodox,
                            AppStrings.other,
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedDenomination = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Gap(AppSizes.size24),
                  Row(
                    children: [
                      CustomDropdown(
                        label: AppStrings.counsellorSimilarReligion,
                        value: _similarReligionCounsellor,
                        width: MediaQuery.sizeOf(context).width / 2.1,
                        items: const [AppStrings.yes, AppStrings.no],
                        onChanged: (value) {
                          setState(() {
                            _similarReligionCounsellor = value;
                          });
                        },
                      ),
                      Gap(AppSizes.size32),
                    ],
                  ),
                  Gap(AppSizes.size24),
                  CustomDropdown(
                    label: AppStrings.spiritualBasedCounseling,
                    value: _spiritualCounselling,
                    items: const [
                      AppStrings.yes,
                      AppStrings.preferClinicalSessions,
                    ],
                    onChanged: (value) {
                      setState(() {
                        _spiritualCounselling = value;
                      });
                    },
                  ),

                  Gap(AppSizes.size80),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        backgroundColor: isDarkMode ? AppColors.darkPrimary : AppColors.yellow1,
        shape: const CircleBorder(),
        child: Icon(
          Icons.arrow_forward,
          color: isDarkMode ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
