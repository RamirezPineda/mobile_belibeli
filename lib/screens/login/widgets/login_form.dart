import 'package:app_belibeli/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/services/services.dart';
import 'package:app_belibeli/ui/ui.dart';
import 'package:app_belibeli/utils/utils.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final authService = AuthService();

  Future<void> login(LoginFormController loginForm) async {
    if (!loginForm.isValidForm()) return;
    loginForm.isLoading = true;
    await authService.login(loginForm.auth);
    loginForm.isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormController>(context);

    return Form(
      key: loginForm.formKey,
      child: Column(
        children: [
          // username field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                disabled: loginForm.isLoading,
              ),
              onChanged: (value) => loginForm.auth.email = value,
              validator: (value) => TValidator.validateEmail(value),
              initialValue: 'ramirezpineda@gmail.com',
              readOnly: loginForm.isLoading,
            ),
          ),

          const SizedBox(height: 15),

          // password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: inputDecoration(
                hintText: '********',
                labelText: 'Password',
                disabled: loginForm.isLoading,
              ),
              onChanged: (value) => loginForm.auth.password = value,
              validator: (value) => TValidator.validatePassword(value),
              initialValue: '12345678',
              readOnly: loginForm.isLoading,
            ),
          ),

          const SizedBox(height: 25),

          // Sign In Button
          MaterialButton(
            elevation: 0,
            disabledColor: Colors.blue[400],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            color: Colors.blue[600],
            onPressed: loginForm.isLoading
                ? null
                : () {
                    FocusScope.of(context).unfocus();
                    login(loginForm);
                  },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: loginForm.isLoading ? 151 : 140,
                vertical: loginForm.isLoading ? 14.5 : 14,
              ),
              child: _textLogin(loginForm.isLoading),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textLogin(bool isLoading) {
    return isLoading
        ? const Loading()
        : const Text(
            'Log in',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          );
  }
}
