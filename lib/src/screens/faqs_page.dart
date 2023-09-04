import 'dart:convert';
import 'package:aasf_iiitmg/src/models/faqData.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/appbottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/appfaqsdragdown.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class FaqsPage extends StatelessWidget {
  const FaqsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List faqsData = jsonDecode(FaqData.faqsData);

    return Scaffold(
        backgroundColor: Appcolors.primarycolor(),
        appBar: AppBar(
          backgroundColor: Appcolors.tagcolor(),
          title: const Text(
            'Faqs',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: const AppBottomAppbar(),
        body: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 314,
              height: 209,
              child: Image.asset('assets/images/FAQs-cuate 1.png'),
            ),
            AppVerifyTextField(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                text: 'General quiries',
                textstyle: Textstyle.winningtext(Appcolors.yew(), 14.0),
                textalign: TextAlign.start),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: faqsData.length,
                itemBuilder: (BuildContext context, int index) {
                  return AppFaqsDragdown(
                    title: faqsData[index]['Question'],
                    description: faqsData[index]['Answer'],
                  );
                }),
          ],
        ));
  }
}
