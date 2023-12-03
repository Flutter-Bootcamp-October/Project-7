import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shopingpriject/blocs/theme_bloc/theme_bloc.dart';
import 'package:shopingpriject/blocs/theme_bloc/theme_event.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/models/user_model.dart';
import 'package:shopingpriject/screens/welcome_screen.dart';
import 'package:shopingpriject/widgets/custom_profiletextfield.dart';
import 'package:shopingpriject/widgets/custom_updatebutton.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("nameprof:${currentUser.name}");
    TextEditingController userController =
            TextEditingController(text: currentUser.name),
        emailController = TextEditingController(text: currentUser.email),
        paswwordController = TextEditingController(text: currentUser.password);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Profile ${currentUser.name}",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  context.read<ThemeBlocBloc>().add(ChangThemEvent('Light'));
                },
                icon: Icon(Icons.sunny),
              ),
              IconButton(
                onPressed: () {
                  context.read<ThemeBlocBloc>().add(ChangThemEvent('dark'));
                },
                icon: Icon(Icons.circle_rounded),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('lib/assets/imges/backgroung_img.jpg'),
            radius: 40,
          ),
          SizedBox(height: 30),
          ProfileTextField(
            label: "Name",
            controller: userController,
          ),
          ProfileTextField(
            label: "Mobile Number",
            controller: paswwordController,
          ),
          ProfileTextField(
            label: "Email Address",
            controller: emailController,
          ),
          ProfileTextField(
            label: "Password",
            icon: Icons.remove_red_eye_outlined,
            controller: paswwordController,
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: UpdateButton(),
          ),
          InkWell(
            onTap: () {
              currentUser = User(name: "", email: "", password: "");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ));
            },
            child: SizedBox(
              width: 200.0,
              height: 100.0,
              child: Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  'Log Out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
