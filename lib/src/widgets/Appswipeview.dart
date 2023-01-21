import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppIcon.dart';

import 'package:aasf_iiitmg/src/widgets/Apptext.dart';
import 'package:flutter/material.dart';

class AppSwipeView extends StatefulWidget {
  const AppSwipeView({super.key});

  @override
  State<AppSwipeView> createState() => _AppSwipeViewState();
}

class _AppSwipeViewState extends State<AppSwipeView> {
  late PageController _pageController;
  int activePage = 0;

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

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1000,
      height: MediaQuery.of(context).size.height * 0.5,
      child: PageView.builder(
          itemCount: imageUrl.length,
          pageSnapping: true,
          controller: _pageController,
          onPageChanged: (page) {
            setState(() {
              activePage = page;
            });
          },
          itemBuilder: (context, pagePosition) {
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
                  textstyle:
                      Textstyle.inputtext(Colors.white, 20.0, FontWeight.w400),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: BaseStyle.indicators(imageUrl.length, activePage),
                  ),
                ),
              ],
            );
          }),
    );
  }
}
