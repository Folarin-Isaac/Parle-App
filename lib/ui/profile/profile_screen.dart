import 'dart:io';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/ui/profile/profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _expandedSection;
  bool _remainAnonymous = true;

  // User data
  final String _fullName = 'Bukunmi Shonde';
  final String _anonName = 'Sandaliii';
  final _fullNameController = TextEditingController(text: 'Bukunmi Shonde');
  final _emailController = TextEditingController(text: 'shondebukunmi@gmail.com');
  final _usernameController = TextEditingController(text: 'Sandaliii');
  final _phoneController = TextEditingController(text: '0802 505 3698');
  final _dobController = TextEditingController(text: 'DD/MM/YY');

  // Dropdown values
  String? _selectedCountry = 'Nigeria';
  String? _selectedState = 'Lagos';
  String? _selectedReligion = 'Christian';
  String? _selectedDenomination = 'Catholic';
  String? _similarReligionCounsellor = 'Yes';
  String? _spiritualCounselling =
      'No, I would prefer to keep our sessions clinical';

  void _toggleSection(String section) {
    setState(() {
      _expandedSection = _expandedSection == section ? null : section;
    });
  }

  File? _avatarImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 512,
      maxHeight: 512,
      imageQuality: 75,
    );

    if (image != null) {
      setState(() {
        _avatarImage = File(image.path);
      });
    }
  }

  void _removeImage() {
    setState(() {
      _avatarImage = null;
    });
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(AppSizes.size24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppLogo(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_outlined,
                        color: theme.iconTheme.color,
                        size: AppSizes.size27,
                      ),
                    ),
                  ],
                ),
                Gap(AppSizes.size32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.profile,
                      style: theme.textTheme.displaySmall,
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ConfirmationDialog(
                            title: 'Are you sure you want\nto log out?',
                            confirmText: 'Yes',
                            cancelText: 'No',
                            onConfirm: () {},
                          ),
                        );
                      },
                      child: Text(
                        AppStrings.logOut,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: isDarkMode
                              ? AppColors.darkPrimary
                              : AppColors.yellow1,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(AppSizes.size24),
                GestureDetector(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (context) => ImageOptionsDialog(
                        onRemove: _removeImage,
                        onSelectFromGallery: _pickImage,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: AppSizes.radius40,
                            backgroundColor: isDarkMode
                                ? AppColors.darkCardBackground
                                : Colors.grey[300],
                            backgroundImage: _avatarImage != null
                                ? FileImage(_avatarImage!)                                 : null,
                            child: _avatarImage == null
                                ? Text(
                              '👤',
                              style: TextStyle(fontSize: 40),
                            )
                                : null,
                          ),
                          Positioned(
                            bottom: AppSizes.size0,
                            right: AppSizes.size0,
                            child: Container(
                              width: AppSizes.size20,
                              height: AppSizes.size20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: theme.scaffoldBackgroundColor,
                                  width: AppSizes.size2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(AppSizes.size40),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _fullName,
                              style: theme.textTheme.headlineSmall?.copyWith(
                                fontSize: AppSizes.size20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Gap(AppSizes.size6),
                            Text(
                              'Anon Name: $_anonName',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.textTheme.bodySmall?.color,
                              ),
                            ),
                            Gap(AppSizes.size6),
                            Row(
                              children: [
                                SizedBox(
                                  width: AppSizes.size20,
                                  height: AppSizes.size20,
                                  child: Checkbox(
                                    value: _remainAnonymous,
                                    onChanged: (value) {
                                      setState(() {
                                        _remainAnonymous = value ?? false;
                                      });
                                    },
                                  ),
                                ),
                                Gap(AppSizes.size8),
                                Text(
                                  AppStrings.remainAnonymous,
                                  style: theme.textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(AppSizes.size16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.saveChanges,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: isDarkMode
                            ? AppColors.darkSectionHeader
                            : AppColors.lightSectionHeader,
                      ),
                    ),
                  ),
                ),
                Gap(AppSizes.size16),
                ExpandableTile(
                  title: 'Personal Details',
                  isExpanded: _expandedSection == 'personal',
                  onTap: () => _toggleSection('personal'),
                  child: PersonalDetailsContent(
                    fullNameController: _fullNameController,
                    emailController: _emailController,
                    usernameController: _usernameController,
                  ),
                ),
                Gap(AppSizes.size16),
                ExpandableTile(
                  title: 'Contact and Location',
                  isExpanded: _expandedSection == 'contact',
                  onTap: () => _toggleSection('contact'),
                  child: ContactLocationContent(
                    selectedCountry: _selectedCountry,
                    selectedState: _selectedState,
                    phoneController: _phoneController,
                    dobController: _dobController,
                    onCountryChanged: (value) {
                      setState(() {
                        _selectedCountry = value;
                      });
                    },
                    onStateChanged: (value) {
                      setState(() {
                        _selectedState = value;
                      });
                    },
                  ),
                ),
                Gap(AppSizes.size16),
                ExpandableTile(
                  title: 'Faith and Religion',
                  isExpanded: _expandedSection == 'faith',
                  onTap: () => _toggleSection('faith'),
                  child: FaithReligionContent(
                    selectedReligion: _selectedReligion,
                    selectedDenomination: _selectedDenomination,
                    similarReligionCounsellor: _similarReligionCounsellor,
                    spiritualCounselling: _spiritualCounselling,
                    onReligionChanged: (value) {
                      setState(() {
                        _selectedReligion = value;
                      });
                    },
                    onDenominationChanged: (value) {
                      setState(() {
                        _selectedDenomination = value;
                      });
                    },
                    onSimilarReligionChanged: (value) {
                      setState(() {
                        _similarReligionCounsellor = value;
                      });
                    },
                    onSpiritualCounsellingChanged: (value) {
                      setState(() {
                        _spiritualCounselling = value;
                      });
                    },
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
