import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_bloc.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_event.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_state.dart';
import 'package:learning_path_openai/utils/custom_widgets/app_bar_widget.dart';
import 'package:learning_path_openai/utils/custom_widgets/text_widget.dart';
import 'package:learning_path_openai/utils/extension/navigator.dart';

class SaveCoursesPath extends StatelessWidget {
  const SaveCoursesPath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
            context,
            'Favourite Courses Path',
            Container(),
            () {},
            IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 31, 71, 104),
                ))),
        body: BlocConsumer<AppBloc, AppState>(listener: (context, state) {
          if (state is LoadingState) {
            showDialog(
                context: context,
                builder: (context) => Center(
                        child: CircularProgressIndicator(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color.fromARGB(255, 255, 255, 255)
                          : const Color.fromARGB(255, 31, 71, 104),
                    )));
          } else if (state is ErrorAppState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        }, builder: (context, state) {
          if (state is GetCoursesPathAppState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  ...List.generate(state.coursePath.length, (index) {
                    return Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
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
                                      DeletePathCourseAppEvent(
                                          state.coursePath[index].courseId!));
                                },
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? const Color.fromARGB(207, 255, 255, 255)
                                      : const Color.fromARGB(255, 31, 71, 104),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text:
                                    '${index + 1} : ${state.coursePath[index].courseName!}',
                                colorText: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : const Color.fromARGB(255, 31, 71, 104),
                                fontFamilyText: 'Tinos',
                                fontWeightText: FontWeight.w700,
                                fontSizeText: 30,
                              ),
                              Divider(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : const Color.fromARGB(255, 31, 71, 104),
                              ),
                              TextWidget(
                                text: state.coursePath[index].coursePath!,
                                colorText: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : const Color.fromARGB(255, 31, 71, 104),
                                fontFamilyText: 'Tinos',
                                fontWeightText: FontWeight.w300,
                                fontSizeText: 17,
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
                ],
              ),
            );
          }
          return Container();
        }));
  }
}
