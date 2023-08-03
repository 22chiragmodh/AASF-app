import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class AppSocialButton extends StatelessWidget {
  final SocialType? socialtype;
  const AppSocialButton({required this.socialtype, super.key});

  @override
  Widget build(BuildContext context) {
    Color? buttoncolor;
    Color? iconcolor;
    IconData? socialicon;

    switch (socialtype) {
      case SocialType.Facebook:
        iconcolor = Colors.white;
        buttoncolor = Appcolors.facebook();
        socialicon = FontAwesomeIcons.facebookF;
        break;
      case SocialType.Gmail:
        iconcolor = Colors.white;
        buttoncolor = Appcolors.google();
        socialicon = FontAwesomeIcons.envelope;
        break;
      case SocialType.Instagram:
        iconcolor = Colors.white;
        buttoncolor = Appcolors.instagram();
        socialicon = FontAwesomeIcons.instagram;
        break;
      case SocialType.Linkdn:
        iconcolor = Colors.white;
        buttoncolor = Appcolors.linkdn();
        socialicon = FontAwesomeIcons.linkedin;
        break;
      case SocialType.Website:
        iconcolor = Colors.white;
        buttoncolor = Appcolors.website();
        socialicon = FontAwesomeIcons.globe;
        break;

      default:
        iconcolor = Colors.white;
        buttoncolor = Appcolors.google();
        socialicon = FontAwesomeIcons.google;
    }

    return Container(
      height: BaseStyle.buttonheight(),
      width: BaseStyle.buttonheight(),
      decoration: BoxDecoration(
          color: buttoncolor,
          borderRadius: BorderRadius.circular(BaseStyle.borderradius()),
          boxShadow: BaseStyle.boxshow()),
      child: Icon(socialicon, color: iconcolor),
    );
  }
}

enum SocialType { Facebook, Linkdn, Instagram, Website, Gmail }
