  import 'package:flutter/material.dart';

Widget buildInfoContainer(
      String title, String text, AlignmentGeometry alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        width: 350, 
        padding: EdgeInsets.all(15), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4), 
            Text(
              text,
              style: TextStyle(
                fontSize: 14, 
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Color.fromARGB(23, 118, 117, 117).withOpacity(
              0.1), 
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            bottomLeft: alignment == Alignment.centerLeft
                ? Radius.circular(0)
                : Radius.circular(8),
            bottomRight: alignment == Alignment.centerRight
                ? Radius.circular(0)
                : Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(23, 118, 117, 117)
                  .withOpacity(0.2), 
              blurRadius: 5, 
              offset: Offset(0, 5), 
            ),
          ],
        ),
      ),
    );
  }