import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Textstyle {
  static TextStyle winningtext(Color color, double fontsize) {
    return GoogleFonts.openSans(
        textStyle: TextStyle(
            color: color, fontSize: fontsize, fontWeight: FontWeight.w600));
  }

  static TextStyle inputtext(Color color, double fontsize, FontWeight w) {
    return GoogleFonts.openSans(
        textStyle: TextStyle(color: color, fontSize: fontsize, fontWeight: w));
  }

  static TextAlign textaligncenter() {
    return TextAlign.center;
  }

  static TextAlign textalignstart() {
    return TextAlign.start;
  }

  static InputDecoration materialdeco(String hinttext) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(12.0),
      hintText: hinttext,
      filled: true,
      fillColor: Appcolors.textfieldcol(),
      hintStyle:
          Textstyle.inputtext(Appcolors.titlewhite(), 14.0, FontWeight.w300),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BaseStyle.borderradius()),
          borderSide: BorderSide(color: Appcolors.textfieldcol())),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(BaseStyle.borderradius()),
          borderSide: BorderSide(color: Appcolors.textfieldcol())),
    );
  }
}
