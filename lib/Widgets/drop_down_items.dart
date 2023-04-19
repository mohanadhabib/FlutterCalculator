import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownItems extends StatelessWidget {
  String title;
  DropDownItems({required this.title});
  Widget build(BuildContext context) {
    return DropdownMenuItem(
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Color.fromARGB(255, 53, 53, 53),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
