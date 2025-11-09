import 'package:flutter/material.dart';
import 'package:parle_app/ui/common/auth/forgot_password.dart';
import 'package:parle_app/ui/common/auth/login_screen.dart';
import 'package:parle_app/ui/common/auth/register_screen.dart';
import 'package:parle_app/ui/student/home/student_home_screen.dart';

class AppRouter {
  Map<String, WidgetBuilder> generateRoutes(BuildContext context) {
    return {
      register: (context) => RegisterScreen(),
      login: (context) => LoginScreen(),
      home: (context) => HomeScreen(),
      forgotPassword: (context) => ForgotPassword(),
    };
  }

  static const register = "/register";
  static const login = "/login";
  static const home = "/home";
  static const forgotPassword = "/forgot-password";
}
