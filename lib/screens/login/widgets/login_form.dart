import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import 'package:app_belibeli/routes/app_router.dart';
import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/services/services.dart';
import 'package:app_belibeli/ui/ui.dart';
import 'package:app_belibeli/utils/utils.dart';
import 'package:app_belibeli/widgets/widgets.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  final authService = AuthService();

  Future<Map<String, dynamic>> login(LoginFormController loginForm) async {
    loginForm.isLoading = true;
    final data = await authService.login(loginForm.auth);
    loginForm.isLoading = false;
    return data;
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
              obscureText: !loginForm.showPassword,
              keyboardType: TextInputType.text,
              decoration: inputDecoration(
                hintText: '********',
                labelText: 'Password',
                disabled: loginForm.isLoading,
                suffixIcon: !loginForm.showPassword
                    ? CupertinoIcons.eye_fill
                    : CupertinoIcons.eye_slash_fill,
                onTapSuffixIcon: () => loginForm.toggleShowPassword(),
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
            disabledColor: Colors.grey,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color(0xff1d242d),
            onPressed: loginForm.isLoading
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    if (!loginForm.isValidForm()) return;

                    login(loginForm).then((data) {
                      if (data.containsKey(ResponseError.messages)) {
                        _showDialogError(context, data['messages'][0]);
                      } else {
                        final categoryProvider =
                            context.read<CategoryProvider>();
                        categoryProvider.getAllCategories();

                        final productFavoriteProvider =
                            context.read<ProductFavoriteProvider>();
                        productFavoriteProvider.getAllProductsFavorite();
                        context.pushReplacement(Routes.root);
                      }
                    }).catchError((onError) {
                      _showDialogError(context, 'Error!');
                    });
                  },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: loginForm.isLoading ? 151 : 140,
                vertical: loginForm.isLoading ? 16.5 : 16,
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
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          );
  }

  Future<dynamic> _showDialogError(BuildContext context, String message) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            title: const Text('Error', style: TextStyle(color: Colors.red)),
            content: Row(
              children: [
                const Icon(Icons.error, color: Colors.red),
                const SizedBox(width: 5),
                Text(message)
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Accept'),
              ),
            ],
          );
        });
  }
}
