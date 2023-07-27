import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:aasf_iiitmg/src/screens/leaderboard_page.dart';
import 'package:aasf_iiitmg/src/screens/qr_page.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppBottomAppbar extends StatelessWidget {
  String token;

  AppBottomAppbar({
    Key? key,
    required this.token,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePage(authToken: token)));
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LeaderBoradPage()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QrCodeScanner(
                                    token: token!,
                                  )));
                    },
                    icon: Image.asset('assets/images/qr_code_scanner.png')),
              )),
        ],
      ),
    );
  }
}
