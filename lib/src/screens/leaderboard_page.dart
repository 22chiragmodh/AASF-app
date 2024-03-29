import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/widgets/AppBottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/AppLeaderboardCard.dart';
import 'package:aasf_iiitmg/src/widgets/AppLeaderboardTabbar.dart';
import 'package:aasf_iiitmg/src/widgets/AppProgressIndicator.dart';
import 'package:aasf_iiitmg/src/widgets/AppStatsCard.dart';
import 'package:aasf_iiitmg/src/widgets/AppWinningcard.dart';
import 'package:aasf_iiitmg/src/widgets/AppstackImage.dart';
import 'package:aasf_iiitmg/src/widgets/AppverifyText.dart';

import 'package:flutter/material.dart';

class LeaderBoradPage extends StatefulWidget {
  const LeaderBoradPage({super.key});

  @override
  State<LeaderBoradPage> createState() => _LeaderBoradPageState();
}

class _LeaderBoradPageState extends State<LeaderBoradPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool? indicatorcolor;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
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
          'Progress',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: const AppBottomAppbar(),
      body: TabBarView(controller: _tabController, children: [
        LeaderboardTabScreen(tabController: _tabController),
        StatsTabScreen(tabController: _tabController),
        WinningTabScreen(tabController: _tabController),
      ]),
    );
  }
}

class StatsTabScreen extends StatelessWidget {
  const StatsTabScreen({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppLeaderBoardTabBar(
          tabController: _tabController,
          indicatorcolor: true,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 292,
          height: 121,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              AppProgressIndicator(
                percent: 40,
                title: 'Technical',
              ),
              AppProgressIndicator(
                percent: 50,
                title: 'Managerial',
              ),
              AppProgressIndicator(
                percent: 60,
                title: 'Oratory',
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          children: const [
            AppStatsCard(
                pa: true, eventname: 'Demystifying Blockchain', day: 1),
            AppStatsCard(
                pa: true, eventname: 'Demystifying Blockchain', day: 2),
            AppStatsCard(
                pa: true, eventname: 'Demystifying Blockchain', day: 3),
            AppStatsCard(
                pa: false, eventname: 'Demystifying Blockchain', day: 4),
            AppStatsCard(
                pa: true, eventname: 'Demystifying Blockchain', day: 5),
            AppStatsCard(pa: true, eventname: 'Introduction to CP', day: 1),
            AppStatsCard(pa: false, eventname: 'Introduction to CP', day: 2),
            AppStatsCard(pa: true, eventname: 'Introduction to CP', day: 3),
            AppStatsCard(pa: true, eventname: 'Introduction to CP', day: 4),
          ],
        )
      ],
    );
  }
}

class WinningTabScreen extends StatelessWidget {
  const WinningTabScreen({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppLeaderBoardTabBar(
          tabController: _tabController,
          indicatorcolor: true,
        ),
        const SizedBox(
          height: 10,
        ),
        const Center(
          child: Image(image: AssetImage('assets/images/Asset 2 1.png')),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: const [
            AppWinningCard(
                eventname: 'Webkriti', imgurl: 'assets/images/Asset 2.png'),
            AppWinningCard(
                eventname: 'Jest a Minute',
                imgurl: 'assets/images/Asset 3.png'),
          ],
        ),
        Row(
          children: const [
            AppWinningCard(
                eventname: 'JPC-I', imgurl: 'assets/images/Asset 1.png'),
          ],
        ),
      ],
    );
  }
}

class LeaderboardTabScreen extends StatelessWidget {
  const LeaderboardTabScreen({
    Key? key,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppLeaderBoardTabBar(
          tabController: _tabController,
          indicatorcolor: true,
        ),
        const SizedBox(
          height: 10,
        ),
        const AppStackedImages(),
        AppVerifyTextField(
            padding: const EdgeInsets.only(left: 25, top: 20),
            text: 'Your Rank',
            text1: '',
            textstyle:
                Textstyle.inputtext(Appcolors.white(), 15.0, FontWeight.w400),
            textalign: TextAlign.left),
        const AppLeadrboardCard(
          rank: '7',
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: BaseStyle.linealignment(1.5),
        ),
        AppVerifyTextField(
            padding: const EdgeInsets.only(left: 25, top: 2),
            text: 'Overall Ranking',
            text1: '',
            textstyle:
                Textstyle.inputtext(Appcolors.white(), 15.0, FontWeight.w400),
            textalign: TextAlign.left),
        const AppLeadrboardCard(
          rank: '4',
        ),
        const AppLeadrboardCard(
          rank: '5',
        ),
        const AppLeadrboardCard(
          rank: '6',
        ),
        const AppLeadrboardCard(
          rank: '7',
        ),
        const AppLeadrboardCard(
          rank: '8',
        ),
        const AppLeadrboardCard(
          rank: '9',
        ),
      ],
    );
  }
}
