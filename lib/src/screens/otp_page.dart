import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/Appbutton.dart';
import 'package:aasf_iiitmg/src/widgets/Appotptextfield.dart';
import 'package:aasf_iiitmg/src/widgets/Apptext.dart';
import 'package:aasf_iiitmg/src/widgets/Apptextbtn.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.emailid});
  final String emailid;
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController? contrller1;
  TextEditingController? contrller2;
  TextEditingController? contrller3;
  TextEditingController? contrller4;
  String Code = "";

  final url = "http://192.168.64.185:3000/users/login";

  void otpVerify(String email, String otp) async {
    Response response;
    var dio = Dio();
    try {
      response = await dio.post(url, data: {'roll': email, 'otp': otp});

      if (response.statusCode == 200) {
        print(response.data['message']);

        //Store token local secure storage
        var token = response.data['token'];

        print(token);

        var snackBar = SnackBar(content: Text(response.data['message']));
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, '/home');
      }
      print(response.data);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    contrller1 = TextEditingController();
    contrller2 = TextEditingController();
    contrller3 = TextEditingController();
    contrller4 = TextEditingController();
  }

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
                      OtpTextField(
                        first: true,
                        last: false,
                        context: context,
                        controller: contrller1 as TextEditingController,
                      ),
                      OtpTextField(
                        first: false,
                        last: false,
                        context: context,
                        controller: contrller2 as TextEditingController,
                      ),
                      OtpTextField(
                        first: false,
                        last: false,
                        context: context,
                        controller: contrller3 as TextEditingController,
                      ),
                      OtpTextField(
                        first: false,
                        last: true,
                        context: context,
                        controller: contrller4 as TextEditingController,
                      ),
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
                if (contrller1!.text.isNotEmpty &&
                    contrller2!.text.isNotEmpty &&
                    contrller3!.text.isNotEmpty &&
                    contrller4!.text.isNotEmpty) {
                  Code = contrller1!.text.toString() +
                      contrller2!.text.toString() +
                      contrller3!.text.toString() +
                      contrller4!.text.toString();

                  otpVerify(widget.emailid, Code);
                }
              },
            )
          ],
        ),
      ),
    );
    ;
  }
}
