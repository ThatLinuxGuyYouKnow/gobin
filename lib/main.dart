import 'package:flutter/material.dart';
import 'package:gobin/Initializers/permissionHandler.dart';
import 'package:gobin/ReusableComponents/loaderOverlay.dart';
import 'package:gobin/auth/login.dart';
import 'package:gobin/auth/signup.dart';
import 'package:gobin/main%20screens/dashboard.dart';
import 'package:gobin/main%20screens/main_screen.dart';
import 'package:gobin/main%20screens/scan_waste.dart';
import 'package:gobin/main%20screens/settings.dart';
import 'package:gobin/welcomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkIfThisIsFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first');
    if (firstTime == null) {
      print("first time ? yes");

      return true;
    }
    print("first time ? nah!");
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/signup': (context) => SignUp(),
        '/login': (context) => Login(),
        '/welcome': (context) => WelcomeScreen(),
        '/main': (context) => MainScreens(),
        '/settings': (context) => Settings(),
        '/scan': (context) => ScanWaste(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future: checkIfThisIsFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            bool isFirstTime = snapshot.data ?? false;

            if (isFirstTime) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                PermissionManger().requestPermissions(context);
              });
            }

            return LoaderOverlay(
              mainWidgy: WelcomeScreen(),
            );
          }
        },
      ),
    );
  }
}
