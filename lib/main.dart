import 'package:aasf_iiitmg/routes.dart';
import 'package:aasf_iiitmg/src/controller/studentsData.dart';
import 'package:aasf_iiitmg/src/provider/studentdata.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';

import 'package:aasf_iiitmg/src/screens/splash_page.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        home: widget.authToken != null // Check if authToken is present
            ? const HomePage()
            : const SplashScreen(),
      );
    }
  }
}
