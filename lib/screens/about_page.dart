import 'package:flutter/material.dart';
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
      myUsername = savedUsername ?? '';
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
    return Scaffold(
      body: Center(
        child: Text(myUsername!),
      ),
    );
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
}
