import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

import '../main.dart';

class SplashScreens extends StatefulWidget {
  static const routeName = '/';

  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: FlutterSplashScreen(
            backgroundColor: Theme.of(context).primaryColor,
            splashScreenBody: Image.asset('assets/images/a1.png'),
            duration: Duration(seconds: 2),
            nextScreen: MyApp(),
          ),
        ),
      ),
    );
  }
}
