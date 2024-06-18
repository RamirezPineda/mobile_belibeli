import 'package:app_belibeli/routes/app_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'BeliBeli.com',
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.getRoutes(),
    );
  }
}
