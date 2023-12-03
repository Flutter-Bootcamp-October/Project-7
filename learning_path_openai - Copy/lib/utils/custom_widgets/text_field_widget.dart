// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key, required this.controller, required this.labelText});

  TextEditingController controller = TextEditingController();
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Theme.of(context).brightness == Brightness.dark
          ? const Color.fromARGB(162, 255, 255, 255)
          : Color.fromARGB(199, 25, 63, 94),
      controller: controller,
      style: TextStyle(
        fontSize: 18,
        fontFamily: 'Tinos',
        fontWeight: FontWeight.w600,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Color.fromARGB(255, 20, 53, 81),
      ),
      decoration: InputDecoration(
          // prefix: const Icon(
          //   Icons.search_rounded,
          //   color: Color.fromARGB(255, 31, 71, 104),
          // ),
          contentPadding: const EdgeInsets.only(left: 20),
          fillColor: Theme.of(context).brightness == Brightness.dark
              ? const Color.fromARGB(117, 48, 90, 124)
              : Color.fromARGB(99, 170, 170, 170),
          filled: true,
          hintText: labelText,
          hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(173, 255, 255, 255)
                  : Color.fromARGB(188, 20, 53, 81),
              fontFamily: 'Tinos',
              fontSize: 18,
              fontWeight: FontWeight.w600),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10))),
    );
  }
}
