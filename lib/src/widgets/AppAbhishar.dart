import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:flutter/material.dart';

class AppAbhishar extends StatelessWidget {
  final String posterUrl;
  final String eventTitle;
  final TabController tabController;

  const AppAbhishar(
      {required this.eventTitle,
      required this.posterUrl,
      super.key,
      required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Appcolors.blogdecbg()),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20, left: 45, bottom: 16),
            alignment: Alignment.topLeft,
            child: Text(
              ConstantsVar.hometextlist[tabController.index],
              style:
                  Textstyle.inputtext(Appcolors.white(), 16, FontWeight.w400),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 216,
                    height: 67,
                    margin: const EdgeInsets.all(16),
                    child: Text(
                      'A Jog Down the Sports Lane',
                      style: Textstyle.inputtext(
                          Appcolors.white(), 20.0, FontWeight.w400),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 32,
                        margin: const EdgeInsets.all(16),
                        child: Text(
                          'ABHISHAR v11.0',
                          style: Textstyle.inputtext(
                              Appcolors.blogiconcol(), 13.0, FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 32,
                        margin: const EdgeInsets.all(16),
                        child: Text(
                          'Nov 20, 2021',
                          style: Textstyle.inputtext(
                              Appcolors.blogiconcol(), 13.0, FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 102,
                  height: 133,
                  child: Image.asset(posterUrl),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 0, bottom: 4),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Appcolors.bordercolor())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Image(
                        image: AssetImage('assets/images/menu_book.png'),
                      ),
                      label: Text(
                        'Read Now',
                        style: TextStyle(color: Appcolors.yew()),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Image(
                          image: AssetImage('assets/images/language.png')),
                      label: Text(
                        'Website',
                        style: TextStyle(color: Appcolors.yew()),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
