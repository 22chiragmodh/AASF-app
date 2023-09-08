import 'package:aasf_iiitmg/routes.dart';

import 'package:aasf_iiitmg/src/provider/studentdata.dart';
import 'package:aasf_iiitmg/src/screens/faqs_page.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:aasf_iiitmg/src/screens/leaderboard_page.dart';
import 'package:aasf_iiitmg/src/screens/qr_page.dart';

import 'package:aasf_iiitmg/src/screens/splash_page.dart';
import 'package:aasf_iiitmg/src/screens/timeline_page.dart';
import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/widgets/appdrawer.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
// import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? authToken = prefs.getString('authToken');
  print("%%%%%%% $authToken");
  // iOS requires you run in release mode to test dynamic links ("flutter run --release").

  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentDataProvider(),
      child: AasfApp(authToken: authToken),
    ),
  );
}

class AasfApp extends StatefulWidget {
  final String? authToken;
  const AasfApp({super.key, this.authToken});

  @override
  State<AasfApp> createState() => _AasfAppState();
}

class _AasfAppState extends State<AasfApp> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    HomePage(),
    LeaderBoradPage(),
    QrCodeScanner(),
    TimelinePage(),
    FaqsPage(),

    // Add your other screens here
  ];

  final List<String> _titleAppbar = [
    "Home",
    "Progress",
    "Attendence",
    "Timeline",
    "Faqs"
  ];

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoApp();
    } else {
      return MaterialApp(
          theme: ThemeData.dark(),
          onGenerateRoute: Routes.materialRoutes,
          // theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Appcolors.primarycolor(),
            appBar: _selectedIndex == 0
                ? BaseStyle.appbar(
                    context: context,
                    backbtn: true,
                  )
                : AppBar(
                    backgroundColor: Appcolors.tagcolor(),
                    title: Text(
                      _titleAppbar[_selectedIndex],
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w500),
                    ),
                    automaticallyImplyLeading: false,
                  ),
            endDrawer: const AppDrawer(),
            body: widget.authToken == null // Check if authToken is present
                ? const SplashScreen()
                : IndexedStack(
                    index: _selectedIndex,
                    children: _screens,
                  ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/home.svg'),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/leaderboard.svg'),
                    label: 'Progress',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset('assets/images/qr_code_scanner.svg'),
                    label: 'Attendance',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/calendar_month.svg',
                    ),
                    label: 'Timeline',
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/quiz.svg',
                    ),
                    label: 'Faqs',
                  ),
                ]),
          ));
    }
  }
}
