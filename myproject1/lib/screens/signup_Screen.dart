import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/auth_bloc/auth_bloc.dart';
import 'package:shopingpriject/custom_profiletextfield.dart/custom_button.dart';
import 'package:shopingpriject/screens/signin_screen.dart';
import 'package:shopingpriject/widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  TextEditingController emailorusernameController = TextEditingController();

  TextEditingController paswwordController = TextEditingController();

  TextEditingController confirmpaswwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailorusernameController = TextEditingController();
    TextEditingController paswwordController = TextEditingController();
    TextEditingController confirmpaswwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
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
              bottom: 490,
              left: 250,
              child: Container(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Image.asset(
                    "lib\\assets\\imges\\img4.png",
                    width: 100,
                    height: 100,
                  ),
                ),
                Text(
                  "Let's Sign up",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Unna",
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Let's sign up to get rewards",
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
                  label: "Full Name",
                  hint: "Enter Name Here",
                  icon: Icons.person_2_outlined,
                  controller: nameController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  label: "Password",
                  hint: "Enter password",
                  icon: Icons.remove_red_eye_outlined,
                  obscureText: true,
                  controller: paswwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  label: "confirm Password",
                  hint: "Enter password",
                  icon: Icons.remove_red_eye_outlined,
                  obscureText: true,
                  controller: confirmpaswwordController,
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SignUpSuccessedState) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
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
                      text: "Sign up",
                      buttonColor: Colors.amber,
                      onPressed: () {
                        context.read<AuthBloc>().add(
                              SignUpEvent(
                                nameController.text,
                                emailorusernameController.text,
                                paswwordController.text,
                                confirmpaswwordController.text,
                              ),
                            );
                      }),
                ),
                SizedBox(height: 10),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Joined us before?"),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign in",
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
