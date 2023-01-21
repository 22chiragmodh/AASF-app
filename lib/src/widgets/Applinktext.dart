import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:flutter/material.dart';

class AppLinkText extends StatelessWidget {
  final String text;
  final TextStyle textstyle;
  final VoidCallback? fn;
  const AppLinkText(
      {required this.text, required this.textstyle, this.fn, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: BaseStyle.listpadding(),
      child: InkWell(
        onTap: fn,
        mouseCursor: MaterialStateMouseCursor.clickable,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: textstyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
