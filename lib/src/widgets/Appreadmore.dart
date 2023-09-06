import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';

class AppReadmore extends StatelessWidget {
  final String description;

  const AppReadmore({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 15.96),
            child: ReadMoreText(
              description,
              trimLines: 2,
              textAlign: TextAlign.justify,
              trimMode: TrimMode.Line,
              trimCollapsedText: "... see more ",
              trimExpandedText: " see less ",
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white()),
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white()),
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 2,
                  color: Color(0xffD2D1D6)),
            )));
  }
}
