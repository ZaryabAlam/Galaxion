import 'package:flutter/material.dart';
import 'package:galaxion/screens/about_page.dart';
import 'package:galaxion/screens/home.dart';
import 'package:galaxion/screens/search_page.dart';
import 'package:galaxion/utils/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: myNavigationBar(),
    );
  }

////////////////////////////////Navigation Bar//////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////
  Widget myNavigationBar() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: navigationColor,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36),
          )),
      padding: EdgeInsets.all(10),
      child: BottomNavigationBar(
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: const IconThemeData(color: Colors.black, size: 30),
        selectedItemColor: Colors.black,
        backgroundColor: navigationColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        selectedFontSize: 10,
        iconSize: 25,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? const Icon(
                    Icons.home_rounded,
                  )
                : const Icon(
                    Icons.home_outlined,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? const Icon(
                    Icons.credit_card_rounded,
                  )
                : const Icon(
                    Icons.credit_card_outlined,
                  ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? const Icon(
                    Icons.category_rounded,
                  )
                : const Icon(
                    Icons.category_outlined,
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
}
