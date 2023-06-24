import 'package:flutter/material.dart';
import 'package:galaxion/screens/splash_page.dart';

import 'package:get/get.dart';

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
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // home: AnimatedSplashScreen(
      //     splash: Image.asset("logo1.png"),
      //     backgroundColor: gradientStartColor,
      //     splashTransition: SplashTransition.rotationTransition,
      //     animationDuration: Duration(seconds: 5),
      //     duration: 1000,
      //     splashIconSize: 150,
      //     nextScreen: UsernamePage()),
    );
  }
}
