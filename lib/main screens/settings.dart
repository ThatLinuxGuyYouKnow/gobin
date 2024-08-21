import 'package:flutter/material.dart';
import 'package:gobin/ReusableComponents/Tabs/settings_tab.dart';

class Settings extends StatelessWidget {
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Ubuntu'),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            children: [SettingsTab()],
          ),
        ),
      ),
    );
  }
}
