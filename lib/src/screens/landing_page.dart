import 'package:aasf_iiitmg/src/widgets/AppIcon.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/Appswipeview.dart';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 57),
          child: const AppIcon(
              imgUrl: 'assets/images/AASF.png', imgwidth: 159, imgheight: 47),
        ),
        const AppSwipeView(),
        GestureDetector(
          onTap: (() {
            Navigator.pushNamed(context, '/home');
          }),
          child: const AppButton(buttontext: 'Get Started'),
        )
      ]),
    );
  }
}
