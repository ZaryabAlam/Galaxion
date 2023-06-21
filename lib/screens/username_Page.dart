import 'package:flutter/material.dart';
import 'package:galaxion/dashboard.dart';
import 'package:galaxion/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

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

  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    usernameController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          await prefs.setString(
                              'savedUsername', usernameController.text.trim());
                          Get.to(() => Dashboard());
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
    );
  }
}
