import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLeaderBoardTabBar extends StatelessWidget {
  const AppLeaderBoardTabBar(
      {Key? key,
      required TabController? tabController,
      required bool this.indicatorcolor})
      : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;
  final bool? indicatorcolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: BaseStyle.listpadding(),
          color: Appcolors.primarycolor(),
          child: TabBar(
            controller: _tabController,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(26.5), // Creates border
                color: Appcolors.tagcolor()),
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/insights.svg',
                      width: 15,
                      height: 15,
                      color: Appcolors.white(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Leaderboard',
                      style: TextStyle(
                        fontSize: 9,
                        color: Appcolors.white(),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/pie_chart.svg',
                      width: 18,
                      height: 18,
                      color: Appcolors.white(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Statistics',
                      style: TextStyle(
                        fontSize: 10.6,
                        color: Appcolors.white(),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/images/sports_score.svg',
                      width: 18,
                      height: 18,
                      color: Appcolors.white(),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Winnings',
                      style: TextStyle(
                        fontSize: 10.6,
                        color: Appcolors.white(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
