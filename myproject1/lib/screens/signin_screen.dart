import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/auth_bloc/auth_bloc.dart';
import 'package:shopingpriject/custom_profiletextfield.dart/custom_button.dart';
import 'package:shopingpriject/screens/nav_bar.dart';
import 'package:shopingpriject/screens/signup_Screen.dart';
import 'package:shopingpriject/widgets/custom_textfield.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  TextEditingController emailorusernameController = TextEditingController();

  TextEditingController paswwordController = TextEditingController();

  // void signIn() {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 10,
        ),
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Positioned(
              bottom: 600,
              left: 200,
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    "lib\\assets\\imges\\img2.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Let's Sign in",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Unna",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Fill the details below to continue.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: CustomTextField(
                    label: "Username or Email",
                    hint: "Enter Username or Email",
                    icon: Icons.email_outlined,
                    controller: emailorusernameController,
                  ),
                ),
                SizedBox(height: 20),
                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  icon: Icons.remove_red_eye_outlined,
                  obscureText: true,
                  controller: paswwordController,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue[800]),
                  ),
                ),
                SizedBox(height: 10),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is LoginSuccessedState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NavBar(),
                        ),
                      );
                    } else if (state is ErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: CustomButton(
                      text: "Sign in",
                      buttonColor: Colors.amber,
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          LoginEvent(
                            emailorusernameController.text,
                            paswwordController.text,
                          ),
                        );
                      }),
                ),
                SizedBox(height: 10),
                Align(alignment: Alignment.bottomCenter, child: Text("OR")),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: CustomButton(
                    text: "Sign in with Google",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    buttonColor: Color.fromARGB(255, 248, 246, 246),
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("New Player?"),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
