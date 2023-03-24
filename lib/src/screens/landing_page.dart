import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppIcon.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/Apptext.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _pageController;
  List<String> imageUrl = [
    'assets/images/Asset 1 1.png',
    'assets/images/Asset 1 2.png',
    'assets/images/Asset 1 3.png',
  ];
  List<String> title = [
    "Track your progress",
    "Mark your attedence",
    "Explore more resources"
  ];
  int activepage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.only(top: 57),
          child: const AppIcon(
              imgUrl: 'assets/images/AASF.png', imgwidth: 159, imgheight: 47),
        ),
        // swipe image & text
        SizedBox(
          width: 1000,
          height: MediaQuery.of(context).size.height * 0.45,
          child: PageView.builder(
              itemCount: imageUrl.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activepage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                pagePosition = activepage;
                return Column(
                  children: [
                    AppIcon(
                      imgUrl: imageUrl[pagePosition],
                      imgwidth: 274,
                      imgheight: 240,
                      fit: BoxFit.fill,
                    ),
                    AppText(
                      text: title[pagePosition],
                      textstyle: Textstyle.inputtext(
                          Colors.white, 20.0, FontWeight.w400),
                    ),
                  ],
                );
              }),
        ),
        Container(
          margin: const EdgeInsets.only(top: 27),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: BaseStyle.indicators(imageUrl.length, activepage),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: GestureDetector(
            onTap: (() {
              if (activepage == 0 || activepage == 1) {
                setState(() {
                  activepage = activepage + 1;
                });
              } else {
                Navigator.pushNamed(context, '/verification');
              }
            }),
            child: const AppButton(buttontext: 'Get Started'),
          ),
        )
      ]),
    );
  }
}
