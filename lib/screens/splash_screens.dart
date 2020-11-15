import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/on_boarding_screen.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import 'package:splashscreen/splashscreen.dart';

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
          child: SplashScreen(
            routeName: '/',
            backgroundColor: Colors.lightBlueAccent,
            imageBackground: AssetImage('assets/images/a1.png'),
            photoSize: 180,
            seconds: 2,
            loadingText: Text('Loading...'),
            loaderColor: Colors.yellow,
            navigateAfterSeconds: MyApp(),
          ),
        ),
      ),
    );
  }
}
