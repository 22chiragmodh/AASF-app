import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class AppReadmore extends StatefulWidget {
  final String title;
  final String description;
  const AppReadmore(
      {required this.title, required this.description, super.key});

  @override
  State<AppReadmore> createState() => _AppReadmoreState();
}

class _AppReadmoreState extends State<AppReadmore> {
  bool isexpand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
          width: 360,
          height: isexpand ? 150 : 70,
          child: Column(
            children: [
              Row(
                children: [
                  AppVerifyTextField(
                      padding: BaseStyle.faqspadding(),
                      text: widget.title,
                      textstyle: Textstyle.inputtext(
                          Appcolors.white(), 16.0, FontWeight.w300),
                      textalign: TextAlign.start),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isexpand = !isexpand;
                        });
                      },
                      child: isexpand
                          ? Text('see less',
                              style: Textstyle.inputtext(
                                  Colors.white, 16, FontWeight.w600))
                          : Text(
                              '...see more',
                              style: Textstyle.inputtext(
                                  Colors.white, 16, FontWeight.w600),
                            ))
                ],
              ),
              isexpand
                  ? AppVerifyTextField(
                      padding: BaseStyle.faqspadding(),
                      text: widget.description,
                      textstyle: Textstyle.inputtext(
                          Appcolors.white(), 16.0, FontWeight.w300),
                      textalign: TextAlign.start)
                  : Text('')
            ],
          )),
    );
  }
}
