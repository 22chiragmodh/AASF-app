import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:flutter/material.dart';

class AppStackedImages extends StatelessWidget {
  final double topWidgetHeight = 200.0;
  final double avatarRadius = 50.0;
  const AppStackedImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        Column(
          children: [
            Text("1"),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset('assets/images/Vector.png',
                  color: Appcolors.yew()),
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: CircleAvatar(
                radius: 60.0,
                foregroundImage: AssetImage('assets/images/Ellipse 12.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Abhigyan",
                style: TextStyle(
                  color: Appcolors.white(),
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "Abhikaushalam",
                style: TextStyle(
                  color: Appcolors.white(),
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              "1200",
              style: TextStyle(
                color: Appcolors.yew(),
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 60, top: 40),
            child: Column(
              children: [
                Text("2"),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset('assets/images/Polygon 1.png',
                      color: Appcolors.yew()),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/Ellipse 13.png')),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Abhigyan",
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Abhikaushalam",
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "1000",
                  style: TextStyle(
                    color: Appcolors.yew(),
                  ),
                ),
              ],
            )),
        Container(
            margin: const EdgeInsets.only(left: 238, top: 40),
            child: Column(
              children: [
                Text("3"),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset('assets/images/Polygon 2.png',
                      color: Appcolors.white()),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset('assets/images/Ellipse 14.png')),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Abhigyan",
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Abhikaushalam",
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  "1100",
                  style: TextStyle(
                    color: Appcolors.yew(),
                  ),
                ),
              ],
            )),
      ]),
    );
  }
}
