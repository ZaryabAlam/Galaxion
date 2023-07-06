import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:galaxion/screens/details_page.dart';
import 'package:galaxion/utils/constants.dart';

import '../models/planet_data.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();

  List<PlanetInfo> filteredPlanets = [];
  void filterPlanets(String query) {
    setState(() {
      filteredPlanets = planets
          // ignore: non_constant_identifier_names
          .where((PlanetInfo) =>
              PlanetInfo.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredPlanets = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentTextColor,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [gradientStartColor, contentTextColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  TextFormField(
                    cursorColor: Colors.deepPurple,
                    cursorWidth: 8,
                    controller: searchController,
                    onChanged: filterPlanets,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    style: newStyle(FontWeight.w600, 18, Colors.black54),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 30.0),
                        hintText: "Search a planet",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: FaIcon(FontAwesomeIcons.magnifyingGlass),
                        ),
                        hintStyle: TextStyle(color: Colors.black38),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15).copyWith(),
                            borderSide:
                                BorderSide(color: Colors.deepPurple.shade800)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(80))),
                    // validator: (inputValue) {
                    //   if (inputValue!.isEmpty) {
                    //     return "Enter username";
                    //   } else if (inputValue.length < 6) {
                    //     return "Enter at least 6 letters";
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 10),
                  if (searchController.text.isNotEmpty &&
                      filteredPlanets.isNotEmpty)
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredPlanets.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Material(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          PageRouteBuilder(
                                            pageBuilder: (context, a, b) =>
                                                DetailPage(
                                                    planetInfo:
                                                        filteredPlanets[index]),
                                          ));
                                    },
                                    child: ListTile(
                                      leading: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Image(
                                          image: AssetImage(
                                              filteredPlanets[index].iconImage),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      title: Text(
                                        filteredPlanets[index].name,
                                        style: newStyle(FontWeight.w600, 18,
                                            Colors.black54),
                                      ),
                                      subtitle: Text(
                                        "Solar System",
                                        style: newStyle(FontWeight.w500, 15,
                                            Colors.black45),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.white54,
                              ),
                            ],
                          );
                        },
                      ),
                    )
                  else
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        searchController.text.isEmpty
                            ? 'Search'
                            : 'No result found',
                        style: newStyle(FontWeight.w600, 18, Colors.black54),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
