// ignore: file_names
import 'dart:convert';

import 'package:aasf_iiitmg/src/screens/profile_page.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/Applinktext.dart';
import 'package:aasf_iiitmg/src/widgets/Apptext.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final studentDataProvider = Provider.of<StudentDataProvider>(context);
    // final studentData = studentDataProvider.studentData;
    // // ignore: avoid_print
    // print("#########3  $studentData");
    return Align(
      alignment: Alignment.topRight,
      child: SizedBox(
        height: 640,
        child: Drawer(
            width: 200,
            backgroundColor: Appcolors.blogdecbg(),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child: FutureBuilder<Map<String, dynamic>>(
                future: getStudentDataFromLocalStorage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return const Center(child: Text('Error loading data'));
                  } else {
                    final studentData = snapshot.data;

                    return ListView(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 28),
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(Icons.close),
                                visualDensity: VisualDensity.standard,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: BaseStyle.listpadding(),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage(
                                              studentData: studentData!,
                                            )));
                              },
                              child: studentData!['image'] == null
                                  ? CircleAvatar(
                                      radius: 60,
                                      child: Image.asset(
                                          'assets/images/userlogo.png'),
                                    )
                                  : CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          NetworkImage(studentData['image']),
                                    ),
                            ),
                          ),
                        ),
                        AppText(
                          text:
                              "${studentData['first_name']} ${studentData['last_name']}",
                          textstyle: Textstyle.inputtext(
                              Appcolors.yew(), 18.0, FontWeight.w600),
                        ),
                        AppText(
                          text: studentData['id'],
                          textstyle: Textstyle.inputtext(
                              Appcolors.white(), 20.0, FontWeight.w400),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                        ),
                        // AppLinkText(
                        //   text: 'FAQs',
                        //   textstyle: Textstyle.inputtext(
                        //       Appcolors.white(), 15.0, FontWeight.w400),
                        //   fn: () => Navigator.pushNamed(context, '/faqs'),
                        // ),
                        AppLinkText(
                          text: 'Report a bug',
                          textstyle: Textstyle.inputtext(
                              Appcolors.white(), 15.0, FontWeight.w400),
                          fn: () => Navigator.pushNamed(context, '/report'),
                        ),
                        AppLinkText(
                            text: 'Logout',
                            textstyle: Textstyle.inputtext(
                                Appcolors.white(), 15.0, FontWeight.w400),
                            fn: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              // Remove data for the 'counter' key.
                              await prefs.remove('authToken');
                              await prefs.remove('eventsData');
                              await prefs.remove('blogsData');
                              await prefs.remove('abhisharData');

                              Navigator.pushNamed(context, '/verification');
                            }),
                      ],
                    );
                  }
                })),
      ),
    );
  }

  Future<Map<String, dynamic>> getStudentDataFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentDataString = prefs.getString('studentData');
    print("###### $studentDataString");
    if (studentDataString != null) {
      return Map<String, dynamic>.from(jsonDecode(studentDataString));
    }
    return {}; // Return an empty map if data is not available
  }
}
