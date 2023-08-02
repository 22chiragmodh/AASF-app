import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:flutter/material.dart';

class AppStackedImages extends StatelessWidget {
  final List<dynamic> data;
  final double topWidgetHeight = 200.0;
  final double avatarRadius = 50.0;
  const AppStackedImages({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: <Widget>[
        Column(
          children: [
            Text(
              "1",
              style: TextStyle(
                color: Appcolors.white(),
                fontSize: 12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Image.asset('assets/images/Vector.png',
                  color: Appcolors.yew()),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: data[0]['image'] == null
                  ? const CircleAvatar(
                      radius: 60.0,
                      foregroundImage:
                          AssetImage('assets/images/Ellipse 12.png'),
                    )
                  : CircleAvatar(
                      radius: 60.0,
                      foregroundImage: NetworkImage(data[0]["image"]),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                data[0]['first_name'],
                style: TextStyle(
                  color: Appcolors.white(),
                  fontSize: 12,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                data[0]['last_name'],
                style: TextStyle(
                  color: Appcolors.white(),
                  fontSize: 12,
                ),
              ),
            ),
            Text(
              data[0]['final_score'].toString(),
              style: TextStyle(
                color: Appcolors.yew(),
              ),
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(left: 45, top: 44),
            child: Column(
              children: [
                Text("2"),
                Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset('assets/images/Polygon 1.png',
                        color: Appcolors.yew())),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: data[1]['image'] == null
                        ? const CircleAvatar(
                            radius: 60.0,
                            foregroundImage:
                                AssetImage('assets/images/Ellipse 12.png'),
                          )
                        : CircleAvatar(
                            radius: 60.0,
                            foregroundImage: NetworkImage(data[1]["image"]),
                          )),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    data[1]['first_name'],
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    data[1]['last_name'],
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  data[1]['final_score'].toString(),
                  style: TextStyle(
                    color: Appcolors.yew(),
                  ),
                ),
              ],
            )),
        Container(
            margin: const EdgeInsets.only(left: 210, top: 40),
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
                  child: data[0]['image'] == null
                      ? const CircleAvatar(
                          radius: 60.0,
                          foregroundImage:
                              AssetImage('assets/images/Ellipse 12.png'),
                        )
                      : CircleAvatar(
                          radius: 60.0,
                          foregroundImage: NetworkImage(data[0]["image"])),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    data[2]['first_name'],
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    data[2]['last_name'],
                    style: TextStyle(
                      color: Appcolors.white(),
                      fontSize: 12,
                    ),
                  ),
                ),
                Text(
                  data[2]['final_score'] ?? '0',
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
