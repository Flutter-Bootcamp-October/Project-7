// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_bloc.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_event.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_state.dart';
import 'package:learning_path_openai/Bloc/theme_bloc/app_bloc.dart';
import 'package:learning_path_openai/Bloc/theme_bloc/app_event.dart';
import 'package:learning_path_openai/utils/custom_widgets/app_bar_widget.dart';
import 'package:learning_path_openai/utils/custom_widgets/text_field_widget.dart';
import 'package:learning_path_openai/utils/custom_widgets/text_widget.dart';
import 'package:learning_path_openai/utils/extension/navigator.dart';
import 'package:learning_path_openai/view/save_course_path_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  TextEditingController courseNameController = TextEditingController();
  String answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
            context,
            'Learning Courses Path',
            Icon(
              Icons.list_rounded,
              size: 30,
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 255, 255, 255)
                  : const Color.fromARGB(255, 31, 71, 104),
            ), () {
          context.push(page: const SaveCoursesPath());
          context.read<AppBloc>().add(GetFavPathCourseAppEvent());
        }, null),
        drawer: Drawer(
            backgroundColor: Theme.of(context).brightness == Brightness.dark
                ? const Color.fromARGB(255, 31, 71, 104)
                : const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
              child: Column(
                children: [
                  TextWidget(
                    text: 'Settings',
                    fontFamilyText: 'Tinos',
                    fontWeightText: FontWeight.w400,
                    fontSizeText: 30,
                    colorText: Theme.of(context).brightness == Brightness.dark
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color.fromARGB(255, 31, 71, 104),
                  ),
                  Divider(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : const Color.fromARGB(255, 31, 71, 104),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: 'Theme',
                        fontFamilyText: 'Tinos',
                        fontWeightText: FontWeight.w500,
                        fontSizeText: 18,
                        colorText:
                            Theme.of(context).brightness == Brightness.dark
                                ? const Color.fromARGB(255, 255, 255, 255)
                                : const Color.fromARGB(255, 31, 71, 104),
                      ),
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<ThemeBloc>()
                                    .add(ChangeThemeEvent('dark'));
                              },
                              icon: Icon(
                                Icons.nightlight_round_sharp,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 31, 71, 104),
                              )),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<ThemeBloc>()
                                    .add(ChangeThemeEvent('light'));
                              },
                              icon: Icon(
                                Icons.sunny,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 31, 71, 104),
                              ))
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // --------------  Ask OpenAI  -------------------

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    Flexible(
                      flex: 4,
                      child: TextFieldWidget(
                        controller: courseNameController,
                        labelText: 'Search By Cousre Name',
                      ),
                    ),
                    BlocBuilder<AppBloc, AppState>(
                      builder: (context, state) {
                        return Flexible(
                          flex: 1,
                          child: TextWidget(
                            colorText:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 31, 71, 104),
                            text: 'Send',
                            fontFamilyText: 'Tinos',
                            fontWeightText: FontWeight.w400,
                            fontSizeText: 20,
                            onPressed: () {
                              context.read<AppBloc>().add(
                                  UpdateAppEvent(courseNameController.text));
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),

              // --------------  Response  -------------------

              BlocConsumer<AppBloc, AppState>(listener: (context, state) {
                if (state is LoadingState) {
                  showDialog(
                      context: context,
                      builder: (context) => Center(
                              child: CircularProgressIndicator(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? const Color.fromARGB(255, 255, 255, 255)
                                    : const Color.fromARGB(255, 31, 71, 104),
                          )));
                } else if (state is ErrorAppState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                }
              }, builder: (context, state) {
                if (state is UpdateAppState) {
                  context.pop();
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    alignment: Alignment.center,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(5, 10),
                              blurRadius: 300,
                              color: Color.fromARGB(34, 0, 0, 0))
                        ],
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color.fromARGB(190, 31, 71, 104)
                            : const Color.fromARGB(204, 255, 255, 255),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {
                                context.read<AppBloc>().add(
                                    AddFavPathCourseAppEvent(
                                        courseNameController.text,
                                        state.responeContent));
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 30,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? const Color.fromARGB(207, 255, 255, 255)
                                    : const Color.fromARGB(255, 31, 71, 104),
                              ),
                            ),
                          ],
                        ),
                        TextWidget(
                          text: state.responeContent,
                          colorText:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.white
                                  : const Color.fromARGB(255, 31, 71, 104),
                          fontFamilyText: 'Tinos',
                          fontWeightText: FontWeight.w300,
                          fontSizeText: 17,
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              })
            ],
          ),
        ));
  }
}
