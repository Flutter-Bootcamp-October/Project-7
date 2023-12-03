
import 'package:flutter/material.dart';
import 'package:flutter_expo2030/screens/nav_bar.dart';
import 'package:flutter_expo2030/screens/otp_screen.dart';

import 'package:flutter_expo2030/screens/widgets/custom_button.dart';
import 'package:flutter_expo2030/screens/widgets/textfeilds.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
    
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("lib/assets/images/10.jpeg"),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                // Image.asset("lib/assets/images/logo__tuwaiq.png"),
                // Text(
                //   """Begin your Tuwaiq Academy journey
                //    Sign up now!""",
                //   style: TextStyle(
                //       fontSize: 20,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.purple[900]),
                // ),
                // SizedBox(
                //   height: 10,
                // ),
                // Text(
                //   "Let's help you meet up your task",
                //   style: TextStyle(
                //       color:
                //           Color.fromARGB(255, 24, 138, 125).withOpacity(0.50),
                //       fontWeight: FontWeight.bold),
                // ),
                SizedBox(
                  height: 100,
                ),
                //Image.asset("lib/assets/images/logo__tuwaiq.png"),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: emailController,
                  hint: "Enter Your Email",
                  icon: Icons.email_outlined,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordController,
                  hint: "Enter Your Password",
                  obscureText: true,
                  icon: Icons.password_outlined,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomButton(
                  onPressed: () async {
                    final supabase = Supabase.instance.client;
                    final signup = await supabase.auth.signUp(
                      password: passwordController.text,
                      email: emailController.text,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpScreen(
                          email: emailController.text,
                        ),
                      ),
                    );
                  },
                  text: "Signup",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 17),
                      //style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppNavigationBar(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign In",
                          style:
                              TextStyle(color: Colors.purple[900], fontSize: 17
                                  //.withOpacity(0.50),
                                  ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
