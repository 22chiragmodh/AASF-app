import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/appbottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/apptabbar.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 13);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primarycolor(),
      appBar: AppBar(
        backgroundColor: Appcolors.tagcolor(),
        title: const Text(
          'Timeline',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: AppBottomAppbar(
        token: "",
      ),
      body: ListView(
        children: [
          AppTabBar(
              screenmode: false,
              isiscrollable: true,
              tabController: _tabController),
          BaseStyle.linealignment(1.5),
          ConstantsVar
                      .monthEventslist[
                          ConstantsVar.timelinetextlist[_tabController!.index]]!
                      .isEmpty &&
                  _tabController!.index != 0
              ? Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: BaseStyle.listpadding(),
                      child: Image.asset('assets/images/Asset 1 2 (1).png'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppVerifyTextField(
                        padding: BaseStyle.listpadding(),
                        text: 'No Events Scheduled Yet',
                        text1: '',
                        textstyle: Textstyle.inputtext(
                            Appcolors.yew(), 24.0, FontWeight.w600),
                        textalign: TextAlign.center)
                  ],
                )
              : _tabController?.index == 0
                  ? Column(
                      children: [
                        timelinefunc(1),
                        timelinefunc(2),
                        timelinefunc(4),
                      ],
                    )
                  : timelinefunc(_tabController!.index)
        ],
      ),
    );
  }

  TimelineTile timelinefunc(int index) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      endChild: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Column(
          children: [
            for (int i = 0;
                i <
                    ConstantsVar
                        .monthEventslist[ConstantsVar.timelinetextlist[index]]!
                        .length;
                i++)
              BaseStyle.timelineCard(ConstantsVar
                  .monthEventslist[ConstantsVar.timelinetextlist[index]]![i]
                  .toString()),
          ],
        ),
      ),
      startChild: AppVerifyTextField(
          padding: const EdgeInsets.all(0),
          text: ConstantsVar.timelinetextlist[index],
          text1: '',
          textstyle:
              Textstyle.inputtext(Appcolors.yew(), 20.0, FontWeight.w600),
          textalign: TextAlign.center),
    );
  }
}
