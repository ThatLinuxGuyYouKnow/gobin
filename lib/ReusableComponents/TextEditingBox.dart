import 'package:flutter/material.dart';

class TextEditingBox extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            style: TextStyle(fontFamily: 'Ubuntu', fontSize: 15),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ));
  }
}

class DiscreteTextEditingBox extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        width: screenWidth,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.green)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            style: TextStyle(fontFamily: 'Ubuntu', fontSize: 15),
            obscureText: true,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ));
  }
}
