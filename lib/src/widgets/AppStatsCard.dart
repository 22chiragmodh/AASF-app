import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class AppStatsCard extends StatelessWidget {
  final String eventname;
  final int day;
  final bool pa;

  const AppStatsCard({
    required this.pa,
    required this.eventname,
    required this.day,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Container(
        height: 54,
        width: 400,
        color: Appcolors.blogdecbg(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppVerifyTextField(
                padding: EdgeInsets.all(10.0),
                text: eventname,
                text1: '',
                textstyle: Textstyle.winningtext(Appcolors.yew(), 12.0),
                textalign: TextAlign.start),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppVerifyTextField(
                    padding: BaseStyle.listpadding(),
                    text: "Day ",
                    text1: day.toString(),
                    textstyle: Textstyle.winningtext(Appcolors.white(), 12.0),
                    textalign: TextAlign.start),
                AppVerifyTextField(
                    padding: BaseStyle.listpadding(),
                    text: pa ? "Present" : "Absent",
                    text1: "",
                    textstyle: Textstyle.winningtext(Appcolors.white(), 12.0),
                    textalign: TextAlign.end),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
