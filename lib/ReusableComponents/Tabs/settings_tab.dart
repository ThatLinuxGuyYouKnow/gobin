import 'package:flutter/material.dart';

class SettingsTab extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight * .1,
        width: screenWidth * 0.9,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child: Row());
  }
}
