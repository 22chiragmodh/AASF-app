import 'package:aasf_iiitmg/src/controller/studentsData.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:dio/dio.dart';

import 'package:aasf_iiitmg/src/widgets/appsocialicon.dart';
import 'package:aasf_iiitmg/src/widgets/appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class ReortPage extends StatelessWidget {
  ReortPage({super.key});
  TextEditingController reportmsgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Appcolors.primarycolor(),
        appBar: BaseStyle.appbar(
            backbtn: false, title: "Report here", context: context),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            const SizedBox(
              height: 10,
            ),
            AppVerifyTextField(
                padding: BaseStyle.listpadding(),
                text: 'Message/Bug',
                textstyle: Textstyle.inputtext(
                    Appcolors.titlewhite(), 16.0, FontWeight.w600),
                textalign: TextAlign.start),
            // const AppInputField(
            //     hinttext: 'OPT feature not working',
            //     textintype: TextInputType.multiline),

            Padding(
              padding: BaseStyle.listpadding(),
              child: TextField(
                controller: reportmsgController,
                maxLines: 7,
                keyboardType: TextInputType.text,
                style: Textstyle.inputtext(
                    Appcolors.titlewhite(), 16.0, FontWeight.w600),
                textAlign: TextAlign.start,
                decoration: Textstyle.materialdeco('Message/Bug'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
                child: AppButton(buttontext: 'Send'),
                onTap: () async {
                  sendEmail(reportmsgController.text, context);
                }),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(
                            "https://www.linkedin.com/company/aasf-iiitmg/"));
                      },
                      child: AppSocialButton(socialtype: SocialType.Linkdn)),
                  InkWell(
                      onTap: () async {
                        await launchUrl(
                            Uri.parse("https://www.facebook.com/aasfiiitm/"));
                      },
                      child: AppSocialButton(socialtype: SocialType.Facebook)),
                  InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse(
                            "https://www.instagram.com/aasf_iiitmg/"));
                      },
                      child: AppSocialButton(socialtype: SocialType.Instagram)),
                  InkWell(
                      onTap: () async {
                        await launchUrl(Uri.parse("https://aasf.in/"));
                      },
                      child: AppSocialButton(socialtype: SocialType.Website)),
                  InkWell(
                      onTap: () async {
                        await launch('mailto:aasf@iiitm.ac.in');
                      },
                      child: AppSocialButton(socialtype: SocialType.Gmail)),
                ],
              ),
            ),
          ],
        ));
  }

  Future<void> sendEmail(String bodymsg, BuildContext context) async {
    try {
      Dio dio = Dio();

      final String useremail = await StudentDetails.getEmail();

      Response res = await dio.post("https://formspree.io/f/xpzgqvwe",
          data: {"email": useremail, "message": bodymsg});

      if (res.statusCode == 200) {
        SnackBar forpassSnackBar = const SnackBar(
          content: Text('Report successfully Sent!',
              style: TextStyle(color: Colors.green)),
          backgroundColor: (Colors.white),
        );
        //   // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(forpassSnackBar);
      }
    } catch (e) {
      print(e);
    }
  }
}
