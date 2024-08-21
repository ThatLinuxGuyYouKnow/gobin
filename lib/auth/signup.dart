import 'package:flutter/material.dart';
import 'package:gobin/ReusableComponents/CustomButton.dart';
import 'package:gobin/ReusableComponents/CustonTexts.dart';
import 'package:gobin/ReusableComponents/TextEditingBox.dart';
import 'package:gobin/auth/login.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: screenHeight * 0.1),
            Row(
              children: [
                SizedBox(width: screenWidth * 0.05),
                StandardText(
                  text: 'SignUp',
                  fontTextSize: 28,
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.09),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      StandardText(
                        text: 'Email Address',
                        fontTextSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  TextEditingBox()
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  Row(
                    children: [
                      StandardText(
                        text: 'Password',
                        fontTextSize: 16,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  DiscreteTextEditingBox(),
                  SizedBox(height: screenHeight * 0.06),
                  CustomButton(
                    buttonText: 'Sign Up',
                    onButtonPressed: () {
                      Navigator.pushNamed(context, '/main');
                    },
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  StandardOutlineButton(
                    buttonText: 'Already Have an Account?',
                    onButtonPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => Login(),
                        ),
                      );
                    },
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
