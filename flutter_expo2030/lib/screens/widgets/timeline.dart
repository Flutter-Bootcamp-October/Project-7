 import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

Widget buildTimelineTile(String description, String imagePath) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      isFirst: true,
      indicatorStyle: IndicatorStyle(
        width: 60,
        height: 60,
        indicator: Image.asset(imagePath),
      ),
      endChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0),
        child: Card(
          color: Color.fromARGB(160, 255, 252, 252),
          elevation: 10,
          child: ListTile(
            subtitle: Text(
              description,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
      beforeLineStyle: LineStyle(
        color: Colors.green,
      ),
    );
  }