import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';

import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

class AppHomeBlogs extends StatelessWidget {
  final String posterUrl;
  // final String eventTitle;
  final TabController tabController;
  final Map<String, dynamic> blog;

  const AppHomeBlogs(
      {
      //   required this.eventTitle,
      required this.posterUrl,
      super.key,
      required this.tabController,
      required this.blog});

  @override
  Widget build(BuildContext context) {
    int epocTime = blog['published'];

    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epocTime);
    String formattedDate = DateFormat('MMM d, y').format(dateTime);

    int averageWordsPerMinute = 200; // Adjust this value as needed
    int wordCount = blog['content'].split(' ').length;
    int minRead = (wordCount / averageWordsPerMinute).ceil();
    return Container(
        decoration: BoxDecoration(color: Appcolors.blogdecbg()),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          AppVerifyTextField(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
              // text: eventTitle,
              text: blog['title'],
              text1: '',
              textstyle:
                  Textstyle.inputtext(Color(0xffF4F4F5), 18.0, FontWeight.w400),
              textalign: Textstyle.textalignstart()),
          AppVerifyTextField(
              padding:
                  const EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              text: 'By ${blog['author']}',
              text1: '',
              textstyle:
                  Textstyle.inputtext(Color(0xffD2D1D6), 14.0, FontWeight.w400),
              textalign: TextAlign.center),
          Container(
            width: 358,
            height: 18,
            margin: const EdgeInsets.only(left: 20.04, top: 15, bottom: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      blog['category'][0].toString().length < 17
                          ? blog['category'][0].toString().toUpperCase()
                          : "${blog['category'][0].toString().toUpperCase().substring(0, 17)}...",
                      style: Textstyle.inputtext(
                          Color(0xffA5A3AE), 12.0, FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(width: 2),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.5),
                      child: Text(
                        formattedDate,
                        style: Textstyle.inputtext(
                            Color(0xffA5A3AE), 12.0, FontWeight.w500),
                      ),
                    ),
                    const Text(
                      ' - ',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.5, right: 10),
                      child: Text(
                        '$minRead min read',
                        style: Textstyle.inputtext(
                            Color(0xffA5A3AE), 12.0, FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
                        String meetUrl = blog['link'];
                        await launchUrl(Uri.parse(meetUrl));
                      },
                      icon: SvgPicture.asset('assets/images/readnow.svg'),
                      label: Text(
                        'Read Now',
                        style: TextStyle(
                            color: Appcolors.yew(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                  TextButton.icon(
                      onPressed: () {
                        String blogUrl = blog['link'];
                        Share.share(blogUrl);
                      },
                      icon: SvgPicture.asset('assets/images/share.svg'),
                      label: Text(
                        'Share',
                        style: TextStyle(
                            color: Appcolors.yew(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                ],
              ),
            ),
          ),
        ]));
  }
}
