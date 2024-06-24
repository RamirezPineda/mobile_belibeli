import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:app_belibeli/screens/screens.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  static const List<Widget> tabBarViews = [
    HomeScreen(),
    ShoppingCartScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InitScreen.tabBarViews[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: GNav(
          selectedIndex: _selectedIndex,
          onTabChange: (index) => setState(() => _selectedIndex = index),
          gap: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          backgroundColor: Colors.transparent,
          activeColor: Colors.black,
          color: Colors.grey[600],
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          tabBackgroundColor: Colors.grey.shade200,
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: CupertinoIcons.bag_fill, text: 'Cart'),
            GButton(icon: CupertinoIcons.heart_fill, text: 'Favorites'),
            GButton(icon: CupertinoIcons.person_fill, text: 'Profile'),
          ],
        ),
      ),
    );
  }
}
