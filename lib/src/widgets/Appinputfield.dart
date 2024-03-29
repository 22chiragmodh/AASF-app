import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class AppInputField extends StatelessWidget {
  final String hinttext;

  final TextInputType textintype;

  const AppInputField(
      {super.key, required this.hinttext, required this.textintype});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      child: TextField(
        keyboardType: textintype,
        style:
            Textstyle.inputtext(Appcolors.titlewhite(), 16.0, FontWeight.w600),
        textAlign: TextAlign.center,
        decoration: Textstyle.materialdeco(hinttext),
      ),
    );
    ;
  }
}
