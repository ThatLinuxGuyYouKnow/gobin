import 'package:flutter/material.dart';

class NewsTab extends StatelessWidget {
  final double high; //screenHeight
  final double wide; //screenWidth
  NewsTab({super.key, required this.high, required this.wide});
  Widget build(BuildContext context) {
    return Container(
        height: high * .2,
        width: wide * .7,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 1.5)));
  }
}
