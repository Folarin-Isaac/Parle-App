class SVGImageUrl {
  SVGImageUrl._();

  // Social media icons
  static const String google = 'assets/icons/google.svg';
  static const String apple = 'assets/icons/apple.svg';
  static const String facebook = 'assets/icons/facebook.svg';

}

class PNGImageUrl {}

class ErrorText {
  ErrorText._();

  // Authentication errors
  static const String invalidCredentials = 'Invalid email or password';
  static const String accountNotFound = 'Account not found';
  static const String accountDisabled = 'Your account has been disabled';
  static const String emailAlreadyExists = 'Email already exists';
  static const String weakPassword = 'Password is too weak';

  // Network errors
  static const String noInternet = 'No internet connection';
  static const String serverError = 'Server error. Please try again later';
  static const String timeoutError = 'Request timeout. Please try again';

  // Form validation errors
  static const String emailRequired = 'Email is required';
  static const String passwordRequired = 'Password is required';
  static const String emailInvalid = 'Enter a valid email address';
  static const String passwordTooShort = 'Password must be at least 6 characters';
  static const String confirmPassword = 'Please confirm your password';
  static const String passwordMismatch = 'Passwords do not match';
  static const String fullNameLeast = 'Full name must be at least 2 characters';
  static const String fullNameRequired = 'Full name is required';

  // General errors
  static const String somethingWentWrong = 'Something went wrong';
  static const String unknownError = 'An unknown error occurred';
  static const String tryAgain = 'Please try again';

}
