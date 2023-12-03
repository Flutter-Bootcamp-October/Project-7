import 'package:flutter/material.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/widgets/custom_search.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        "Welcome detective ${currentUser.name} ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: "Unna"),
                      ),
                    ),
                    SizedBox(height: 7),
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Text(
                        "      The World needs you",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: "Unna"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "here is the rolse you have to solve\n the case and find the killer\n you can qustion the suspects one by one  and serch for the evidence",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        "",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Text(
                        " to Start the game  Say your name First ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: "Unna"),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 90),
                      child: Text(
                        " then the game will start\n  Good luck ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontFamily: "Unna"),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "lib\\assets\\imges\\img11.png",
                    width: 300,
                    height: 350,
                    fit: BoxFit.contain,
                  ),
                ),
                Row(
                  children: [],
                ),
              ]),
        ));
  }
}
