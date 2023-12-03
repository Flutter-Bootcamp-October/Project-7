import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:therapiest_ai/consts/colors.dart';
import 'package:therapiest_ai/services/extentions.dart';
import 'package:therapiest_ai/views/regestration_screen.dart';
import 'package:therapiest_ai/widget/my_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/mytherapylogo.png'),
            const SizedBox(height: 100),
            Text('welcomeScreen.welcomeStatement'.tr(),
                style: const TextStyle(fontSize: 70)),
            const SizedBox(height: 20),
            MyButton(
                w: 300,
                onPressed: () {
                  context.removeUnitl(const RegestrationScreen());
                },
                child: Text('welcomeScreen.welcomeButton'.tr())),
            const SizedBox(height: 5),
            MyButton(
                w: 300,
                onPressed: () {
                  if (context.locale.toString() == "en_US") {
                    context.setLocale(const Locale('ar', 'SA'));
                  } else {
                    context.setLocale(const Locale('en', 'US'));
                  }
                  context.removeUnitl(const RegestrationScreen());
                },
                child: Text('welcomeScreen.welcomeButton2'.tr())),
          ],
        ));
  }
}
