import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
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
          margin: const EdgeInsets.only(left: 17.0, right: 17.0, top: 25),
          color: Appcolors.primarycolor(),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(26.5), // Creates border
                color: (_tabController?.index == _tabController?.length.toInt())
                    ? Appcolors.tagcolor()
                    : Appcolors.white()),
            tabs: [
              SizedBox(
                width: 60,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[0]
                            : ConstantsVar.timelinetextlist[0],
                        color: _tabController?.index == 0
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              ),
              SizedBox(
                width: 50,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[1]
                            : ConstantsVar.timelinetextlist[1],
                        color: _tabController?.index == 1
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              ),
              SizedBox(
                width: 64,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[2]
                            : ConstantsVar.timelinetextlist[2],
                        color: _tabController?.index == 2
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              ),
              SizedBox(
                width: 44,
                child: Tab(
                    child: TagSelector(
                        text: screenmode
                            ? ConstantsVar.hometextlist[3]
                            : ConstantsVar.timelinetextlist[3],
                        color: _tabController?.index == 3
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              ),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[4],
                        color: _tabController?.index == 4
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[5],
                        color: _tabController?.index == 5
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[6],
                        color: _tabController?.index == 6
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[7],
                        color: _tabController?.index == 7
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[8],
                        color: _tabController?.index == 8
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[9],
                        color: _tabController?.index == 9
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[10],
                        color: _tabController?.index == 10
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[11],
                        color: _tabController?.index == 11
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
              if (!screenmode)
                Tab(
                    child: TagSelector(
                        text: ConstantsVar.timelinetextlist[12],
                        color: _tabController?.index == 12
                            ? Appcolors.tagcolor()
                            : Appcolors.white())),
            ],
          ),
        ),

        // Tabbar selected text
        if (screenmode)
          Container(
            margin: const EdgeInsets.only(top: 20, left: 45, bottom: 16),
            alignment: Alignment.topLeft,
            child: Text(
              ConstantsVar.hometextlist[_tabController!.index],
              style:
                  Textstyle.inputtext(Appcolors.white(), 16, FontWeight.w400),
            ),
          )
      ],
    );
  }
}
