import 'package:flutter/material.dart';

import 'package:flutter_expo2030/screens/home_screen.dart';
import 'package:flutter_expo2030/screens/openai_screen.dart';
import 'package:flutter_expo2030/screens/secound_screen.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({super.key});

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  List screensList = [
    HomeScreen(),
    SecondScreen(),
    OpenAiScreen(),
  ];

  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screensList[selected],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green[50],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.green,
          unselectedItemColor: const Color.fromARGB(92, 0, 0, 0),
          currentIndex: selected,
          onTap: (value) {
            setState(() {
              selected = value;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: ""),
          ]),
    );
  }
}
