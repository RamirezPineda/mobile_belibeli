import 'package:app_belibeli/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'package:app_belibeli/routes/app_router.dart';
import 'package:app_belibeli/providers/providers.dart';
import 'package:app_belibeli/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final userPreferences = UserPreferences();
  await userPreferences.initPrefs();

  await dotenv.load(fileName: '.env');

  final categoryService = CategoryService();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(categoryService),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BeliBeli.com',
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.getRoutes(),
      theme: ThemeData(
        fontFamily: 'Poppins',
        useMaterial3: true,
      ),
    );
  }
}
