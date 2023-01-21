import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class AppProfileFiled extends StatelessWidget {
  final String imgurl;

  final String text;

  final String fieldname;

  const AppProfileFiled({
    required this.fieldname,
    required this.text,
    required this.imgurl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 35),
      width: 328,
      height: 50,
      child: Row(
        children: [
          Image.asset(imgurl),
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    fieldname,
                    style: Textstyle.inputtext(
                        Appcolors.white(), 11.0, FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    text,
                    style: Textstyle.winningtext(Appcolors.white(), 15),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
