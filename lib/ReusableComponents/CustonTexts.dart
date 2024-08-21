import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StandardText extends StatelessWidget {
  StandardText({super.key, required this.text, this.fontTextSize});
  String text;
  double? fontTextSize;
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: 'Ubuntu',
            fontWeight: FontWeight.bold,
            fontSize: fontTextSize ?? 12));
  }
}
