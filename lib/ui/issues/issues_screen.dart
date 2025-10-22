import 'package:parle_app/ui/issues/issues.dart';
import 'package:parle_app/ui/issues/tabs/edit_challenge/edit_challenge_tab.dart';

class IssuesScreen extends StatefulWidget {
  final List<String>? initialSelectedTopics;

  const IssuesScreen({
    super.key,
    this.initialSelectedTopics,
  });

  @override
  State<IssuesScreen> createState() => _IssuesScreenState();
}

class _IssuesScreenState extends State<IssuesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Set<String> _selectedTopics;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _selectedTopics = widget.initialSelectedTopics?.toSet() ?? {
      'Depression',
      'Trauma & Abuse',
      'Sleeping Disorder',
      'Anger Management',
      'Fatigue',
    };
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleTopic(String topic) {
    setState(() {
      if (_selectedTopics.contains(topic)) {
        _selectedTopics.remove(topic);
      } else {
        _selectedTopics.add(topic);
      }
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedTopics.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = AppTheme.isDarkMode(context);

    return Scaffold(
      backgroundColor: isDarkMode
          ? AppColors.darkBackground
          : AppColors.lightCream,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSizes.size24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const AppLogo(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_outlined,
                      color: theme.iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: isDarkMode ? Colors.black : Colors.black87,
              unselectedLabelColor: isDarkMode ? Colors.white70 : Colors.black54,
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
                const Tab(text: AppStrings.editChallenge),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(AppStrings.chats),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: isDarkMode
                              ? AppColors.darkPrimary
                              : AppColors.lightPrimary,
                          shape: BoxShape.circle,
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 20,
                          minHeight: 20,
                        ),
                        child: Center(
                          child: Text(
                            AppStrings.two,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Tab(text: AppStrings.suggestedCounsellors1),
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
                    EditChallengeTab(
                      selectedTopics: _selectedTopics,
                      onTopicToggle: _toggleTopic,
                      onClearSelection: _clearSelection,
                    ),
                    //const ChatsTab(),
                    //const SuggestedCounsellorsTab(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: isDarkMode
      //       ? AppColors.darkPrimary
      //       : const Color(0xFFFDB827),
      //   shape: const CircleBorder(),
      //   child: Icon(
      //     Icons.arrow_forward,
      //     color: isDarkMode ? Colors.black : Colors.white,
      //   ),
      // ),
    );
  }
}