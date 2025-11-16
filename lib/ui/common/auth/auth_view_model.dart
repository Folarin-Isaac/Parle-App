import 'package:flutter/widgets.dart';
import 'package:parle_app/data/remote/auth/auth_service.dart';
import 'package:parle_app/providers/user_provider.dart';
import 'package:parle_app/ui/base/base_view_model.dart';

class AuthViewModel extends BaseViewModel {
  final AuthService authService;
  UserProvider userProvider;
  AuthViewModel({required this.authService, required this.userProvider});
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;
  set obscurePassword(bool val) {
    _obscurePassword = val;
    notifyListeners();
  }

}