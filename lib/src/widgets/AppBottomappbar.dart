import 'package:aasf_iiitmg/src/styles/colors.dart';

import 'package:flutter/material.dart';

class AppBottomAppbar extends StatelessWidget {
  const AppBottomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Appcolors.tagcolor(),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Row(children: [
            SizedBox(
              height: 68,
              width: 85,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      icon: Image.asset('assets/images/home.png')),
                  const Text('Home')
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 85,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/progress');
                      },
                      icon: Image.asset('assets/images/leaderboard.png')),
                  const Text('Progress')
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 85,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/timeline');
                      },
                      icon: Image.asset('assets/images/calendar_month.png')),
                  const Text('Timeline')
                ],
              ),
            ),
            SizedBox(
              height: 68,
              width: 85,
              child: Column(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/faqs');
                      },
                      icon: Image.asset('assets/images/quiz.png')),
                  const Text('Faqs')
                ],
              ),
            ),
          ]),
          Positioned(
              right: 15,
              top: -20,
              bottom: 41.18,
              child: CircleAvatar(
                backgroundColor: Appcolors.tagcolor(),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/qrcode');
                    },
                    icon: Image.asset('assets/images/qr_code_scanner.png')),
              )),
        ],
      ),
    );
  }
}
