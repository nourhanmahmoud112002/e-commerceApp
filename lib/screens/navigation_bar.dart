import 'package:e_commerce_app/screens/profile.dart';
import 'package:e_commerce_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../constants.dart';
import 'favorite.dart';
import 'home.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});
  static String id = "NavigationBarPage";
  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int currentIndexNaviagtionBar = 0;
  final screens = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: GNav(
            backgroundColor: Colors.white,
            // color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: kprimaryColor,
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 900), // tab animation duration
            padding: const EdgeInsets.all(16),
            gap: 8,
            onTabChange: (index) {
              setState(() {
                currentIndexNaviagtionBar = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favorites',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
      body: screens[currentIndexNaviagtionBar],
    );
  }
}
