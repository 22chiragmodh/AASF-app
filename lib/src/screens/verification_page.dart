import 'package:aasf_iiitmg/src/screens/otp_page.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/Appinputfield.dart';
import 'package:aasf_iiitmg/src/widgets/Apptextbtn.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../utils/constants.dart';

class VerifictionPage extends StatefulWidget {
  @override
  State<VerifictionPage> createState() => _VerifictionPageState();
}

class _VerifictionPageState extends State<VerifictionPage> {
  TextEditingController emailController = TextEditingController();

  void userVerify(String email) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio
          .post("${ConstantsVar.url}/users/login", data: {'roll': email});

      if (response.statusCode == 200) {
        print(response.data['message']);

        // ignore: use_build_context_synchronously
        var snackBar = SnackBar(content: Text(response.data['message']));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        // ignore: use_build_context_synchronously
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OtpScreen(
                      emailid: emailController.text,
                    )));
      }
    } catch (e) {
      print(e.toString());
    }
  }

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
              text: 'Enter your institute Roll No',
              textstyle: Textstyle.inputtext(
                  Appcolors.titlewhite(), 15.0, FontWeight.w500)),
          AppInputField(
              controller: emailController,
              hinttext: '2020IMT-058',
              textintype: TextInputType.emailAddress),
          GestureDetector(
              onTap: (() {
                // Navigator.pushNamed(context, '/home');
                userVerify(emailController.text);
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
