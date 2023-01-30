import 'package:aasf_iiitmg/routes.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:aasf_iiitmg/src/screens/splash_page.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // iOS requires you run in release mode to test dynamic links ("flutter run --release").
  await Firebase.initializeApp();

  runApp(const AasfApp());
}

class AasfApp extends StatefulWidget {
  const AasfApp({super.key});

  @override
  State<AasfApp> createState() => _AasfAppState();
}

class _AasfAppState extends State<AasfApp> {
  @override
  void initState() {
    super.initState();
    initDynamcilinks();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoApp();
    } else {
      return GetMaterialApp(
        routes: {
          '/home': (BuildContext context) => const HomePage(),
        },
        theme: ThemeData.dark(),
        onGenerateRoute: Routes.materialRoutes,
        // theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    }
  }
}

Future<void> initDynamcilinks() async {
  FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) async {
    if (dynamicLinkData.link != null) {
      Get.toNamed('/home');
      // Navigator.pushReplacementNamed(context, 'home');
      print('deeplink' + dynamicLinkData.link.toString());
    }
  }).onError((error) {
    print('onLink error');
    print(error.message);
  });
}
