import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gobin/ReusableComponents/CustonTexts.dart';
import 'package:gobin/ReusableComponents/Tabs/balance-tab.dart';

class DefaultTile extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          color: Colors.green.withOpacity(.2),
          borderRadius: BorderRadius.circular(30)),
      height: screenHeight * .2,
      width: screenWidth * .385,
      child: Center(child: Text('12')),
    );
  }
}

class PlasticTab extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(.8),
              borderRadius: BorderRadius.circular(30)),
          height: screenHeight * .3,
          width: screenWidth * .4,
        ),
        Positioned(
          left: 30,
          top: 40,
          child: SizedBox(
            height: screenHeight * 0.27,
            width: screenWidth * 0.27,
            child: Image(
              image: AssetImage('assets/images/plastic.png'),
            ),
          ),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Plastics',
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 25, color: Colors.white),
            ))
      ],
    );
  }
}

class PaperTab extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(.8),
              borderRadius: BorderRadius.circular(30)),
          height: screenHeight * .3,
          width: screenWidth * .4,
        ),
        Positioned(
          left: 30,
          top: 40,
          child: SizedBox(
            height: screenHeight * 0.27,
            width: screenWidth * 0.27,
            child: Image(
              image: AssetImage('assets/images/paper.png'),
            ),
          ),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Paper',
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 25, color: Colors.white),
            ))
      ],
    );
  }
}

class MetalTab extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(.8),
              borderRadius: BorderRadius.circular(30)),
          height: screenHeight * .3,
          width: screenWidth * .4,
        ),
        Positioned(
          left: 30,
          top: 40,
          child: SizedBox(
            height: screenHeight * 0.27,
            width: screenWidth * 0.27,
            child: Image(
              image: AssetImage('assets/images/can.png'),
            ),
          ),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Metal',
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 25, color: Colors.white),
            ))
      ],
    );
  }
}

class GlassTab extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.green.withOpacity(.8),
              borderRadius: BorderRadius.circular(30)),
          height: screenHeight * .3,
          width: screenWidth * .4,
        ),
        Positioned(
          left: 30,
          top: 40,
          child: SizedBox(
            height: screenHeight * 0.27,
            width: screenWidth * 0.27,
            child: Image(
              image: AssetImage('assets/images/bottle.png'),
            ),
          ),
        ),
        Positioned(
            top: 20,
            left: 20,
            child: Text(
              'Glass',
              style: TextStyle(
                  fontFamily: 'Ubuntu', fontSize: 25, color: Colors.white),
            ))
      ],
    );
  }
}
