import 'package:flutter/material.dart';
import 'package:grammer_checker/data/global.dart';
import 'package:grammer_checker/screen/sign_in.dart';
import 'package:grammer_checker/widget/primary_button.dart';
import 'package:grammer_checker/widget/text_filed.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  TextEditingController nameController =
      TextEditingController(text: currentUser.name);
  TextEditingController emailController =
      TextEditingController(text: currentUser.email);
  TextEditingController passwordController =
      TextEditingController(text: currentUser.password);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              ClipOval(
                child: Image.asset(
                  "lib/assets/profile_avatarpng.png",
                  width: 140,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  currentUser.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.1),
                child: PrimaryTextFiled(
                  hint: 'email',
                  labelText: 'Email',
                  controller: emailController,
                ),
              ),
              PrimaryTextFiled(
                hint: 'password',
                labelText: 'Password',
                controller: passwordController,
                isPassword: true,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width * 0.2),
                child: PrimaryButton(
                  title: 'Sign Out',
                  onpressed: () {
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) {
                      return SignInScreen();
                    }), (route) => false);
                  },
                  backgroundColor: const Color(0xffff8080),
                  titleColor: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
