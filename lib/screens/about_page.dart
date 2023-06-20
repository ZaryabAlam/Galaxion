import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galaxion/utils/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String? myUsername = "";

  Future getSavedText() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUsername = prefs.getString('savedUsername');
    setState(() {
      myUsername = savedUsername ?? 'Not Registered';
      print("Shared Preferences Response1: $myUsername");
      print("Shared Preferences Response2: $savedUsername");
    });
  }

  @override
  void initState() {
    super.initState();
    getSavedText();
  }

  Widget build(BuildContext context) {
    HeightWidth(context);

    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("background1.jpg"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: () {
                            infoDialog(context);
                          },
                          child: FaIcon(FontAwesomeIcons.circleInfo,
                              color: Colors.white, size: 36))),
                ),
                SizedBox(height: h * 0.08),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Container(
                        height: 520,
                        width: 400,
                        color: transparent,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                                child: Container(
                                  height: 320,
                                  width: 320,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.white54,
                                          Colors.white10
                                        ]),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        width: 2, color: Colors.white38),
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20),
                                      Text(
                                        "$myUsername!",
                                        style: newStyle(FontWeight.w800, 28,
                                            titleTextColor),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "You're an Astronaut!",
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontFamily: "DancingScript",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 2,
                              child: FaIcon(
                                FontAwesomeIcons.userAstronaut,
                                color: Colors.white,
                                size: 150,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );

/////////////////////// Method 01 /////////////////////////////////////
///////////////////////////////////////////////////////////
    ///
    // return Scaffold(
    //   body: Center(
    //     child: Text(myUsername!),
    //   ),
    // );
/////////////////////// Method 02 /////////////////////////////////////
/////////////////////////////////////////////////////////
    ///
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('About Page'),
    //   ),
    // body: Center(
    //   child: Column(
    //     children: [
    //       Text("Shared Preferences $myUsername"),
    //       FutureBuilder<SharedPreferences>(
    //         future: SharedPreferences.getInstance(),
    //         builder: (BuildContext context,
    //             AsyncSnapshot<SharedPreferences> snapshot) {
    //           if (snapshot.hasData) {
    //             String savedText =
    //                 snapshot.data!.getString('savedUsername') ?? '';
    //             return Text(savedText);
    //           } else {
    //             return CircularProgressIndicator();
    //           }
    //         },
    //       ),
    //     ],
    //   ),
    // ),
    // );
  }

  Future<dynamic> infoDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: infoDialogColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        title: Column(
          children: [
            const Text(
              "Galaxion",
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Flutter 3.3.9"),
            Text("Version 1.0.1"),
            Text("\u00a9 DevCat | Zaryab Alam"),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: Container(
              height: 50,
              color: Colors.transparent,
              child: TextButton(
                onPressed: () {
                  Get.back();
                },
                style: TextButton.styleFrom(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80)),
                    primary: Colors.purple,
                    backgroundColor: Colors.grey.shade200,
                    minimumSize: Size.fromHeight(70)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("OKAY",
                        style: newStyle(FontWeight.w600, 18, Colors.black54)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
