import 'dart:ui';

import 'package:flutter/material.dart';

Widget buildIconRow(IconData icon, Color containerColor, String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            10), 
        color: Color.fromARGB(
            23, 118, 117, 117), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: containerColor,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(23, 118, 117, 117)
                        .withOpacity(0.2), 
                    blurRadius: 5, 
                    offset: Offset(0, 5), 
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
