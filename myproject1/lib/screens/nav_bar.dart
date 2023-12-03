import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:shopingpriject/screens/chat_Screen.dart';
import 'package:shopingpriject/screens/profile_screen.dart';
import 'package:shopingpriject/screens/search_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  // Define your tabs here
  final List<Widget> _tabs = [
    SearchScreen(),
    ChatGPT(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: GNav(
            backgroundColor: Color(0xfffbcb7f),
            padding: EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index; // change index
              });
            },
            tabs: const [
              GButton(
                icon: Icons.search_rounded,
                text: 'serch',
              ),
              GButton(
                icon: Icons.chat,
                text: 'chat',
              ),
              GButton(
                icon: Icons.person,
                text: 'profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
