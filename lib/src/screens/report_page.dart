import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';

import 'package:aasf_iiitmg/src/widgets/AppSocialIcon.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class ReortPage extends StatelessWidget {
  const ReortPage({super.key});

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
                maxLines: 7,
                keyboardType: TextInputType.text,
                style: Textstyle.inputtext(
                    Appcolors.titlewhite(), 16.0, FontWeight.w600),
                textAlign: TextAlign.center,
                decoration: Textstyle.materialdeco('OPT feature not working'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const AppButton(buttontext: 'Send'),
            const SizedBox(
              height: 120,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  AppSocialButton(socialtype: SocialType.Linkdn),
                  AppSocialButton(socialtype: SocialType.Facebook),
                  AppSocialButton(socialtype: SocialType.Instagram),
                  AppSocialButton(socialtype: SocialType.Discord),
                  AppSocialButton(socialtype: SocialType.Gmail),
                ],
              ),
            ),
          ],
        ));
  }
}
