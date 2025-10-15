import 'package:parle_app/constants/constants.dart';

class FormHelper {

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
      return 'Password is required';
    }

    if (password.length < 6) {
      return 'Password must be at least 6 characters';
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