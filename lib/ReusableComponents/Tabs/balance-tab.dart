import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gobin/ReusableComponents/CustonTexts.dart';

class ClovesBalanceTab extends StatelessWidget {
  final double height;
  final double width;
  final String balance;
  ClovesBalanceTab(
      {super.key,
      required this.height,
      required this.width,
      required this.balance});

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: height * 0.2,
            width: width * 0.85,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    balance,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                        fontSize: 30,
                        color: Colors.white),
                  ),
                  Divider(
                    height: 12,
                    thickness: 30,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(20))),
      ],
    );
  }
}

class GlassOverlay extends StatelessWidget {
  final double? height;
  final double? width;
  const GlassOverlay({super.key, this.height, this.width});

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: height ?? screenWidth * 0.85,
      height: screenHeight * 0.2,
      child: Stack(
        children: [
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10)),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.2)
            ])),
          )
        ],
      ),
    );
  }
}

class BalancePod extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(),
    );
  }
}
