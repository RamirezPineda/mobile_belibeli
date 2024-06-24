import 'package:flutter/material.dart';

import 'package:app_belibeli/models/models.dart';
import 'package:app_belibeli/utils/utils.dart';

class ProfileFormController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late User user;
  bool _isLoading = false;
  bool _showPassword = false;
  bool _showCofirmPassword = false;

  ProfileFormController() {
    final prefs = UserPreferences();
    user = User(name: prefs.name, email: prefs.email, password: '');
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  bool get isLoading => _isLoading;
  bool get showPassword => _showPassword;
  bool get showConfirmPassword => _showCofirmPassword;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void toggleShowPassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void toggleShowConfirmPassword() {
    _showCofirmPassword = !_showCofirmPassword;
    notifyListeners();
  }
}
