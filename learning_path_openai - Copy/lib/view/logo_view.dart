import 'package:flutter/material.dart';
import 'package:learning_path_openai/utils/custom_widgets/text_widget.dart';
import 'package:learning_path_openai/utils/extension/navigator.dart';
import 'package:learning_path_openai/utils/extension/screen_resposive.dart';
import 'package:learning_path_openai/view/HomeView.dart';

class LogoView extends StatefulWidget {
  const LogoView({
    super.key,
  });

  @override
  State<LogoView> createState() => _LogoViewState();
}

class _LogoViewState extends State<LogoView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.pushAndRemoveUntil(page:  HomeView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: context.heightFullScreen(),
      width: context.widthFullScreen(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 223, 241, 251),
          Color.fromARGB(255, 247, 241, 187)
        ], begin: Alignment.topRight, end: Alignment.bottomRight),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 200,
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                "assets/learapplogo.png",
                fit: BoxFit.fill,
                color: const Color.fromARGB(255, 31, 71, 104),
              ),
            ),
          ),
          const Positioned(
            bottom: 290,
            child: TextWidget(
              text: 'Learning Path',
              fontFamilyText: 'Tinos',
              fontWeightText: FontWeight.bold,
              colorText: Color.fromARGB(255, 31, 71, 104),
              fontSizeText: 30,
            ),
          )
        ],
      ),
    ));
  }
}
