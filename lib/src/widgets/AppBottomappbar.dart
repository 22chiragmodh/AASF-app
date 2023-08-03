import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:aasf_iiitmg/src/screens/leaderboard_page.dart';
import 'package:aasf_iiitmg/src/screens/qr_page.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          height: 68,
          width: 75,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomePage(authToken: token)));
                },
                icon: SvgPicture.asset(
                  'assets/images/home.svg',
                ),
              ),
              const Text('Home',
                  style: TextStyle(
                      color: Color(
                        0xffA5A3AE,
                      ),
                      fontSize: 10,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
        SizedBox(
          height: 68,
          width: 75,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LeaderBoradPage()));
                },
                icon: SvgPicture.asset(
                  'assets/images/leaderboard.svg',
                ),
              ),
              const Text('Progress',
                  style: TextStyle(
                      color: Color(0xffA5A3AE),
                      fontSize: 10,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
        SizedBox(
          height: 68,
          width: 75,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QrCodeScanner(
                                token: token!,
                              )));
                },
                icon: SvgPicture.asset(
                  'assets/images/qr_code_scanner.svg',
                ),
              ),
              const Text('Attendence',
                  style: TextStyle(
                      color: Color(0xffA5A3AE),
                      fontSize: 10,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
        SizedBox(
          height: 68,
          width: 75,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/timeline');
                },
                icon: SvgPicture.asset(
                  'assets/images/calendar_month.svg',
                ),
              ),
              const Text('Timeline',
                  style: TextStyle(
                      color: Color(0xffA5A3AE),
                      fontSize: 10,
                      fontWeight: FontWeight.w400))
            ],
          ),
        ),
        SizedBox(
          height: 68,
          width: 75,
          child: Column(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/faqs');
                },
                icon: SvgPicture.asset(
                  'assets/images/quiz.svg',
                ),
              ),
              const Text(
                'Faqs',
                style: TextStyle(
                    color: Color(0xffA5A3AE),
                    fontSize: 10,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
