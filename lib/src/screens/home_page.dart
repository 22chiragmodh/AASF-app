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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primarycolor(),
      appBar: BaseStyle.appbar(
        context: context,
        backbtn: true,
      ),
      endDrawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomAppbar(),
      body: ListView(
        children: [
          //  Tabbar
          AppTabBar(
            screenmode: true,
            tabController: _tabController,
            isiscrollable: false,
          ),
          // Events, Blog poster

          //Event tile
          const AppHomeEvents(
              eventTitle: "Web Week-Backend",
              posterUrl: 'assets/images/Web Week-Backend 1 (1).png'),
          const AppHomeEvents(
              eventTitle: "Web Week-Frontend",
              posterUrl: 'assets/images/image 6.png'),

          const AppHomeBlogs(
              eventTitle: "Online Card Transactions",
              posterUrl: 'assets/images/Pic (1).png'),

          const AppAbhishar(
              eventTitle: 'A Jog Down the Sports Lane',
              posterUrl: 'assets/images/image 10.png')
        ],
      ),
    );
  }
}
