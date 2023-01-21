import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class AppWinningCard extends StatelessWidget {
  final String eventname;
  final String imgurl;

  const AppWinningCard({
    required this.eventname,
    required this.imgurl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 20, bottom: 6),
      child: Container(
          height: 133.73,
          width: 156,
          color: Appcolors.blogdecbg(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imgurl),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  eventname,
                  style: Textstyle.winningtext(Appcolors.yew(), 16.0),
                ),
              )
            ],
          )),
    );
  }
}
