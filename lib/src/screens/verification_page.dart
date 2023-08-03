import 'package:aasf_iiitmg/src/provider/studentdata.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/appinputfield.dart';
import 'package:aasf_iiitmg/src/widgets/apptextbtn.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:localstorage/localstorage.dart';
import '../utils/constants.dart';
import 'package:provider/provider.dart';

class VerifictionPage extends StatefulWidget {
  const VerifictionPage({super.key});

  @override
  State<VerifictionPage> createState() => _VerifictionPageState();
}

class _VerifictionPageState extends State<VerifictionPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String authToken = "";

  @override
  Widget build(BuildContext context) {
    final studentDataProvider = Provider.of<StudentDataProvider>(context);
    void userVerify(String email, String password) async {
      Response response;
      SnackBar snackBar;
      var dio = Dio();

      try {
        response = await dio.post("${ConstantsVar.url}/auth/login",
            data: {'username': email, 'password': password});

        if (response.data['success'] == 1) {
          Map<String, dynamic> studentData = response.data['data']['user'];

          authToken = studentData['token']['token'];

          ConstantsVar.token = authToken.toString();
          print(ConstantsVar.token);
          studentDataProvider.setStudentData(studentData);

          // ignore: avoid_print
          print(studentData);
          snackBar = SnackBar(
            content: Text(response.data['message'],
                style: const TextStyle(color: Colors.greenAccent)),
            backgroundColor: (Colors.white),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        authToken: authToken,
                      )));
        } else {
          snackBar = SnackBar(
            content: Text(response.data['message'],
                style: const TextStyle(color: Colors.redAccent)),
            backgroundColor: (Colors.white),
          );
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
      // ignore: avoid_print
      print("hello");
    }

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
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          AppVerifyTextField(
              textalign: Textstyle.textalignstart(),
              padding: BaseStyle.listpadding(),
              text1: '',
              text: 'Institute Roll No',
              textstyle: Textstyle.inputtext(
                  Appcolors.titlewhite(), 15.0, FontWeight.w500)),
          AppInputField(
              controller: emailController,
              hinttext: '2020IMG-016',
              textintype: TextInputType.emailAddress),
          AppVerifyTextField(
              textalign: Textstyle.textalignstart(),
              padding: BaseStyle.listpadding(),
              text1: '',
              text: 'Password',
              textstyle: Textstyle.inputtext(
                  Appcolors.titlewhite(), 15.0, FontWeight.w500)),
          AppInputField(
            controller: passwordController,
            hinttext: 'Enter your password',
            textintype: TextInputType.text,
            hidentext: true,
          ),
          GestureDetector(
              onTap: () {
                userVerify(emailController.text, passwordController.text);
              },
              child: const AppButton(buttontext: 'Login')),
          AppTextBtn(
              text: 'Forgot Password',
              fn: () {
                SnackBar forpassSnackBar = const SnackBar(
                  content: Text(
                      'Please contact to any aasf member to resest password !',
                      style:
                          TextStyle(color: Color.fromARGB(255, 211, 28, 28))),
                  backgroundColor: (Colors.white),
                );
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(forpassSnackBar);
              },
              vm: 14,
              hm: 80)
        ],
      ),
    );
  }
}
