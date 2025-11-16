import 'package:parle_app/components/app_header.dart';
import 'package:parle_app/ui/counsellor/pages/issues/tabs/other_counsellors/other_counsellors_tab.dart';
import 'package:parle_app/ui/counsellor/pages/issues/tabs/requested_sessions/requested_sessions_tab.dart';
import 'package:parle_app/ui/counsellor/widgets/circular_badge.dart';
import 'package:parle_app/ui/student/issues/issues.dart';
import 'package:parle_app/ui/student/issues/tabs/chats/chats_tab.dart';

class CounsellorIssuesScreen extends StatefulWidget {
  const CounsellorIssuesScreen({super.key});

  @override
  State<CounsellorIssuesScreen> createState() => _CounsellorIssuesScreenState();
}

class _CounsellorIssuesScreenState extends State<CounsellorIssuesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightCream,
      body: SafeArea(
        child: Column(
          children: [
            AppHeader(),
            TabBar(
              controller: _tabController,
              labelColor: isDarkMode ? Colors.black : Colors.black87,
              unselectedLabelColor: isDarkMode
                  ? Colors.white70
                  : Colors.black54,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                letterSpacing: 0.5,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              tabs: [
                const Tab(text: AppStrings.requestedSessionsCAPS),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.chats),
                      Gap(8),
                      CircularBadge(text: '2'),
                    ],
                  ),
                ),
                const Tab(text: AppStrings.otherCounsellors),
              ],
            ),
            Expanded(
              child: Container(
                color: isDarkMode
                    ? AppColors.darkSecondaryBackground
                    : Colors.white,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RequestedSessionsTab(),
                    const ChatsTab(),
                    OtherCounsellorsTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
