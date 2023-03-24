import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';

import 'package:aasf_iiitmg/src/widgets/AppAbhishar.dart';
import 'package:aasf_iiitmg/src/widgets/AppBottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/AppDrawer.dart';
import 'package:aasf_iiitmg/src/widgets/AppTabBar.dart';
import 'package:aasf_iiitmg/src/widgets/ApphomEvents.dart';
import 'package:aasf_iiitmg/src/widgets/ApphomeBlogs.dart';

import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
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
      body: Column(
        children: [
          AppTabBar(
              screenmode: true,
              isiscrollable: false,
              tabController: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                allTag(_tabController!),
                eventsTag(_tabController!),
                abhisharTag(_tabController!),
                blogsTag(_tabController!)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget allTag(TabController tabController) {
  return ListView(
    children: [
      // Events, Blog poster

      //Event tile

      AppHomeEvents(
        eventTitle: "Events",
        iconUrl: 'assets/images/edit_document.png',
        icontitle: 'Register',
        posterUrl: 'assets/images/Web Week-Backend 1 (1).png',
        tabController: tabController,
      ),

      AppHomeEvents(
        eventTitle: "Events",
        icontitle: 'Feedback',
        iconUrl: 'assets/images/rate_review.png',
        posterUrl: 'assets/images/image 6.png',
        tabController: tabController,
      ),

      AppHomeBlogs(
        eventTitle: "Online Card Transactions",
        posterUrl: 'assets/images/Pic (1).png',
        tabController: tabController,
      ),

      AppAbhishar(
        eventTitle: 'A Jog Down the Sports Lane',
        posterUrl: 'assets/images/image 10.png',
        tabController: tabController,
      )
    ],
  );
}

Widget eventsTag(TabController tabController) {
  return ListView(
    children: [
      // Events, Blog poster

      //Event tile

      AppHomeEvents(
        eventTitle: "Events",
        iconUrl: 'assets/images/edit_document.png',
        icontitle: 'Register',
        posterUrl: 'assets/images/Web Week-Backend 1 (1).png',
        tabController: tabController,
      ),

      AppHomeEvents(
        eventTitle: "Events",
        iconUrl: 'assets/images/rate_review.png',
        icontitle: 'Feedback',
        posterUrl: 'assets/images/image 6.png',
        tabController: tabController,
      ),
    ],
  );
}

Widget blogsTag(TabController tabController) {
  return ListView(
    children: [
      // Events, Blog poster

      AppHomeBlogs(
        eventTitle: "Online Card Transactions",
        posterUrl: 'assets/images/Pic (1).png',
        tabController: tabController,
      ),

      //Event tile
    ],
  );
}

Widget abhisharTag(TabController tabController) {
  return ListView(
    children: [
      // Events, Blog poster

      //Event tile

      AppAbhishar(
        eventTitle: 'A Jog Down the Sports Lane',
        posterUrl: 'assets/images/image 10.png',
        tabController: tabController,
      )
    ],
  );
}
