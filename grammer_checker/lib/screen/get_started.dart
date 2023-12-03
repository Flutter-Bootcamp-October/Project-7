import 'package:flutter/material.dart';
import 'package:grammer_checker/screen/sign_in.dart';
import 'package:grammer_checker/screen/sign_up.dart';
import 'package:grammer_checker/widget/primary_button.dart';
import 'package:grammer_checker/widget/text_with_button.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 44),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AI ",
                          style: TextStyle(
                              fontSize: 32,
                              color: Color(0xff5F5BFF),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Grammer Checker",
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "The master of grammar correction in your pocket",
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.8),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 64, bottom: 64),
                      child: Image.asset("lib/assets/AI.png"),
                    ),
                  ],
                ),
              ),
              PrimaryButton(
                backgroundColor: const Color(0xff5F5BFF),
                titleColor: Colors.white,
                title: "Sign Up",
                onpressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              ),
              TextWithButton(
                title: "Already have account?",
                textButton: " Sign In",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
