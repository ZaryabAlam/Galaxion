import 'package:flutter/material.dart';
import 'package:galaxion/screens/username_Page.dart';
import 'package:get/get.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

//test

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Galaxion",
        theme: ThemeData(
            primarySwatch: Colors.purple,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: true,
        home: AnimatedSplashScreen(
            splash: Image.asset("logo1.png"),
            backgroundColor: Colors.deepPurple.shade800,
            // splashTransition: SplashTransition.rotationTransition,
            // animationDuration: Duration(seconds: 5),
            // duration: 1000,
            // splashIconSize: 150,
            nextScreen: UsernamePage()));
  }
}
