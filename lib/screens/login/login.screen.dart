import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_belibeli/providers/providers.dart';

import 'package:app_belibeli/screens/login/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                //logo
                const SizedBox(height: 20),
                const Text('BeliBeli.com'),
                const SizedBox(height: 50),
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 75),

                ChangeNotifierProvider(
                  create: (BuildContext context) => LoginFormController(),
                  child: LoginForm(),
                ),

                const SizedBox(height: 50),
                _newAccountButton(context),
                const SizedBox(height: 130),
                const Text('Developed by Roy Ramirez Pineda'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _newAccountButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(thickness: 0.5, color: Colors.grey[400]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const SizedBox(width: 5),
                Text('Or create a', style: TextStyle(color: Colors.grey[700])),
                TextButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, Routes.register);
                  },
                  child: Text(
                    'new account',
                    style: TextStyle(color: Colors.blue.shade700),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Divider(thickness: 0.5, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
