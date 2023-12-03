import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expo2030/screens/timeline_screen.dart';
import 'package:flutter_expo2030/screens/widgets/icon_widget.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://trendsmena.com/wp-content/uploads/2023/11/expo.jpg',
      'https://www.arabnews.com/sites/default/files/styles/n_670_395/public/main-image/opinion/2023/10/04/33kd7c7-highres_1.jpg?itok=8FlVDO4E',
      'https://www.arabnews.com/sites/default/files/userimages/17/fzbglzpxwaajak0_0.jpg',
      'https://eztrfdxp5kc.exactdn.com/wp-content/uploads/2023/06/MBS-handshake.jpg?strip=all&lossy=0&fit=1024%2C740&ssl=1',
      'https://www.atalayar.com/asset/thumbnail,1280,720,center,center/media/atalayar/images/2023/11/29/2023112912150162660.jpg',
      'https://static.srpcdigital.com/2023-11/433890.jpeg'
    ];

    final List<Widget> imageSliders = imgList.map((item) {
      return Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            item,
            fit: BoxFit.cover,
            width: 1000.0,
          ),
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.6,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                initialPage: 2,
                autoPlay: true,
                autoPlayAnimationDuration: Duration(seconds: 5),
              ),
              items: imageSliders,
            ),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '''EXPO OVERVIEW
      Riyadh Expo 2030 ''',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '''Delivering an unprecedented World Expo experience for both 
                      participants and millions of visitors.''',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
               
                buildIconRow(Icons.people, Colors.green, '''Expected Visitors
        40 million site visits
        1 billion metaverse visits'''),
                buildIconRow(Icons.space_bar, Colors.yellow, '''Total Site Size
        6 Million m2'''),
                buildIconRow(
                    Icons.location_city, Colors.purple, '''Expected Participants
        246 participants Country pavilions international organizations'''),
                buildIconRow(Icons.location_pin, Colors.orange, '''Site Location
        Located in the north of Riyadh, approximately 5-10 minute’ drive from King Khalid International Airport'''),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.topToBottom,
                        child: TimelineScreen()));
              },
              style: ElevatedButton.styleFrom(primary: Colors.green[50]),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 2),
                  Text(
                    "Learn about the key milestones of Riyadh Expo 2030",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
