import 'package:aasf_iiitmg/routes.dart';

import 'package:aasf_iiitmg/src/screens/splash_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

void main() => runApp(const AasfApp());

class AasfApp extends StatelessWidget {
  const AasfApp({super.key});

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
        home: const SplashScreen(),
      );
    }
  }
}
