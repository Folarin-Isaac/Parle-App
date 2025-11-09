import 'package:parle_app/ui/common/counsellors/widgets/counsellor_card.dart';
import 'package:parle_app/ui/student/issues/issues.dart';

class OtherCounsellorsTab extends StatefulWidget {

  const OtherCounsellorsTab({
    super.key,
  });

  @override
  State<OtherCounsellorsTab> createState() => _OtherCounsellorsTabState();
}

class _OtherCounsellorsTabState extends State<OtherCounsellorsTab> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    // Sample sessions data
    final List<Map<String, dynamic>> counsellors = [
      {
        'name': 'Amina Halima',
        'availability': '9:00am - 9:00pm',
        'image': 'https://example.com/avatar1.jpg',
        'isOnline': true,
      },
      {
        'name': 'Kazeem Raman',
        'availability': '5:00am - 9:00pm',
        'image': 'https://example.com/avatar2.jpg',
        'isOnline': true,
      },
      {
        'name': 'Christina Okor',
        'availability': '9:00am - 12:00pm',
        'image': 'https://example.com/avatar3.jpg',
        'isOnline': false,
      },
      {
        'name': 'Amina Halima',
        'availability': '9:00am - 9:00pm',
        'image': 'https://example.com/avatar1.jpg',
        'isOnline': true,
      },
      {
        'name': 'Kazeem Raman',
        'availability': '5:00am - 9:00pm',
        'image': 'https://example.com/avatar2.jpg',
        'isOnline': true,
      },
      {
        'name': 'Christina Okor',
        'availability': '9:00am - 12:00pm',
        'image': 'https://example.com/avatar3.jpg',
        'isOnline': false,
      },
      {
        'name': 'Amina Halima',
        'availability': '9:00am - 9:00pm',
        'image': 'https://example.com/avatar1.jpg',
        'isOnline': true,
      },
      {
        'name': 'Kazeem Raman',
        'availability': '5:00am - 9:00pm',
        'image': 'https://example.com/avatar2.jpg',
        'isOnline': true,
      },
      {
        'name': 'Christina Okor',
        'availability': '9:00am - 12:00pm',
        'image': 'https://example.com/avatar3.jpg',
        'isOnline': false,
      },
    ];

    return Container(
      color: isDarkMode ? AppColors.darkSecondaryBackground : Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.size24),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: AppSizes.size16,
              mainAxisSpacing: AppSizes.size24,
              childAspectRatio: 0.7,
            ),
            itemCount: counsellors.length,
            itemBuilder: (context, index) {
              final counsellor = counsellors[index];
              return CounsellorCard(
                imageUrl: counsellor['image'],
                name: counsellor['name'],
                availability: counsellor['availability'],
                isOnline: counsellor['isOnline'],
                onTap: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}
