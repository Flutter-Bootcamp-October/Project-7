import 'package:flutter/material.dart';

extension Navigators on BuildContext {
  pushScreen(Widget screen) {
    Navigator.push( 
        this,
        MaterialPageRoute(
          builder: (context) => screen,
        ));
  }

  popScreen() {
    Navigator.pop(this);
  }
}