import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Color primaryTextColor = Color(0xFF414C6B);
Color secondaryTextColor = Color(0xFFE4979E);
Color titleTextColor = Colors.white;
Color contentTextColor = Color(0xff868686);
Color navigationColor = Color(0xFF6751B5);
Color gradientStartColor = Color(0xFF0050AC);
Color gradientEndColor = Color(0xFF9354B9);
Color dividerColor = Colors.black38;
Color transparent = Colors.transparent;
Color infoDialogColor = Colors.blueGrey.shade500;

late double w, h;

void HeightWidth(BuildContext context) {
  h = MediaQuery.of(context).size.height;
  w = MediaQuery.of(context).size.width;
}

TextStyle newStyle(fWeight, fSize, fColor) {
  return TextStyle(
      fontFamily: "Avenir",
      fontSize: fSize,
      color: fColor,
      fontWeight: fWeight);
}

TextStyle astStyle(fsize) {
  return TextStyle(
    fontSize: fsize,
    color: Colors.white,
    fontFamily: "DancingScript",
  );
}

Future<bool?> exitDialog(BuildContext context) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: infoDialogColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
        title: Column(
          children: [
            Text('Exit', style: newStyle(FontWeight.w600, 32, Colors.black54)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20),
            Text('Are you sure you want to exit?',
                style: newStyle(FontWeight.w300, 18, Colors.black45)),
            SizedBox(height: 20),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    style: TextButton.styleFrom(
                        elevation: 0,
                        side: const BorderSide(color: Colors.black54, width: 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        primary: Colors.black,
                        backgroundColor: Colors.transparent,
                        minimumSize: Size.fromHeight(70)),
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Container(
                  height: 40,
                  width: 80,
                  child: TextButton(
                    onPressed: () {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    style: TextButton.styleFrom(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        primary: Colors.purple,
                        backgroundColor: Colors.grey.shade200,
                        minimumSize: Size.fromHeight(70)),
                    child: Text('Yes',
                        style: newStyle(FontWeight.w600, 16, Colors.black54)),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
