// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:learning_path_openai/utils/custom_widgets/text_widget.dart';

PreferredSizeWidget AppBarWidget(BuildContext context, String appBarTitle,
    Widget IconWidget, Function()? onPress, Widget? Leading) {
  return AppBar(
    title: TextWidget(
      text: appBarTitle,
      fontSizeText: 24,
      fontFamilyText: 'Tinos',
      fontWeightText: FontWeight.bold,
      colorText: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(216, 255, 255, 255)
          : const Color.fromARGB(255, 31, 71, 104),
    ),
    backgroundColor: Theme.of(context).brightness == Brightness.dark
        ? const Color.fromARGB(180, 31, 71, 104)
        : const Color.fromARGB(139, 186, 186, 186),
    centerTitle: true,
    leading: Leading,
    actions: [IconButton(onPressed: onPress, icon: IconWidget)],
  );
}
