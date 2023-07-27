import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
// import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/widgets/appreadmore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppHomeEvents extends StatefulWidget {
  // final String posterUrl;
  // final String eventTitle;
  final String iconUrl;
  final String icontitle;
  final TabController tabController;
  final Map<String, dynamic> event;
  final String startdate;
  final String enddate;
  final String starttime;
  final String endtime;

  const AppHomeEvents({
    // required this.eventTitle,
    required this.iconUrl,
    required this.icontitle,
    required this.tabController,
    // required this.posterUrl,
    Key? key,
    required this.event,
    required this.startdate,
    required this.enddate,
    required this.starttime,
    required this.endtime,
  }) : super(key: key);

  @override
  State<AppHomeEvents> createState() => _AppHomeEventsState();
}

class _AppHomeEventsState extends State<AppHomeEvents> {
  @override
  Widget build(BuildContext context) {
    List<dynamic> eventImages = widget.event["event_images"];
    return Container(
      decoration: BoxDecoration(color: Appcolors.blogdecbg()),
      child: Column(children: [
        eventImages.isEmpty
            ? Image.asset("assets/images/Asset 1 2 (1).png")
            : eventImages.length == 1
                ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    decoration: BoxDecoration(color: Appcolors.posterbg()),
                    child: Image.network(
                      eventImages[0]['image_url'],
                      // width: 1000,
                      // fit: BoxFit.cover,
                    ))
                : CarouselSlider(
                    options: CarouselOptions(
                      aspectRatio: 2,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                    ),
                    items: eventImages.map<Widget>((image) {
                      return Container(
                        child: Center(
                          child: Image.network(
                            image['image_url'],
                            width: 1000,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
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
                  widget.event["name"],
                  style: Textstyle.inputtext(
                    Appcolors.white(),
                    20.0,
                    FontWeight.w400,
                  ),
                ),
              ),
              AppReadmore(
                description: widget.event["description"],
              ),
              Row(
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.calendar_month,
                        color: Appcolors.blogiconcol(),
                      ),
                      label: Text(
                        '${widget.startdate} - ${widget.enddate}',
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
                        '${widget.starttime} - ${widget.endtime}',
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
                      label: widget.event['type'] != "online"
                          ? Text(
                              'LT 1 Seminar Hall - 1 B - 001',
                              style: Textstyle.inputtext(
                                  Appcolors.blogiconcol(),
                                  14.0,
                                  FontWeight.w400),
                            )
                          : Text(
                              'Online',
                              style: Textstyle.inputtext(
                                  Appcolors.blogiconcol(),
                                  14.0,
                                  FontWeight.w400),
                            )),
                ],
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Container(
              //         width: 84,
              //         height: 19,
              //         margin: const EdgeInsets.only(
              //             left: 15.04, right: 2.04, top: 8),
              //         child: Text("Organizers",
              //             style: Textstyle.inputtext(
              //                 Appcolors.blogiconcol(), 14.0, FontWeight.w400))),
              //     Container(
              //         height: 60,
              //         width: 242,
              //         margin: const EdgeInsets.only(
              //             left: 2.04, right: 15, top: 12.22),
              //         child: Text(
              //             "Abhinav Gupta  Avijeet Jain  Harshith Mente Lata  Muskan Debnath  Pranav ",
              //             style: Textstyle.inputtext(
              //                 Appcolors.blogiconcol(), 14.0, FontWeight.w400)))
              //   ],
              // ),
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
                    onPressed: () async {
                      String resourcesUrl = widget.event['resource_link'];
                      await launchUrl(Uri.parse(resourcesUrl));
                    },
                    icon: const Image(
                        image: AssetImage('assets/images/description.png')),
                    label: Text(
                      'Resources',
                      style: TextStyle(color: Appcolors.yew()),
                    )),
                widget.event['type'] == "online"
                    ? TextButton.icon(
                        onPressed: () async {
                          String meetUrl =
                              widget.event['event_links'][0]['url'];
                          await launchUrl(Uri.parse(meetUrl));
                        },
                        icon: const Image(
                            image: AssetImage('assets/images/description.png')),
                        label: Text(
                          'Join Meet',
                          style: TextStyle(color: Appcolors.yew()),
                        ))
                    : const Text(""),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
