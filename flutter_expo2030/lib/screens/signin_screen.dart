import 'package:flutter/material.dart';
import 'package:flutter_expo2030/screens/nav_bar.dart';
import 'package:flutter_expo2030/screens/signup_screen.dart';
import 'package:flutter_expo2030/screens/widgets/custom_button.dart';
import 'package:flutter_expo2030/screens/widgets/textfeilds.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                // Text(
                //   "Welcome Back !",
                //   style: TextStyle(
                //       fontSize: 24,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.purple[900]),
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
                  hint: "Your Email",
                  icon: Icons.email_outlined,
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: passwordController,
                  hint: "Your Password",
                  obscureText: true,
                  icon: Icons.password_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  onPressed: () async {
                    final supabase = Supabase.instance.client;
                    final signin = await supabase.auth.signInWithPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppNavigationBar(),
                      ),
                    );
                  },
                  text: "Sign in",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "You Don't have an account?",
                      style: TextStyle(fontSize: 17),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Colors.purple[900], fontSize: 17
                            //.withOpacity(0.50),
                            ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
