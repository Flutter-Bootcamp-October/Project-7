import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_bloc.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_event.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_state.dart';
import 'package:grammer_checker/screen/sign_in.dart';
import 'package:grammer_checker/widget/alert.dart';
import 'package:grammer_checker/widget/primary_button.dart';
import 'package:grammer_checker/widget/text_filed.dart';
import 'package:grammer_checker/widget/text_with_button.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  @override
  SignUpScreen({super.key});
  TextEditingController nameController = TextEditingController();
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
                padding: const EdgeInsets.only(bottom: 32, top: 64, right: 180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Color(0xff5F5BFF)),
                    ),
                    Text(
                      "Create a new account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              PrimaryTextFiled(
                hint: "Ahmad",
                labelText: 'Name',
                controller: nameController,
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
                    if (state is SuccessSignUpState) {
                      showSuccessSnackBar(context, state.successMessage);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                      );
                    } else if (state is ErrorState) {
                      showErrorSnackBar(context, state.errorMassage);
                    }
                  },
                  child: PrimaryButton(
                      backgroundColor: const Color(0xff5F5BFF),
                      titleColor: Colors.white,
                      title: "Sign Up",
                      onpressed: () {
                        context.read<AuthBloc>().add(SignUpEvent(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text));
                      }),
                ),
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
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
