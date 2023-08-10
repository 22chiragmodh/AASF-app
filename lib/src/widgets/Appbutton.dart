// ignore_for_file: file_names

import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String buttontext;
  bool? apicalled;

  AppButton({required this.buttontext, super.key, this.apicalled});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: BaseStyle.btnmargin(),
        height: BaseStyle.buttonheight(),
        width: 328,
        decoration: BoxDecoration(
            color: Appcolors.yew(),
            borderRadius: BorderRadius.circular(BaseStyle.borderradius()),
            boxShadow: BaseStyle.boxshow()),
        child: apicalled == null
            ? Center(
                child: Text(
                  buttontext,
                  style: Textstyle.inputtext(
                      Appcolors.dark(), 20.0, FontWeight.w600),
                ),
              )
            : !apicalled!
                ? Center(
                    child: Text(
                      buttontext,
                      style: Textstyle.inputtext(
                          Appcolors.dark(), 20.0, FontWeight.w600),
                    ),
                  )
                : const Center(
                    child: SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromARGB(255, 12, 12, 12))),
                    ),
                  ));
  }
}
