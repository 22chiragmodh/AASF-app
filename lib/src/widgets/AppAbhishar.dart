// ignore: file_names
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppAbhishar extends StatelessWidget {
  final TabController tabController;
  final Map<String, dynamic> abhishar;

  const AppAbhishar(
      {super.key, required this.tabController, required this.abhishar});

  @override
  Widget build(BuildContext context) {
    final dateOfLaunch = DateTime.parse(abhishar['date_of_launch']);
    final formattedDateofLaunch =
        DateFormat('MMM d, yyyy').format(dateOfLaunch);
    ;
    return Container(
      decoration: BoxDecoration(color: Appcolors.blogdecbg()),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    width: 216,
                    height: 67,
                    margin: const EdgeInsets.all(15),
                    child: Text(
                      abhishar['heading'],
                      style: Textstyle.inputtext(
                          Appcolors.white(), 20.0, FontWeight.w400),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 40,
                        margin: const EdgeInsets.all(8),
                        child: Text(
                          'ABHISHAR ${abhishar['version']}',
                          style: Textstyle.inputtext(
                              Appcolors.blogiconcol(), 13.0, FontWeight.w500),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 40,
                        margin: const EdgeInsets.all(8),
                        child: Text(
                          formattedDateofLaunch,
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
                  width: 90,
                  height: 133,
                  child: Image.network(abhishar['image']),
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
                      onPressed: () async {
                        String meetUrl = abhishar['pdf_link'];
                        await launchUrl(Uri.parse(meetUrl));
                      },
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
