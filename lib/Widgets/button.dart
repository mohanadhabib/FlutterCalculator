import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Button extends StatelessWidget {
  String text;
  double fontSize;
  Color? fontColor;
  Color? backgroundColor;
  Color? operationColor;
  Color? clearColor;

  Button(this.text, this.fontColor, this.backgroundColor,
      {this.fontSize = 25, this.clearColor, this.operationColor});

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.19,
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.width * 0.50),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: fontColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
