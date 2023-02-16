import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/widgets/AppAbhishar.dart';
import 'package:aasf_iiitmg/src/widgets/AppBottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/AppDrawer.dart';
import 'package:aasf_iiitmg/src/widgets/AppTabBar.dart';
import 'package:aasf_iiitmg/src/widgets/ApphomEvents.dart';
import 'package:aasf_iiitmg/src/widgets/ApphomeBlogs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
    _tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  void getEventsData() async {
    final LocalStorage storage = LocalStorage('localstorage_aasfapp');
    Response response;
    var dio = Dio();

    response = await dio.get("${ConstantsVar.url}/events");

    if (response.statusCode == 200) {
      final data = response.data;
      storage.setItem('eventsData', data);

      print(response.data);
    }

    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primarycolor(),
      appBar: BaseStyle.appbar(
        context: context,
        backbtn: true,
      ),
      endDrawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomAppbar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          allTag(_tabController!),
          eventsTag(_tabController!),
          abhisharTag(_tabController!),
          blogsTag(_tabController!),
        ],
      ),
    );
  }
}

Widget allTag(TabController _tabController) {
  return ListView(
    children: [
      AppTabBar(
        screenmode: true,
        tabController: _tabController,
        isiscrollable: false,
      ),
      // Events, Blog poster

      //Event tile

      const AppHomeEvents(
          eventTitle: "Web Week-Backend",
          iconUrl: 'assets/images/edit_document.png',
          icontitle: 'Register',
          posterUrl: 'assets/images/Web Week-Backend 1 (1).png'),

      const AppHomeEvents(
          eventTitle: "Web Week-Frontend",
          icontitle: 'Feedback',
          iconUrl: 'assets/images/rate_review.png',
          posterUrl: 'assets/images/image 6.png'),

      const AppHomeBlogs(
          eventTitle: "Online Card Transactions",
          posterUrl: 'assets/images/Pic (1).png'),

      const AppAbhishar(
          eventTitle: 'A Jog Down the Sports Lane',
          posterUrl: 'assets/images/image 10.png')
    ],
  );
}

Widget eventsTag(TabController tabController) {
  return ListView(
    children: [
      AppTabBar(
        screenmode: true,
        tabController: tabController,
        isiscrollable: false,
      ),
      // Events, Blog poster

      //Event tile

      const AppHomeEvents(
          eventTitle: "Web Week-Backend",
          iconUrl: 'assets/images/edit_document.png',
          icontitle: 'Register',
          posterUrl: 'assets/images/Web Week-Backend 1 (1).png'),

      const AppHomeEvents(
          eventTitle: "Web Week-Frontend",
          iconUrl: 'assets/images/rate_review.png',
          icontitle: 'Feedback',
          posterUrl: 'assets/images/image 6.png'),
    ],
  );
}

Widget blogsTag(TabController tabController) {
  return ListView(
    children: [
      AppTabBar(
        screenmode: true,
        tabController: tabController,
        isiscrollable: false,
      ),
      // Events, Blog poster

      const AppHomeBlogs(
          eventTitle: "Online Card Transactions",
          posterUrl: 'assets/images/Pic (1).png'),

      //Event tile
    ],
  );
}

Widget abhisharTag(TabController tabController) {
  return ListView(
    children: [
      AppTabBar(
        screenmode: true,
        tabController: tabController,
        isiscrollable: false,
      ),
      // Events, Blog poster

      //Event tile

      const AppAbhishar(
          eventTitle: 'A Jog Down the Sports Lane',
          posterUrl: 'assets/images/image 10.png')
    ],
  );
}
