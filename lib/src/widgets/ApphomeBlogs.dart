import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class AppHomeBlogs extends StatelessWidget {
  final String posterUrl;
  final String eventTitle;
  const AppHomeBlogs(
      {required this.eventTitle, required this.posterUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Appcolors.blogdecbg()),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: BaseStyle.listpadding(),
                child: const Align(
                  alignment: Alignment.topCenter,
                  child: CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage('assets/images/Ellipse 10.png'),
                  ),
                ),
              ),
              Padding(
                padding: BaseStyle.listpadding(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppVerifyTextField(
                        padding: const EdgeInsets.all(2.0),
                        text: 'Abhigyan Abhikaushlam',
                        text1: '',
                        textstyle: Textstyle.inputtext(
                            Appcolors.white(), 14.0, FontWeight.w600),
                        textalign: TextAlign.center),
                    AppVerifyTextField(
                        padding: const EdgeInsets.all(2.0),
                        text: 'IMG-2017',
                        text1: '',
                        textstyle: Textstyle.inputtext(
                            Appcolors.white(), 13.0, FontWeight.w500),
                        textalign: TextAlign.start),
                  ],
                ),
              )
            ],
          ),
          AppVerifyTextField(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 20.0),
              text: eventTitle,
              text1: '',
              textstyle:
                  Textstyle.inputtext(Appcolors.white(), 24.0, FontWeight.w400),
              textalign: Textstyle.textalignstart()),
          Container(
            width: 358,
            height: 200,
            margin: const EdgeInsets.only(left: 15, top: 14),
            child: Image.asset(
              posterUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            width: 358,
            height: 16,
            margin: const EdgeInsets.only(left: 16.04, top: 15, bottom: 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'TECH BLOG',
                      style: Textstyle.inputtext(
                          Appcolors.blogiconcol(), 12.0, FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Text(
                        'CASE STUDY',
                        style: Textstyle.inputtext(
                            Appcolors.blogiconcol(), 12.0, FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.5),
                      child: Text(
                        'Aug 20, 2022',
                        style: Textstyle.inputtext(
                            Appcolors.blogiconcol(), 12.0, FontWeight.w500),
                      ),
                    ),
                    const Text(
                      ' - ',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.5),
                      child: Text(
                        '7 min read',
                        style: Textstyle.inputtext(
                            Appcolors.blogiconcol(), 12.0, FontWeight.w400),
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu_book,
                        color: Appcolors.yew(),
                      ),
                      label: Text(
                        'Read Now',
                        style: TextStyle(color: Appcolors.yew()),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: Appcolors.yew(),
                      ),
                      label: Text(
                        'Share',
                        style: TextStyle(color: Appcolors.yew()),
                      )),
                ],
              ),
            ),
          ),
        ]));
  }
}
