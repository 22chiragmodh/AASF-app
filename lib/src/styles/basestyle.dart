import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:flutter/material.dart';

abstract class BaseStyle {
  static double borderradius() {
    return 9;
  }

  static double borderradiusselected() {
    return 30.0;
  }

  static double borderwidth() {
    return 2.0;
  }

  static double listFieldhorizontal() {
    return 25.0;
  }

  static double listFieldvertical() {
    return 8.0;
  }

  static EdgeInsets btnmargin() {
    return const EdgeInsets.only(left: 20, right: 20, top: 20);
  }

  static EdgeInsets listpadding() {
    return EdgeInsets.symmetric(
        horizontal: listFieldhorizontal(), vertical: listFieldvertical());
  }

  static EdgeInsets faqspadding() {
    return const EdgeInsets.symmetric(horizontal: 20, vertical: 3);
  }

  static EdgeInsets fieldpadding() {
    return const EdgeInsets.symmetric(horizontal: 55, vertical: 10);
  }

  static List<BoxShadow> boxshow() {
    return [
      BoxShadow(
          offset: const Offset(1.0, 2.0),
          blurRadius: 2.0,
          color: Appcolors.darkgray().withOpacity(0.5))
    ];
  }

  static AppBar appbar(
      {required bool backbtn, String? title, required BuildContext context}) {
    return AppBar(
      backgroundColor: Appcolors.tagcolor(),
      title: backbtn == false
          ? Text(
              title!,
              style: Textstyle.inputtext(
                  Appcolors.titlewhite(), 16.0, FontWeight.w600),
            )
          : const Text(""),
      leading: backbtn == true
          ? const Image(
              image: AssetImage('assets/images/aasf-transparent 1.png'))
          : BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
    );
  }

  static double buttonheight() {
    return 44;
  }

  static List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 15,
        height: 8,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Appcolors.dark(),
            shape: BoxShape.circle),
      );
    });
  }

  static Container timelineCard(String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: 300,
        height: 50,
        color: const Color(0xFF1B1B1B),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Textstyle.inputtext(
                Appcolors.titlewhite(), 16.0, FontWeight.w600),
          ),
        ));
  }

  static Container linealignment(double h) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      width: 328.0,
      height: h,
      decoration: BoxDecoration(color: Appcolors.line()),
    );
  }
}
