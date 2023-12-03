import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expo2030/cubit/chat_cubit.dart';
import 'package:flutter_expo2030/cubit/chat_state.dart';

class OpenAiScreen extends StatefulWidget {
  @override
  State<OpenAiScreen> createState() => _OpenAiScreenState();
}

class _OpenAiScreenState extends State<OpenAiScreen> {
  TextEditingController controllerAsk = TextEditingController();
  bool isTextFieldEmpty = true;

  @override
  Widget build(BuildContext context) {
    //final ChatCubit chatCubit = context.read<ChatCubit>();

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        // flexibleSpace: Container(
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(colors: [
        //       Color.fromARGB(255, 141, 220, 154),
        //       Color.fromARGB(255, 159, 222, 182),
        //     ]),
        //   ),
        // ),
        centerTitle: true,
        title: const Text(
          'ChatGpt For Expo',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          itemCount: state.chatMessages.length,
                          itemBuilder: (context, index) {
                            return ChatMessageWidget(
                              title: state.chatMessages[index].title,
                              isUser: state.chatMessages[index].isUser,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                flex: 4,
                                child: TextField(
                                  controller: controllerAsk,
                                  onChanged: (text) {
                                    setState(() {
                                      isTextFieldEmpty = text.isEmpty;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                    hintText: 'Curious about the best?',
                                    hintStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 159, 200, 222),
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.only(left: 10),
                                  ),
                                ),
                              ),
                              AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                child: isTextFieldEmpty
                                    ? Container()
                                    : IconButton(
                                        key: Key('send_icon'),
                                        icon: Icon(Icons.send,
                                            color: Colors.black),
                                        onPressed: isTextFieldEmpty
                                            ? null
                                            : () {
                                                context
                                                    .read<ChatCubit>()
                                                    .sendMessage(
                                                        controllerAsk.text);

                                                controllerAsk.clear();
                                              },
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (state.isLoading)
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({Key? key, required this.title, required this.isUser})
      : super(key: key);

  final String title;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        padding: EdgeInsets.all(8),
        margin: isUser
            ? EdgeInsets.only(top: 16, right: 4, left: 25)
            : EdgeInsets.only(top: 16, left: 4, right: 25),
        alignment: Alignment.center,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isUser
              ? Color.fromARGB(255, 141, 220, 154)
              : Color.fromARGB(255, 129, 182, 148),
        ),
      ),
    );
  }
}
