import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      extendBody: true,
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
}
