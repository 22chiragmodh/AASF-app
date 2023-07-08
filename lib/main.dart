import 'package:aasf_iiitmg/routes.dart';
import 'package:aasf_iiitmg/src/provider/studentdata.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';

import 'package:aasf_iiitmg/src/screens/splash_page.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // iOS requires you run in release mode to test dynamic links ("flutter run --release").

  runApp(
    ChangeNotifierProvider(
      create: (context) => StudentDataProvider(),
      child: const AasfApp(),
    ),
  );
}

class AasfApp extends StatefulWidget {
  const AasfApp({super.key});

  @override
  State<AasfApp> createState() => _AasfAppState();
}

class _AasfAppState extends State<AasfApp> {
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoApp();
    } else {
      return GetMaterialApp(
        theme: ThemeData.dark(),
        onGenerateRoute: Routes.materialRoutes,
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    }
  }
}
