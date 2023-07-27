import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';

import 'package:aasf_iiitmg/src/widgets/Apptagselector.dart';

import 'package:flutter/material.dart';

class AppTabBar extends StatelessWidget {
  const AppTabBar({
    Key? key,
    required this.screenmode,
    required this.isiscrollable,
    required TabController? tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController? _tabController;
  final bool screenmode;
  final bool isiscrollable;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 326,
          height: 31,
          margin: EdgeInsets.only(
              left: !screenmode ? 17.0 : 50.0,
              right: 17.0,
              top: 10,
              bottom: 12),
          color: Appcolors.primarycolor(),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(26.5), // Creates border
                color: Appcolors.tagcolor()),
            tabs: [
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[0],
                        color: Appcolors.white())),
              SizedBox(
                width: 55,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[1]
                            : ConstantsVar.timelinetextlist[1],
                        color: Appcolors.white())),
              ),
              SizedBox(
                width: 40,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[2]
                            : ConstantsVar.timelinetextlist[2],
                        color: Appcolors.white())),
              ),
              SizedBox(
                width: 65,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[3]
                            : ConstantsVar.timelinetextlist[3],
                        color: Appcolors.white())),
              ),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[4],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[5],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[6],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[7],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[8],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[9],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[10],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[11],
                        color: Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[12],
                        color: Appcolors.white())),
            ],
          ),
        ),

        // Tabbar selected text
      ],
    );
  }
}
