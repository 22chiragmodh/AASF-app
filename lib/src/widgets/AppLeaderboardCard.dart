import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:flutter/material.dart';

class AppLeadrboardCard extends StatelessWidget {
  final String rank;
  final String name;
  final int score;
  final String imgUrl;
  const AppLeadrboardCard({
    required this.rank,
    Key? key,
    required this.name,
    required this.score,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, top: 10, bottom: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(rank),
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            width: 300,
            height: 59,
            decoration: BoxDecoration(
                color: Appcolors.blogdecbg(),
                borderRadius: BorderRadius.circular(44)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    imgUrl == null
                        ? const CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/Ellipse 15.png'),
                            radius: 20,
                          )
                        : CircleAvatar(
                            backgroundImage: NetworkImage(imgUrl),
                            radius: 20,
                          ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(name,
                          style: TextStyle(color: Appcolors.white())),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(score.toString(),
                      style: TextStyle(color: Appcolors.yew())),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
