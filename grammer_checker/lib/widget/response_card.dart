import 'package:flutter/material.dart';

class ResponseCard extends StatelessWidget {
  const ResponseCard({super.key, required this.responseText});
  final String responseText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(responseText),
          ),
        ),
      ),
    );
  }
}
