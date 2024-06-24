import 'package:app_belibeli/widgets/loading.wiget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/ui/ui.dart';
import 'package:app_belibeli/utils/utils.dart';

class ProfileForm extends StatelessWidget {
  ProfileForm({super.key});

  final prefs = UserPreferences();

  @override
  Widget build(BuildContext context) {
    final profileForm = context.watch<ProfileFormController>();

    return Form(
      key: profileForm.formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              keyboardType: TextInputType.text,
              decoration: inputDecoration(
                hintText: 'Name',
                labelText: 'Name',
                disabled: profileForm.isLoading,
              ),
              onChanged: (value) => profileForm.user.name = value,
              validator: (value) => TValidator.validateName(value),
              readOnly: profileForm.isLoading,
              initialValue: prefs.name,
            ),
          ),

          const SizedBox(height: 15),

          // username field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              keyboardType: TextInputType.emailAddress,
              decoration: inputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                disabled: profileForm.isLoading,
              ),
              onChanged: (value) => profileForm.user.email = value,
              validator: (value) => TValidator.validateEmail(value),
              readOnly: profileForm.isLoading,
              initialValue: prefs.email,
            ),
          ),

          const SizedBox(height: 15),

          // password field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              obscureText: !profileForm.showPassword,
              keyboardType: TextInputType.text,
              decoration: inputDecoration(
                hintText: '********',
                labelText: 'Password',
                disabled: profileForm.isLoading,
                suffixIcon: !profileForm.showPassword
                    ? CupertinoIcons.eye_fill
                    : CupertinoIcons.eye_slash_fill,
                onTapSuffixIcon: () => profileForm.toggleShowPassword(),
              ),
              onChanged: (value) => profileForm.user.password = value,
              validator: (value) => TValidator.validatePassword(value),
              readOnly: profileForm.isLoading,
            ),
          ),
          const SizedBox(height: 15),

          // confirm password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: TextFormField(
              style: const TextStyle(fontWeight: FontWeight.w500),
              obscureText: !profileForm.showConfirmPassword,
              keyboardType: TextInputType.text,
              decoration: inputDecoration(
                hintText: '********',
                labelText: 'Confirm Password',
                disabled: profileForm.isLoading,
                suffixIcon: !profileForm.showConfirmPassword
                    ? CupertinoIcons.eye_fill
                    : CupertinoIcons.eye_slash_fill,
                onTapSuffixIcon: () => profileForm.toggleShowConfirmPassword(),
              ),
              validator: (value) => TValidator.validateConfirmPassword(
                  value, profileForm.user.password),
              readOnly: profileForm.isLoading,
            ),
          ),

          const SizedBox(height: 25),

          // Sign In Button
          MaterialButton(
            elevation: 0,
            disabledColor: Colors.blue[400],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: const Color(0xff1d242d),
            onPressed: () {
              FocusScope.of(context).unfocus();
              if (!profileForm.isValidForm()) return;
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: profileForm.isLoading ? 151 : 140,
                vertical: profileForm.isLoading ? 14.5 : 18,
              ),
              child: _textLogin(false),
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
            'Save',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          );
  }
}
