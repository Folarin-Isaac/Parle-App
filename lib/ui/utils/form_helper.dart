import 'package:parle_app/constants/constants.dart';

class FormHelper {
  FormHelper._();

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return ErrorText.emailRequired;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      return ErrorText.emailInvalid;
    }

    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return ErrorText.passwordRequired;
    }

    if (password.length < 6) {
      return ErrorText.passwordTooShort;
    }

    return null;
  }

  static String? validateConfirmPassword({
    required String? confirmPassword,
    required String originalPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return ErrorText.confirmPassword;
    }

    if (confirmPassword != originalPassword) {
      return ErrorText.passwordMismatch;
    }

    return null;
  }

  static String? validateFullName(String? fullName) {
    if (fullName == null || fullName.isEmpty) {
      return ErrorText.fullNameRequired;
    }

    if (fullName.length < 2) {
      return ErrorText.fullNameLeast;
    }

    return null;
  }

  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required';
    }

    if (username.length < 3) {
      return 'Username must be at least 3 characters';
    }

    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegex.hasMatch(username)) {
      return 'Username can only contain letters, numbers, and underscores';
    }

    return null;
  }

  static String? checkLength({
    required String? txt,
    required String fieldname,
    required int len,
  }) {
    if (txt == null || txt.isEmpty) {
      return '$fieldname is required';
    }

    if (txt.length < len) {
      return "$fieldname must be at least $len characters";
    }

    return null;
  }
}