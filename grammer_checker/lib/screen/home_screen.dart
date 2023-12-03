import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grammer_checker/bloc/home_bloc/home_bloc.dart';
import 'package:grammer_checker/bloc/home_bloc/home_event.dart';
import 'package:grammer_checker/bloc/home_bloc/home_state.dart';
import 'package:grammer_checker/data/global.dart';
import 'package:grammer_checker/screen/favorite_screen.dart';
import 'package:grammer_checker/widget/alert.dart';
import 'package:grammer_checker/widget/main_text_filed.dart';
import 'package:grammer_checker/widget/primary_button.dart';
//import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController askController = TextEditingController();

  String responseMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AI ",
                          style: TextStyle(
                              color: Color(0xff5F5BFF),
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Grammer Checker",
                          style: TextStyle(),
                        )
                      ],
                    ),
                    Text(
                      "Welcome back ${currentUser.name}!",
                      style: const TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FavoriteScreen(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  /*child: badges.Badge(
                        badgeStyle: const badges.BadgeStyle(
                          badgeColor: Color(0xff5F5BFF),
                        ),
                        badgeContent: Text(
                          "${favorite.length}",
                          style: const TextStyle(color: Colors.white),
                        ),*/
                  child: ClipOval(
                    child: Container(
                      width: 40,
                      height: 40,
                      color: const Color(0xffF5F4F3),
                      child: Icon(
                        Icons.bookmark,
                        color: const Color(0xff5F5BFF).withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
            ]),
            MainTextFiled(controller: askController),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: BlocBuilder<HomeBolc, HomeState>(
                            builder: (context, state) {
                          if (state is SuccessState) {
                            return Text(state.answerGPT);
                          }
                          return Container();
                        })),
                  ),
                )),
            PrimaryButton(
              backgroundColor: const Color(0xff5F5BFF),
              titleColor: Colors.white,
              title: 'Check',
              onpressed: () {
                context
                    .read<HomeBolc>()
                    .add(CheckEvent(askController: askController.text));
              },
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height - 790,
              child: BlocListener<HomeBolc, HomeState>(
                listener: (context, state) {
                  if (state is SuccessAddState) {
                    showSuccessSnackBar(context, state.successMassage);
                  } else if (state is ErrorAddState) {
                    showErrorSnackBar(context, state.errorMassage);
                  }
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  onPressed: () {
                    context.read<HomeBolc>().add(AddToFavoriteEvent());
                  },
                  child: const Text(
                    'Add to favorite',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff5F5BFF),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
