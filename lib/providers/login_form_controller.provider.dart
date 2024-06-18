import 'package:flutter/material.dart';
import 'package:app_belibeli/models/models.dart';

class LoginFormController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late Auth auth;
  bool _isLoading = false;

  LoginFormController() {
    auth = Auth(email: 'ramirezpineda@gmail.com', password: '12345678');
  }

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
