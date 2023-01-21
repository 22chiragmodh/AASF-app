import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';

class AppHomeEvents extends StatefulWidget {
  final String posterUrl;
  final String eventTitle;
  const AppHomeEvents({
    required this.eventTitle,
    required this.posterUrl,
    Key? key,
  }) : super(key: key);

  @override
  State<AppHomeEvents> createState() => _AppHomeEventsState();
}

class _AppHomeEventsState extends State<AppHomeEvents> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Appcolors.blogdecbg()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 286,
          decoration: BoxDecoration(color: Appcolors.posterbg()),
          child: Image.asset(widget.posterUrl),
        ),
        Column(
          children: [],
        ),
        AppVerifyTextField(
            padding: BaseStyle.listpadding(),
            text: widget.eventTitle,
            text1: '',
            textstyle:
                Textstyle.inputtext(Appcolors.white(), 24.0, FontWeight.w400),
            textalign: Textstyle.textalignstart()),
        AppVerifyTextField(
            padding: BaseStyle.listpadding(),
            text:
                "vvcvx bxhbvxhvbh nbxjhshvcx x xvhvxvx cbvxchjgvhjcv.......read more",
            text1: '',
            textstyle:
                Textstyle.inputtext(Appcolors.white(), 16.0, FontWeight.w300),
            textalign: Textstyle.textalignstart()),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 4),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.calendar_month,
                    color: Appcolors.blogiconcol(),
                  ),
                  label: Text(
                    '9th-25th Aug' '22',
                    style: Textstyle.inputtext(
                        Appcolors.blogiconcol(), 16.0, FontWeight.w400),
                  )),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.alarm,
                    color: Appcolors.blogiconcol(),
                  ),
                  label: Text(
                    '6:00 PM-8:00 PM',
                    style: Textstyle.inputtext(
                        Appcolors.blogiconcol(), 16.0, FontWeight.w400),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 4),
          child: Row(
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.location_pin,
                    color: Appcolors.blogiconcol(),
                  ),
                  label: Text(
                    'LT 1 Seminar Hall - 1 B - 001',
                    style: Textstyle.inputtext(
                        Appcolors.blogiconcol(), 16.0, FontWeight.w400),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 4),
          child: Row(
            children: [
              AppVerifyTextField(
                  padding: BaseStyle.listpadding(),
                  text: 'Organizers',
                  text1: "",
                  textstyle: Textstyle.inputtext(
                      Appcolors.blogiconcol(), 16.0, FontWeight.w400),
                  textalign: TextAlign.start),
              AppVerifyTextField(
                  padding: BaseStyle.listpadding(),
                  text: 'Abhinav Gupta  Avijeet Jain',
                  text1: "",
                  textstyle: Textstyle.inputtext(
                      Appcolors.blogiconcol(), 16.0, FontWeight.w400),
                  textalign: TextAlign.center)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, bottom: 4),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Appcolors.bordercolor())),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_note,
                      color: Appcolors.yew(),
                    ),
                    label: Text(
                      'Register',
                      style: TextStyle(color: Appcolors.yew()),
                    )),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notes,
                      color: Appcolors.yew(),
                    ),
                    label: Text(
                      'Resources',
                      style: TextStyle(color: Appcolors.yew()),
                    )),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
