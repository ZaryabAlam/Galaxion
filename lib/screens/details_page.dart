import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galaxion/utils/constants.dart';
import 'package:get/get.dart';

import '../models/planet_data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({super.key, required this.planetInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 300),
                      Text(
                        planetInfo.name ?? '',
                        style: newStyle(FontWeight.w900, 56, primaryTextColor),
                      ),
                      Text(
                        "Solar System",
                        style: newStyle(FontWeight.w300, 31, primaryTextColor),
                      ),
                      Divider(color: dividerColor),
                      SizedBox(height: 32),
                      Text(
                        planetInfo.description ?? '',
                        textAlign: TextAlign.justify,
                        // maxLines: 5,
                        // overflow: TextOverflow.ellipsis,
                        style: newStyle(FontWeight.w500, 20, contentTextColor),
                      ),
                      SizedBox(height: 32),
                      Divider(color: dividerColor),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Gallery",
                    style: newStyle(FontWeight.w300, 31, primaryTextColor),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: planetInfo.images.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image(
                              image: NetworkImage(planetInfo.images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          // Image.asset(planetInfo.iconImage)
          Positioned(
            top: 60,
            left: 32,
            child: Text(
              planetInfo.position.toString(),
              style: newStyle(
                  FontWeight.w900, 247, primaryTextColor.withOpacity(0.08)),
            ),
          ),
          Positioned(
            right: -60,
            child: Container(
              height: 300,
              width: 300,
              child: Hero(
                tag: planetInfo.position,
                child: Image(
                  image: AssetImage(planetInfo.iconImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 32,
            child: IconButton(
                onPressed: () => Get.back(),
                icon: FaIcon(FontAwesomeIcons.chevronLeft)),
          )
        ],
      )),
    );
  }
}
