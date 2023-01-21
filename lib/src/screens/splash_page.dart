import 'package:aasf_iiitmg/src/screens/landing_page.dart';
import 'package:flutter/material.dart';
import '../widgets/AppIcon.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LandingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppIcon(
        imgUrl: 'assets/images/aasf-transparent 1.png',
        imgwidth: MediaQuery.of(context).size.width * 0.75,
        imgheight: MediaQuery.of(context).size.height * 0.34,
        fit: BoxFit.cover,
      ),
    );
  }
}
