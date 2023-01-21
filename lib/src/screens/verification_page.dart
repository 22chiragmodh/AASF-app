import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/Appinputfield.dart';
import 'package:aasf_iiitmg/src/widgets/Apptextbtn.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class VerifictionPage extends StatelessWidget {
  const VerifictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40),
        children: [
          const SizedBox(
            height: 40,
          ),
          AppVerifyTextField(
              textalign: Textstyle.textaligncenter(),
              padding: BaseStyle.listpadding(),
              text: 'Continue with Institue ID',
              text1: '',
              textstyle: Textstyle.inputtext(
                  Appcolors.titlewhite(), 20.0, FontWeight.w600)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          AppVerifyTextField(
              textalign: Textstyle.textaligncenter(),
              padding: BaseStyle.fieldpadding(),
              text1: '',
              text: 'You’ll receive a 4 digit code to verify next',
              textstyle: Textstyle.inputtext(
                  Appcolors.titlewhite(), 17, FontWeight.w500)),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          AppVerifyTextField(
              textalign: Textstyle.textalignstart(),
              padding: BaseStyle.listpadding(),
              text1: '',
              text: 'Enter your institute email ID',
              textstyle: Textstyle.inputtext(
                  Appcolors.titlewhite(), 15.0, FontWeight.w500)),
          const AppInputField(
              hinttext: 'img_2020001@iiitm.ac.in',
              textintype: TextInputType.emailAddress),
          GestureDetector(
              onTap: (() {
                Navigator.pushNamed(context, '/otppage');
              }),
              child: const AppButton(buttontext: 'Continue')),
          AppTextBtn(
              text: 'Login as guest',
              fn: () {
                Navigator.pushNamed(context, '/home');
              },
              vm: 14,
              hm: 123)
        ],
      ),
    );
  }
}
