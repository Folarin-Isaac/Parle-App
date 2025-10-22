import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/components/app_header.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_sizes.dart';
import 'package:parle_app/ui/counsellors/counsellor_profile_screen.dart';
import 'package:parle_app/ui/counsellors/widgets/counsellor_card.dart';

class CounsellorsScreen extends StatefulWidget {
  const CounsellorsScreen({super.key});

  @override
  State<CounsellorsScreen> createState() => _CounsellorsScreenState();
}

class _CounsellorsScreenState extends State<CounsellorsScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _allCounsellors = [
    {
      'name': 'Amina Halima',
      'availability': '9:00am - 9:00pm',
      'image': 'https://example.com/avatar1.jpg',
      'isOnline': true,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Kazeem Raman',
      'availability': '9:00am - 9:00pm',
      'image': 'https://example.com/avatar2.jpg',
      'isOnline': true,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Christina Okor',
      'availability': '9:00am - 12:00pm',
      'image': 'https://example.com/avatar3.jpg',
      'isOnline': false,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Amanda Uche',
      'availability': '7:00am - 7:00pm',
      'image': 'https://example.com/avatar4.jpg',
      'isOnline': true,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Fatima Dantata',
      'availability': '9:00am - 5:00pm',
      'image': 'https://example.com/avatar5.jpg',
      'isOnline': false,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Kelechi Emalie',
      'availability': '9:00am - 5:00pm',
      'image': 'https://example.com/avatar6.jpg',
      'isOnline': false,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Hameed Idris',
      'availability': '9:00am - 5:00pm',
      'image': 'https://example.com/avatar7.jpg',
      'isOnline': false,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Mustapha Raji',
      'availability': '9:00am - 9:00pm',
      'image': 'https://example.com/avatar8.jpg',
      'isOnline': true,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
    {
      'name': 'Anne-Marie Sumah',
      'availability': '9:00am - 12:00pm',
      'image': 'https://example.com/avatar9.jpg',
      'isOnline': false,
      'specialties': ['Mental Health', 'Sexuality', 'Depression', 'Addiction'],
    },
  ];

  List<Map<String, dynamic>> _filteredCounsellors = [];

  @override
  void initState() {
    super.initState();
    _filteredCounsellors = _allCounsellors;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCounsellors(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCounsellors = _allCounsellors;
      } else {
        _filteredCounsellors = _allCounsellors.where((counsellor) {
          final nameLower = counsellor['name']!.toLowerCase();
          final searchLower = query.toLowerCase();
          return nameLower.contains(searchLower);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.size24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Counsellors', style: theme.textTheme.displaySmall),
                      Gap(AppSizes.size24),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(AppSizes.radius8),
                          border: Border.all(
                            color: isDarkMode
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _filterCounsellors,
                          style: theme.textTheme.bodyMedium,
                          decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            hintText: "Enter Counsellor's Name",
                            hintStyle: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.textTheme.bodySmall?.color
                                  ?.withValues(alpha: 0.4),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: theme.iconTheme.color,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppSizes.size16,
                              vertical: AppSizes.size14,
                            ),
                          ),
                        ),
                      ),
                      Gap(AppSizes.size32),
                      _filteredCounsellors.isEmpty
                          ? Center(
                              child: Padding(
                                padding: EdgeInsets.all(AppSizes.size40),
                                child: Text(
                                  'No counsellors found',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.textTheme.bodySmall?.color,
                                  ),
                                ),
                              ),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: AppSizes.size16,
                                    mainAxisSpacing: AppSizes.size24,
                                    childAspectRatio: 0.75,
                                  ),
                              itemCount: _filteredCounsellors.length,
                              itemBuilder: (context, index) {
                                final counsellor = _filteredCounsellors[index];
                                return CounsellorCard(
                                  imageUrl: counsellor['image'],
                                  name: counsellor['name'],
                                  availability: counsellor['availability'],
                                  isOnline: counsellor['isOnline'],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CounsellorProfileScreen(
                                          name: counsellor['name'],
                                          imageUrl: counsellor['image'],
                                          bio: 'Counsellor since June 2015\nCareer Counselling in Kaduna, Nigeria',
                                          location:  'Kaduna, Nigeria',
                                          availability: counsellor['availability'],
                                          isOnline: counsellor['isOnline'],
                                          specialties: counsellor['specialties']
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                      Gap(AppSizes.size40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
