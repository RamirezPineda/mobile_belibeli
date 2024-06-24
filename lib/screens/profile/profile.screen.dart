import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/screens/profile/widgets/profile_form.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            ChangeNotifierProvider(
              create: (BuildContext context) => ProfileFormController(),
              child: ProfileForm(),
            ),
          ],
        ),
      ),
    );
  }
}
