import 'package:aasf_iiitmg/src/screens/faqs_page.dart';

import 'package:aasf_iiitmg/src/screens/landing_page.dart';

import 'package:aasf_iiitmg/src/screens/report_page.dart';
import 'package:aasf_iiitmg/src/screens/splash_page.dart';
import 'package:aasf_iiitmg/src/screens/timeline_page.dart';
import 'package:aasf_iiitmg/src/screens/verification_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case "/landing":
        return MaterialPageRoute(builder: (context) => const LandingPage());

      case "/verification":
        return MaterialPageRoute(builder: (context) => const VerifictionPage());

      case "/timeline":
        return MaterialPageRoute(builder: (context) => const TimelinePage());
      case "/report":
        return MaterialPageRoute(builder: (context) => const ReortPage());
      case "/faqs":
        return MaterialPageRoute(builder: (context) => const FaqsPage());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
