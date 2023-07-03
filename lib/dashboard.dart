import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galaxion/screens/about_page.dart';
import 'package:galaxion/screens/home.dart';
import 'package:galaxion/screens/search_page.dart';
import 'package:galaxion/utils/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:math' as math;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool isLoading = false;
  late AnimationController _controller;

  static const List<Widget> _pages = <Widget>[
    Home(),
    SearchPage(),
    AboutPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void dispose() {
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
      child: Scaffold(
        extendBody: true,
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: myNavigationBar(),
      ),
    );
  }

////////////////////////////////Navigation Bar//////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
  Widget myNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          color: navigationColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          )),
      padding: EdgeInsets.all(1),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 22),
        selectedItemColor: Colors.black,
        backgroundColor: Colors.transparent,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        selectedFontSize: 10,
        iconSize: 20,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const FaIcon(FontAwesomeIcons.houseChimney)
                : const Icon(
                    Icons.home_outlined,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? FaIcon(FontAwesomeIcons.magnifyingGlass)
                : const Icon(
                    Icons.search_rounded,
                  ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const FaIcon(FontAwesomeIcons.userAstronaut)
                : const Icon(
                    Icons.person_outline_rounded,
                  ),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

///////////////////////////////////// END ///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
  ///  ///////////////////////////// CONNECTIVITY /////////////////////////////
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
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
      // Get.to(() => UsernamePage());
      // navigator!.pop();
    });
  }

  showLoaderDialog(BuildContext context) async {
    AlertDialog alert = AlertDialog(
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
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
////////////////////////CONNECTIVITY///////////////////////////////
//////////////////////////////////////////////////////////////////

}
