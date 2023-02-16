import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttontext;

  const AppButton({required this.buttontext, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: BaseStyle.Btnmargin(),
      height: BaseStyle.buttonheight(),
      width: 328,
      decoration: BoxDecoration(
          color: Appcolors.yew(),
          borderRadius: BorderRadius.circular(BaseStyle.borderradius()),
          boxShadow: BaseStyle.boxshow()),
      child: Center(
        child: Text(
          buttontext,
          style: Textstyle.inputtext(Appcolors.dark(), 20.0, FontWeight.w600),
        ),
      ),
    );
  }
}
