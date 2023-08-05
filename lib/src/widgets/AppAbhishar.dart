// ignore: file_names
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    width: 260,
                    height: 67,
                    margin: const EdgeInsets.all(15),
                    child: Text(
                      abhishar['heading'],
                      style: Textstyle.inputtext(
                          Color(0xffF4F4F5), 18.0, FontWeight.w400),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 140,
                        height: 40,
                        margin: const EdgeInsets.all(8),
                        child: Text(
                          'ABHISHAR ${abhishar['version']}',
                          style: Textstyle.inputtext(
                              Color(0xffD2D1D6), 12.0, FontWeight.w400),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 40,
                        margin: const EdgeInsets.all(8),
                        child: Text(
                          formattedDateofLaunch,
                          style: Textstyle.inputtext(
                              Color(0xffD2D1D6), 12.0, FontWeight.w400),
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
                  child: CachedNetworkImage(
                    alignment: Alignment.center,
                    imageUrl: abhishar['image'],
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: SizedBox(
                        height: 12,
                        width: 12,
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
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
                      icon: SvgPicture.asset('assets/images/readnow.svg'),
                      label: Text(
                        'Read Now',
                        style: TextStyle(
                            color: Appcolors.yew(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: SvgPicture.asset('assets/images/website.svg'),
                      label: Text(
                        'Website',
                        style: TextStyle(
                            color: Appcolors.yew(),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
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
