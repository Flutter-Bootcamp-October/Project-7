import 'package:flutter/material.dart';
import 'package:grammer_checker/screen/home_screen.dart';
import 'package:grammer_checker/screen/profile_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _Navigation_BarState();
}

class _Navigation_BarState extends State<Navigation> {
  List listScreen = [
    HomeScreen(),
    ProfileScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xff5F5BFF),
        unselectedItemColor: const Color(0xff738887),
        unselectedLabelStyle: const TextStyle(color: Color(0xff738887)),
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: listScreen[selectedIndex],
    );
  }
}
