import 'package:flutter/material.dart';

class TaperedContainer extends StatefulWidget {
  final String category;

  TaperedContainer({required this.category});

  @override
  _TaperedContainerState createState() => _TaperedContainerState();
}

class _TaperedContainerState extends State<TaperedContainer> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: _isSelected
              ? Colors.amber
              : const Color.fromARGB(255, 209, 209, 209),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.category,
            style: TextStyle(
              color: _isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
