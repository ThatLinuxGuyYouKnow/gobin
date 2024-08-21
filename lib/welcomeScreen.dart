import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        SizedBox(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  child:
                      const Image(image: AssetImage('assets/demo-logo.png'))),
              const Text('GoBin',
                  style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 27,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: screenHeight * 0.06),
              Container(
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
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
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
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    }),
              )
            ],
          ),
        )
      ],
    ));
  }
}
