import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:galaxion/models/planet_data.dart';

import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final _h = MediaQuery.of(context).size.height;
    final _w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: gradientEndColor,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, gradientEndColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Explore",
                        textAlign: TextAlign.left,
                        style: newStyle(FontWeight.w900, 44, Colors.white),
                      ),
                      DropdownButton(
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              "Solar System",
                              textAlign: TextAlign.left,
                              style:
                                  newStyle(FontWeight.w500, 24, Colors.white54),
                            ),
                          )
                        ],
                        onChanged: ((value) {}),
                        underline: SizedBox(),
                        icon: Icon(Icons.keyboard_arrow_down_rounded),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 500,
                  // width: 500,
                  padding: EdgeInsets.only(left: 28),
                  child: Swiper(
                    itemCount: planets.length,
                    // itemWidth: _w - 2 * 70,
                    itemWidth: 300,
                    layout: SwiperLayout.STACK,

                    pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                            activeSize: 20,
                            space: 8,
                            color: secondaryTextColor)),
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 50),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(32)),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 30),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 100),
                                      Text(
                                        planets[index].name,
                                        style: newStyle(
                                            FontWeight.w900, 40, Colors.black),
                                      ),
                                      Text(
                                        "Solar System",
                                        style: newStyle(FontWeight.w500, 24,
                                            Colors.black54),
                                      ),
                                      SizedBox(height: 30),
                                      Row(
                                        children: [
                                          Text(
                                            "Know more",
                                            style: newStyle(FontWeight.w300, 24,
                                                secondaryTextColor),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: secondaryTextColor,
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Container(
                              height: 250,
                              width: 250,
                              child: Image(
                                image: AssetImage(planets[index].iconImage),
                                fit: BoxFit.contain,
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: navigationColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(36),
            )),
        padding: EdgeInsets.all(24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.menu_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined)),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.person_outline_rounded))
          ],
        ),
      ),
    );
  }
}
