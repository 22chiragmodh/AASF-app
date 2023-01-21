import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:percent_indicator/percent_indicator.dart';

class AppProgressIndicator extends StatelessWidget {
  final String title;

  final int percent;

  const AppProgressIndicator({
    required this.title,
    required this.percent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
          radius: 85.0,
          lineWidth: 5.0,
          percent: percent / 100,
          center: AppVerifyTextField(
              padding: const EdgeInsets.all(8.0),
              text: percent.toString(),
              textstyle:
                  Textstyle.inputtext(Appcolors.yew(), 35, FontWeight.w700),
              textalign: TextAlign.center),
          backgroundColor: Appcolors.dark(),
          progressColor: Appcolors.yew(),
        ),
        AppVerifyTextField(
            padding: const EdgeInsets.all(8.0),
            text: title,
            textstyle:
                Textstyle.inputtext(Appcolors.white(), 15.0, FontWeight.w400),
            textalign: TextAlign.center)
      ],
    );
  }
}
