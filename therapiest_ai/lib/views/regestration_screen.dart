import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:therapiest_ai/consts/colors.dart';
import 'package:therapiest_ai/global/globals.dart';
import 'package:therapiest_ai/services/extentions.dart';
import 'package:therapiest_ai/views/therapiest_screen.dart';
import 'package:therapiest_ai/widget/gender_widget.dart';
import 'package:therapiest_ai/widget/my_button_widget.dart';
import 'package:therapiest_ai/widget/my_textfield.dart';

class RegestrationScreen extends StatelessWidget {
  const RegestrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: scaffoldColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              Text(
                'RegestrationScreen.title'.tr(),
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),
              Align(
                  alignment: context.locale.toString() == "en_US"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    'RegestrationScreen.nameStatement'.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )),
              MyTextFeild(
                myController: nameController,
                hint: 'RegestrationScreen.hintText'.tr(),
              ),
              const SizedBox(height: 50),
              Align(
                  alignment: context.locale.toString() == "en_US"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Text(
                    'RegestrationScreen.genderStatement'.tr(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
                  )),
              const FittedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GenderChoiceChip(gender: 'female'),
                  GenderChoiceChip(gender: 'male'),
                ]),
              ),
              const SizedBox(height: 100),
              MyButton(
                  w: 300,
                  onPressed: () {
                    currentUserName = nameController.text.trim();
                    context.pushScreen(const TherapistsScreen());
                  },
                  child: Text('RegestrationScreen.RegButton'.tr())),
            ],
          ),
        ),
      ),
    );
  }
}
