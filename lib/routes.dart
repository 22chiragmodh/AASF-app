import 'package:aasf_iiitmg/src/screens/deeplinking.dart';
import 'package:aasf_iiitmg/src/screens/faqs_page.dart';
import 'package:aasf_iiitmg/src/screens/home_page.dart';
import 'package:aasf_iiitmg/src/screens/landing_page.dart';
import 'package:aasf_iiitmg/src/screens/leaderboard_page.dart';
import 'package:aasf_iiitmg/src/screens/otp_page.dart';
import 'package:aasf_iiitmg/src/screens/profile_page.dart';
import 'package:aasf_iiitmg/src/screens/report_page.dart';
import 'package:aasf_iiitmg/src/screens/splash_page.dart';
import 'package:aasf_iiitmg/src/screens/timeline_page.dart';
import 'package:aasf_iiitmg/src/screens/verification_page.dart';
import 'package:flutter/material.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (context) => const HomePage());
      case "/":
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case "/landing":
        return MaterialPageRoute(builder: (context) => const LandingPage());

      case "/verification":
        return MaterialPageRoute(builder: (context) => const VerifictionPage());
      case "/deeplinking":
        return MaterialPageRoute(builder: (context) => const DeepLinking());

      case "/otppage":
        return MaterialPageRoute(builder: (context) => const OtpScreen());

      case "/progress":
        return MaterialPageRoute(builder: (context) => const LeaderBoradPage());
      case "/timeline":
        return MaterialPageRoute(builder: (context) => const TimelinePage());
      case "/report":
        return MaterialPageRoute(builder: (context) => const ReortPage());
      case "/faqs":
        return MaterialPageRoute(builder: (context) => const FaqsPage());
      case "/profile":
        return MaterialPageRoute(builder: (context) => const ProfilePage());

      default:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
    }
  }
}
