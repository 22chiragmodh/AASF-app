import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/Appreadmore.dart';
import 'package:flutter/material.dart';

class AppHomeEvents extends StatefulWidget {
  final String posterUrl;
  final String eventTitle;
  final String iconUrl;
  final String icontitle;
  const AppHomeEvents({
    required this.eventTitle,
    required this.iconUrl,
    required this.icontitle,
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
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 286,
          decoration: BoxDecoration(color: Appcolors.posterbg()),
          child: Image.asset(widget.posterUrl),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15.04, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15.04, vertical: 4),
                child: Text(
                  widget.eventTitle,
                  style: Textstyle.inputtext(
                    Appcolors.white(),
                    20.0,
                    FontWeight.w400,
                  ),
                ),
              ),
              AppReadmore(),
              Row(
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
                            Appcolors.blogiconcol(), 14.0, FontWeight.w400),
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
                            Appcolors.blogiconcol(), 14.0, FontWeight.w400),
                      )),
                ],
              ),
              Row(
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
                            Appcolors.blogiconcol(), 14.0, FontWeight.w400),
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 84,
                      height: 19,
                      margin: const EdgeInsets.only(
                          left: 15.04, right: 2.04, top: 8),
                      child: Text("Organizers",
                          style: Textstyle.inputtext(
                              Appcolors.blogiconcol(), 14.0, FontWeight.w400))),
                  Container(
                      height: 57,
                      width: 242,
                      margin: const EdgeInsets.only(
                          left: 2.04, right: 15, top: 12.22),
                      child: Text(
                          "Abhinav Gupta  Avijeet Jain  Harshith Mente Lata  Muskan Debnath  Pranav ",
                          style: Textstyle.inputtext(
                              Appcolors.blogiconcol(), 14.0, FontWeight.w400)))
                ],
              ),
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
                    icon: Image(image: AssetImage(widget.iconUrl)),
                    label: Text(
                      widget.icontitle,
                      style: TextStyle(color: Appcolors.yew()),
                    )),
                TextButton.icon(
                    onPressed: () {},
                    icon: const Image(
                        image: AssetImage('assets/images/description.png')),
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
