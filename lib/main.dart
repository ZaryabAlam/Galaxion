import 'package:flutter/material.dart';
import 'package:galaxion/screens/splash_page.dart';
import 'package:get/get.dart';

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
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
