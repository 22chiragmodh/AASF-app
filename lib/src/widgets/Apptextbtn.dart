import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

class AppTextBtn extends StatelessWidget {
  final String text;
  final VoidCallback fn;
  final double vm, hm;

  const AppTextBtn(
      {required this.text,
      required this.fn,
      required this.hm,
      required this.vm,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vm, horizontal: hm),
      child: TextButton(
          onPressed: fn,
          child: Text(
            text,
            style: Textstyle.inputtext(Appcolors.white(), 14, FontWeight.w500),
          )),
    );
  }
}
