import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String text;

  SearchWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Icon(Icons.replay_10_outlined),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
