import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gobin/News%20Wigdets/news-tab.dart';
import 'package:gobin/ReusableComponents/CustonTexts.dart';
import 'package:gobin/ReusableComponents/Tabs/balance-tab.dart';
import 'package:gobin/ReusableComponents/Tabs/defaultTile.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              DaBloon(daBloonCount: '200'),
              SizedBox(height: screenHeight * 0.03),
              ClovesBalanceTab(
                height: screenHeight,
                width: screenWidth,
                balance: '231',
              ),
              SizedBox(height: screenHeight * .04),
              Row(
                children: [
                  StandardText(
                    text: 'Disposal Tips',
                    fontTextSize: 20,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .04),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PaperTab(),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    PlasticTab(),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    MetalTab(),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    GlassTab()
                  ],
                ),
              ),
              SizedBox(height: screenHeight * .04),
              Row(
                children: [
                  StandardText(
                    text: 'News Around you',
                    fontTextSize: 20,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .04),
              NewsTab(high: screenHeight, wide: screenHeight)
            ],
          ),
        ),
      ),
    );
  }
}

class DaBloon extends StatelessWidget {
  String daBloonCount;
  DaBloon({super.key, required this.daBloonCount});

  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          daBloonCount,
          style: TextStyle(fontFamily: 'Ubuntu', fontSize: 20),
        ),
        SizedBox(width: 20),
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage('assets/images/shell.png'),
        )
      ],
    );
  }
}
