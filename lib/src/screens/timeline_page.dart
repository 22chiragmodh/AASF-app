import 'dart:convert';

import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/appbottomappbar.dart';
// import 'package:aasf_iiitmg/src/widgets/apptabbar.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:dio/dio.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  State<TimelinePage> createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  Map<String, dynamic> eventData = {};
  List<dynamic> rangeDate = [];
  int rangeLength = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeTimelineData();
  }

  void _handleTabSelection() {
    setState(() {});
  }

  Future<void> fetchEventsByTimeline() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      Dio dio = Dio();
      Response response = await dio.get("${ConstantsVar.url}/events/timeline");
      Map<String, dynamic> responseData = response.data;
      if (responseData['success'] == 1) {
        List<dynamic> timelineData = [
          responseData['data']['timeline'],
          responseData['data']['range']
        ];
        await prefs.setString('timelineData', jsonEncode(timelineData));
        setState(() {
          eventData = responseData['data']['timeline'];
          rangeDate = responseData['data']['range'];
          rangeLength = rangeDate.length + 1;
          _tabController = TabController(vsync: this, length: rangeLength);
          _tabController?.addListener(_handleTabSelection);
          print(rangeDate);
          print(eventData);
        });
      }
    } catch (e) {
      print(e.toString());
      print('Error: Failed to fetch data');
    }
  }

  Future<List<dynamic>> fetchDataFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataString = prefs.getString(key);
    if (dataString != null) {
      return jsonDecode(dataString);
    }
    return [];
  }

  void _initializeTimelineData() async {
    setState(() {
      isLoading = true;
    });

    List<dynamic> timelineData =
        await fetchDataFromSharedPreferences('timelineData');
    if (timelineData.isNotEmpty) {
      setState(() {
        eventData = timelineData[0];
        rangeDate = timelineData[1];
        rangeLength = rangeDate.length + 1;
        _tabController = TabController(vsync: this, length: rangeLength);
        _tabController?.addListener(_handleTabSelection);
        isLoading = false;
      });
    } else {
      await fetchEventsByTimeline();
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Tab(
        child: Text(
          'Timeline',
          style: TextStyle(color: Appcolors.white()),
        ),
      ),
      ...rangeDate
          .map(
            (month) => Tab(
              child: Text(
                month.toString(),
                style: TextStyle(color: Appcolors.white()),
              ),
            ),
          )
          .toList(),
    ];
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
      body: Column(
        children: [
          Container(
            width: 370,
            height: 31,
            margin: const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 20, bottom: 20),
            // color: Appcolors.primarycolor(),
            child: _tabController != null
                ? TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.5),
                      color: Appcolors.tagcolor(),
                    ),
                    controller: _tabController,
                    isScrollable: true,
                    tabs: tabs,
                  )
                : SizedBox(),
          ),
          BaseStyle.linealignment(2.0),
          Flexible(
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView(children: [
                      // _buildEventsList('Timeline'),
                      // timelinefunc(
                      //   eventData,
                      // ),

                      if (_tabController!.index == 0)
                        ...eventData.entries.map((entry) => timelinefunc(entry))
                      else
                        _buildEventsList(rangeDate[_tabController!.index - 1]),
                    ])
              // Placeholder widget when TabController is null
              ),
        ],
      ),
    );
  }

  TimelineTile timelinefunc(MapEntry<String, dynamic> evententry) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      endChild: Container(
        constraints: const BoxConstraints(
          minHeight: 120,
        ),
        child: Column(
          children: [
            for (var event in evententry.value)
              BaseStyle.timelineCard(event['name'].toString(), 230),
          ],
        ),
      ),
      startChild: AppVerifyTextField(
        padding: const EdgeInsets.all(0),
        text: evententry.key,
        text1: '',
        textstyle: Textstyle.inputtext(Appcolors.yew(), 20.0, FontWeight.w600),
        textalign: TextAlign.center,
      ),
    );
  }

  Widget _buildEventsList(String month) {
    // String selectedMonth = ConstantsVar.timelinetextlist[_tabController!.index];

    List<dynamic> events = eventData[month] ?? [];

    if (events.isEmpty) {
      return Column(
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
            textstyle:
                Textstyle.inputtext(Appcolors.yew(), 24.0, FontWeight.w600),
            textalign: TextAlign.center,
          ),
        ],
      );
    }

    return Column(
      children: events.map((event) {
        String eventName = event['name'];
        return BaseStyle.timelineCard(eventName, 350);
      }).toList(),
    );
  }
}
