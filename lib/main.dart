import 'package:flutter/material.dart';
import 'package:galaxion/screens/about_page.dart';
import 'package:galaxion/screens/home.dart';
import 'package:galaxion/screens/search_page.dart';
import 'package:galaxion/screens/username_Page.dart';
import 'package:galaxion/utils/constants.dart';
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
      // home: Home(),
      home: AnimatedSplashScreen(
          splash: Image.asset("logo1.png"),
          backgroundColor: gradientStartColor,
          splashTransition: SplashTransition.rotationTransition,
          animationDuration: Duration(seconds: 5),
          duration: 1000,
          splashIconSize: 150,
          nextScreen: UsernamePage()),
    );
  }
}
