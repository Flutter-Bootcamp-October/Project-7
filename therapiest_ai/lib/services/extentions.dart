import 'package:flutter/material.dart';

extension NavigatorExtension on BuildContext {
  pushScreen(Widget screen) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => screen));
  }

  popScreen() {
    Navigator.pop(this);
  }

  removeUnitl(Widget screen) {
    Navigator.pushAndRemoveUntil(
        this,
        MaterialPageRoute(builder: (context) => screen),
        ModalRoute.withName("/screen"));
  }
}
