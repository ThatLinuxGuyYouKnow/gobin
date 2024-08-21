import 'package:flutter/material.dart';

class LoaderOverlay extends StatelessWidget {
  LoaderOverlay({super.key, required this.mainWidgy});

  /// widget beneath the loader
  final Widget mainWidgy;
  Widget build(BuildContext context) {
    return Stack(
      children: [mainWidgy, OverLoader()],
    );
  }
}

class OverLoader extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.2,
      width: screenWidth * .1,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }
}
