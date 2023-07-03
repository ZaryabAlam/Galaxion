import 'dart:async';

import 'package:flutter/material.dart';
import 'package:galaxion/dashboard.dart';
import 'package:galaxion/screens/username_Page.dart';
import 'package:galaxion/utils/constants.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  String? myUsername = "";

  Future getSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('savedUsername');
    setState(() {
      myUsername = savedUsername ?? 'Not Registered!';
      print("Shared Preferences SplashScreen: $myUsername");
      // print("Shared Preferences Response2: $savedUsername");
    });
  }

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
    getSavedText();
    Timer(Duration(seconds: 2), () {
      if (myUsername == 'Not Registered!') {
        Get.to(() => UsernamePage());
      } else {
        Get.to(() => Dashboard());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: gradientEndColor,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: 130,
                    width: 130,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _controller.value * 2 * math.pi,
                          child: child,
                        );
                      },
                      child: Image(
                        image: AssetImage("logo1.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ]),
          ),
        ));
  }
}
