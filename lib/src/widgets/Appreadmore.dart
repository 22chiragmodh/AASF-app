import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';

class AppReadmore extends StatelessWidget {
  final String content =
      "This is the first article of the series Week of Web (or in short #WOW), where we will start from absolute beginner to web development and by the end of the week we will learn web technologies like HTML, CSS, JavaScript, NodeJS and Firebase Firestore to build a complete full-stack application. We will also host our code repository on GitHub using Git as well as host our application using Heroku";

  const AppReadmore({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15.96),
            child: ReadMoreText(
              content,
              trimLines: 2,
              textAlign: TextAlign.justify,
              trimMode: TrimMode.Line,
              trimCollapsedText: "... see more ",
              trimExpandedText: "... see less ",
              lessStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white()),
              moreStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Appcolors.white()),
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 2,
                  color: Appcolors.blogiconcol()),
            )));
  }
}
