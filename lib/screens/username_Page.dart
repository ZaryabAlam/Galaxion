import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:galaxion/dashboard.dart';
import 'package:galaxion/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:math' as math;
import 'package:intl/intl.dart';

import '../utils/mySnackbar.dart';

class UsernamePage extends StatefulWidget {
  const UsernamePage({super.key});

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage>
    with TickerProviderStateMixin {
  final usernameController = TextEditingController();
  var numberForm = GlobalKey<FormState>();
  bool isValidForm = false;
  bool isLoading = false;
  late AnimationController _controller;

  @override
  void dispose() {
    usernameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await exitDialog(context);
        return shouldPop!;
      },
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background1.jpg"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Form(
              key: numberForm,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 180,
                    width: 180,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedBuilder(
                      animation: _controller,
                      builder: (_, child) {
                        return Transform.rotate(
                          angle: _controller.value * 1.5 * math.pi,
                          child: child,
                        );
                      },
                      child:
                          Image.asset("assets/logo1.png", fit: BoxFit.contain),

                      // child: Image(
                      //   image: AssetImage("assets/logo1.png"),
                      //   fit: BoxFit.contain,
                      // ),
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    cursorColor: Colors.deepPurple,
                    cursorWidth: 8,
                    controller: usernameController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    style: newStyle(FontWeight.w600, 18, Colors.black54),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0),
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.black38),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50)
                                .copyWith(topLeft: Radius.circular(0)),
                            borderSide:
                                BorderSide(color: Colors.deepPurple.shade800)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(80))),
                    validator: (inputValue) {
                      if (inputValue!.isEmpty) {
                        return "Enter username";
                      } else if (inputValue.length < 6) {
                        return "Enter at least 6 letters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 55,
                    color: Colors.transparent,
                    child: TextButton(
                      onPressed: () {
                        if (numberForm.currentState!.validate()) {
                          setState(() async {
                            isValidForm = true;
                            isLoading = true;
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString('savedUsername',
                                usernameController.text.trim());
                            showLoaderDialog(context);
                            dataUpload(context);
                            // Get.to(() => Dashboard());
                          });
                        } else {
                          setState(() {
                            isValidForm = false;
                          });
                        }
                      },
                      style: TextButton.styleFrom(
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80)),
                          primary: Colors.purple,
                          backgroundColor: Colors.grey.shade200,
                          minimumSize: Size.fromHeight(70)),
                      child: Text("CONTINUE",
                          style: newStyle(FontWeight.w600, 18, Colors.black54)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ///////////////////////////// CONNECTIVITY /////////////////////////////
///////////////////////////////////////////////////////////////////////
  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  void initState() {
    super.initState();
    checkInternetConnectivity().then((isConnected) {
      if (!isConnected) {
        print("No Internet");
        showNoInternetDialog();
      } else {
        // setState(() {
        //   isConnected = true;
        // });
        print("Yes Internet");
      }
    });
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  void showNoInternetDialog() {
    print("No Internet");
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: infoDialogColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        title: Column(
          children: [
            Text("No Internet!",
                style: newStyle(FontWeight.w600, 32, Colors.black54)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Check your connection and try again."),
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
                  isLoading = true;
                  showLoaderDialog(context);
                  loader();
                  // Get.back();
                  // Get.to(() => UsernamePage());
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

  void loader() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      isLoading = false;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const UsernamePage()),
      );
      // Get.to(() => UsernamePage());
      // navigator!.pop();
    });
  }

  showLoaderDialog(BuildContext context) async {
    AlertDialog alert = loadingIcon();
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

////////////////////////Upload Username///////////////////////////////
//////////////////////////////////////////////////////////////////
  Future<bool?> dataUpload(BuildContext context) async {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat.jm().format(now);
    String formattedDate = DateFormat('EEE dd MMM yyyy').format(now);
    try {
      Map<String, dynamic> user = {
        "Username": usernameController.text.trim(),
        "CreateTime": formattedTime,
        "CreateDate": formattedDate,
      };
      await FirebaseFirestore.instance
          .collection('users')
          .doc(usernameController.text.trim())
          .set(user)
          .then((value) {
        Future.delayed(const Duration(seconds: 5));
        Get.showSnackbar(mySnackbar("Registration Successful!", Colors.green,
            Icons.check_circle_rounded));
        setState(() {
          isLoading = false;
          navigator!.pop();
        });
        Get.to(() => Dashboard());
      });
    } catch (e) {
      print(e.toString());
      Get.showSnackbar(mySnackbar(
          "Something went wrong!", Colors.red, Icons.warning_rounded));
    }

    return true;
  }

  AlertDialog loadingIcon() {
    return AlertDialog(
      backgroundColor: transparent,
      contentPadding: EdgeInsets.all(0),
      content: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.white60,
              shape: BoxShape.circle,
            ),
            child: AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 6 * math.pi,
                  child: child,
                );
              },
              child: Image.asset("assets/logo1.png", fit: BoxFit.contain),
            ),
          ),
          SizedBox(height: 10),
          Text("LOADING", style: newStyle(FontWeight.w600, 15, Colors.white60)),
        ],
      ),
    );
  }
}
