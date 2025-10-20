import 'package:flutter/material.dart';
import 'package:parle_app/app/theme/app_theme.dart';
import 'package:parle_app/constants/app_strings.dart';
import 'package:parle_app/ui/articles/articles_screen.dart';
import 'package:parle_app/ui/auth/login_screen.dart';
import 'package:parle_app/app/theme/theme_provider.dart';
import 'package:parle_app/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
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
          home: const ArticlesScreen(),
        );
      },
    );
  }
}