import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class AppFaqsDragdown extends StatefulWidget {
  final String title;
  final String description;
  const AppFaqsDragdown(
      {required this.title, required this.description, super.key});

  @override
  State<AppFaqsDragdown> createState() => _AppFaqsDragdownState();
}

class _AppFaqsDragdownState extends State<AppFaqsDragdown> {
  bool isexpand = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Container(
        width: 360,
        height: isexpand ? 138 : 54,
        color: Appcolors.blogdecbg(),
        child: isexpand
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 260,
                        child: AppVerifyTextField(
                            padding: BaseStyle.faqspadding(),
                            text: widget.title,
                            textstyle:
                                Textstyle.winningtext(Appcolors.white(), 12.0),
                            textalign: TextAlign.start),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isexpand = !isexpand;
                            });
                          },
                          icon: isexpand
                              ? const Icon(Icons.expand_less)
                              : const Icon(Icons.expand_more))
                    ],
                  ),
                  AppVerifyTextField(
                      padding: BaseStyle.faqspadding(),
                      text: widget.description,
                      textstyle: Textstyle.inputtext(
                          Appcolors.white(), 12.0, FontWeight.w400),
                      textalign: TextAlign.start)
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 260,
                    child: AppVerifyTextField(
                        padding: BaseStyle.listpadding(),
                        text: widget.title,
                        textstyle:
                            Textstyle.winningtext(Appcolors.white(), 12.0),
                        textalign: TextAlign.start),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isexpand = !isexpand;
                        });
                      },
                      icon: const Icon(Icons.expand_more))
                ],
              ),
      ),
    );
  }
}
