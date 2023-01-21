import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/Appotptextfield.dart';
import 'package:aasf_iiitmg/src/widgets/Apptext.dart';
import 'package:aasf_iiitmg/src/widgets/Apptextbtn.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Appcolors.primarycolor(),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            AppText(
              text: 'Verify OTP',
              textstyle:
                  Textstyle.inputtext(Appcolors.white(), 18.0, FontWeight.w600),
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OtpTextField(first: true, last: false, context: context),
                      OtpTextField(first: false, last: false, context: context),
                      OtpTextField(first: false, last: false, context: context),
                      OtpTextField(first: false, last: true, context: context),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            AppText(
              text: "Didn’t receive OTP?",
              textstyle:
                  Textstyle.inputtext(Appcolors.white(), 20.0, FontWeight.w400),
            ),
            AppTextBtn(text: 'Request again', fn: () {}, vm: 0, hm: 110),
            GestureDetector(
              child: const AppButton(buttontext: 'Login'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
