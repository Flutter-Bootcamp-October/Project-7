import 'package:flutter/material.dart';
import 'package:flutter_expo2030/screens/widgets/contener_widget.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: Text(
          '''HRH Crown Prince 
Mohammed bin Salman Al saud''',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/mbs.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),

           
            buildInfoContainer(
              'Extends',
              'His congratulations to Custodian of the Two Holy Mosques King Salman bin Abdulaziz Al Saud on the occasion of the Kingdom of Saudi Arabia winning the bid to host the World Expo 2030 in Riyadh.',
              Alignment.centerLeft,
            ),
            SizedBox(height: 8),
            buildInfoContainer(
              'States',
              '''The Kingdom's selection as the host of the World Expo 2030 underlines its influential and leading role and the international confidence it enjoys.''',
              Alignment.centerRight,
            ),
            SizedBox(height: 8),
            buildInfoContainer(
              'Stresses',
              '''This Expo represents a remarkable opportunity to share with the world the lessons learned from our unprecedented journey of transformation''',
              Alignment.centerLeft,
            ),
            SizedBox(height: 8),
            buildInfoContainer(
              'Reaffirms',
              '''The Kingdom's commitment to holding an extraordinary and unparalleled edition of the World Expo.''',
              Alignment.centerRight,
            ),
            SizedBox(height: 8),
            buildInfoContainer(
              'Expresses',
              '''Gratitude to the nations that supported the Kingdom's bid, as well as to the two competing countries.''',
              Alignment.centerLeft,
            ),
          ],
        ),
      ),
    );
  }
}
