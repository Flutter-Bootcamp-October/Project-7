import 'package:flutter/material.dart';
import 'package:flutter_expo2030/screens/widgets/timeline.dart';


class TimelineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: Column(
        children: [
          Container(
            height: 200,
            width: 1000,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/mbs2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildTimelineTile(
                  '''HRH Crown Prince announced the Kingdom's bid to host World Expo 2030 in Riyadh.''',
                  'lib/assets/images/1.png',
                ),
                buildTimelineTile(
                  '''A distinguished Saudi delegation submitted the Kingdom's nomination bit to host World Expo 2030 in Riyadh to the Secretary General of the BIE.''',
                  'lib/assets/images/2.jpg',
                ),
                buildTimelineTile(
                  '''The Kingdom showcased its bid to host World Expo 2030 during the General Assembly meeting of the BIE.''',
                  'lib/assets/images/3.jpeg',
                ),
                buildTimelineTile(
                  '''A delegation of the BIE visited Riyadh to discuss and evaluate the Kingdom's bid through a series of meetings and seminars with ministers and senior officials.''',
                  'lib/assets/images/4.jpg',
                ),
                buildTimelineTile(
                  '''The Royal Commission for Riyadh City held an official reception in Paris with the honorable presence of HRH Crown Prince, and the reception showcased Riyadh's readiness and unique capabilities to host World Expo 2030.''',
                  'lib/assets/images/5.jpg',
                ),
                buildTimelineTile(
                  '''A distinguished delegation of their Highnesses and Excellencies participated in a General Assembly meeting by delivering speeches that addressed the Kingdom's goal of Riyadh Expo 2030.''',
                  'lib/assets/images/6.jpg',
                ),
                buildTimelineTile(
                  '''The Royal Commission for Riyadh City organized a series of seminars in Paris, which discussed the main theme and sub-themes of Riyadh World Expo 2030''',
                  'lib/assets/images/7.webp',
                ),
                buildTimelineTile(
                  '''The Royal Commission for Riyadh City hosted the Riyadh Expo 2030 Symposium with the participation of a distinguished delegation, which contained seminars and various activities.''',
                  'lib/assets/images/8.png',
                ),
                buildTimelineTile(
                  '''The BIE officially announced that Saudi Arabia is the world's choice to host World Expo 2030.''',
                  'lib/assets/images/9.jpg',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
