import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parle_app/app/core/di/service_locator.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/app/theme/theme_provider.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/providers/user_provider.dart';
import 'package:parle_app/ui/auth/login_screen.dart';
import 'package:parle_app/ui/issues/issues_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await setUpServiceLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const ParleApp(),
    ),
  );
}

class ParleApp extends StatelessWidget {
  const ParleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: AppStrings.appName,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: themeProvider.themeMode,
          home: IssuesScreen(),
        );
      },
    );
  }
}
