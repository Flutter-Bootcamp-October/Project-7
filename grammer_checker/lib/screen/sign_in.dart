import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_bloc.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_event.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_state.dart';
import 'package:grammer_checker/screen/navigation_bar.dart';
import 'package:grammer_checker/screen/sign_up.dart';
import 'package:grammer_checker/widget/primary_button.dart';
import 'package:grammer_checker/widget/text_filed.dart';
import 'package:grammer_checker/widget/text_with_button.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_sharp))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 32, top: 64, right: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color(0xff5F5BFF)),
                    ),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryTextFiled(
                hint: "ahamd33@hotmail.com",
                labelText: 'Email',
                controller: emailController,
              ),
              PrimaryTextFiled(
                hint: "****",
                isPassword: true,
                labelText: 'Password',
                controller: passwordController,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1),
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is SuccessSignInState) {
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) {
                        return Navigation();
                      }), (route) => false);
                    }
                  },
                  child: PrimaryButton(
                    backgroundColor: const Color(0xff5F5BFF),
                    titleColor: Colors.white,
                    title: "Sign In",
                    onpressed: () {
                      context.read<AuthBloc>().add(SignInEvent(
                          email: emailController.text,
                          password: passwordController.text));
                    },
                  ),
                ),
              ),
              TextWithButton(
                  title: "Create a new account?",
                  textButton: " Sign Up",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
