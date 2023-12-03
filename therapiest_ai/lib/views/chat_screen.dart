import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapey_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_event.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_state.dart';
import 'package:therapiest_ai/consts/colors.dart';
import 'package:therapiest_ai/global/globals.dart';
import 'package:therapiest_ai/services/extentions.dart';
import 'package:therapiest_ai/views/therapiest_screen.dart';
import 'package:therapiest_ai/widget/chat_bubble.dart';
import 'package:therapiest_ai/widget/my_button_widget.dart';
import 'package:therapiest_ai/widget/my_textfield.dart';

bool showTyping = false;

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userTextController = TextEditingController();
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: scaffoldColor2,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  context.removeUnitl(const TherapistsScreen());
                },
                icon: const Icon(Icons.arrow_back)),
            actions: [
              IconButton(
                  onPressed: () {
                    if (context.locale.toString() == "en_US") {
                      context.setLocale(const Locale('ar', 'SA'));
                    } else {
                      context.setLocale(const Locale('en', 'US'));
                    }
                  },
                  icon: const Icon(Icons.translate)),
            ],
            title: Text('ChatScreen.appBarTitle'.tr()),
            backgroundColor: scaffoldColor,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocBuilder<TherapyBloc, TherapyState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  showTyping = true;
                } else {
                  showTyping = false;
                }
                return Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: chatList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ChatBubble(
                            text: chatList[index], isBotText: index % 2 != 0);
                      },
                    ) // <- Chat list view
                        ),
                    showTyping
                        ? Align(
                            alignment: Alignment.bottomLeft,
                            child: Image.asset(
                              'assets/images/loading.gif',
                              width: 150,
                              height: 80,
                            ),
                          )
                        : const Text(""),
                    Container(
                      width: 700,
                      height: 90,
                      color: scaffoldColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                                width: 220,
                                child: MyTextFeild(
                                  myController: userTextController,
                                  hint: 'ChatScreen.hintText'.tr(),
                                )),
                            MyButton(
                                w: 100,
                                onPressed: () {
                                  FocusManager.instance.primaryFocus?.unfocus();
                                  if (userTextController.text.isNotEmpty) {
                                    chatList
                                        .add(userTextController.text.trim());
                                    context.read<TherapyBloc>().add(
                                        UserMessageEvent(
                                            userMessage: userTextController.text
                                                .trim()));
                                  }
                                  userTextController.text = "";
                                },
                                child: Text('ChatScreen.chatButton'.tr()))
                          ],
                        ),
                      ),
                    ) // <- Fixed bottom TextField widget
                  ],
                );
              },
            ),
          )),
    );
  }
}
