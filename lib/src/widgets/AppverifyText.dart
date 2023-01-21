import 'package:flutter/material.dart';

class AppVerifyTextField extends StatelessWidget {
  final EdgeInsets padding;
  final String text;
  final String? text1;
  final TextStyle textstyle;
  final TextAlign textalign;

  const AppVerifyTextField(
      {required this.padding,
      required this.text,
      this.text1,
      required this.textstyle,
      required this.textalign,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
          textAlign: textalign,
          text: TextSpan(text: text, style: textstyle, children: [
            TextSpan(
              text: text1,
              style: textstyle,
            )
          ])),
    );
  }
}
