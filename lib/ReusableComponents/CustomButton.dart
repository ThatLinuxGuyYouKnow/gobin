import 'package:flutter/material.dart';
import 'package:gobin/ReusableComponents/CustonTexts.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;

  CustomButton(
      {super.key, required this.buttonText, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.1,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.green), // Set your desired color here
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  20.0), // Set your desired border radius here
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Ubuntu',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onButtonPressed,
      ),
    );
  }
}

class StandardOutlineButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onButtonPressed;

  StandardOutlineButton(
      {super.key, required this.buttonText, required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.1,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
                Colors.white), // Set your desired color here
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                side: BorderSide(),
                borderRadius: BorderRadius.circular(
                    20.0), // Set your desired border radius here
              ),
            ),
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Ubuntu',
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onButtonPressed),
    );
  }
}
