import 'package:aasf_iiitmg/src/styles/basestyle.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';
import 'package:aasf_iiitmg/src/styles/textstyle.dart';
import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:dio/dio.dart';

import 'package:aasf_iiitmg/src/widgets/appbottomappbar.dart';
import 'package:aasf_iiitmg/src/widgets/appleaderboardcard.dart';
import 'package:aasf_iiitmg/src/widgets/appleaderboardtabbar.dart';
import 'package:aasf_iiitmg/src/widgets/appprogressindicator.dart';
import 'package:aasf_iiitmg/src/widgets/appstatscard.dart';
import 'package:aasf_iiitmg/src/widgets/appwinningcard.dart';
import 'package:aasf_iiitmg/src/widgets/appstackimage.dart';
import 'package:aasf_iiitmg/src/widgets/appverifytext.dart';
import 'package:flutter/material.dart';

class LeaderBoradPage extends StatefulWidget {
  LeaderBoradPage({super.key});

  @override
  State<LeaderBoradPage> createState() => _LeaderBoradPageState();
}

class _LeaderBoradPageState extends State<LeaderBoradPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool? indicatorcolor;
  // List<dynamic> lboardData = [];
  Map<String, dynamic>? userData;
  Future<List<dynamic>> getLeaderboardDetails() async {
    // print("###########33 ${ConstantsVar.token}");
    // final LocalStorage storage = LocalStorage('localstorage');

    Response response;
    final dio = Dio();

    // dio.options.headers['Authorization'] = 'Bearer ${widget.token}';
    Options options = Options(
      headers: {'Authorization': 'Bearer ${ConstantsVar.token}'},
    );

    try {
      response = await dio.get("${ConstantsVar.url}/user/leaderboard",
          options: options);

      if (response.data['success'] == 1) {
        final leaderboardData = response.data;
        // lboardData = leaderboardData['data']['leaderboard'];
        userData = leaderboardData['data']['user'];
        print(leaderboardData['data']);
        print(userData);
        return leaderboardData['data']['leaderboard'];
        // Return the response data
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw e;
    }
    return [];
    // Return null if an error occurred or the response code was not 200
  }

  Future<Map<String, dynamic>> getUserscoreDetails() async {
    // print("###########33 ${ConstantsVar.token}");
    // final LocalStorage storage = LocalStorage('localstorage');

    Response response;
    final dio = Dio();

    // dio.options.headers['Authorization'] = 'Bearer ${widget.token}';
    Options options = Options(
      headers: {'Authorization': 'Bearer ${ConstantsVar.token}'},
    );

    try {
      response = await dio.get("${ConstantsVar.url}/user/leaderboard",
          options: options);

      if (response.data['success'] == 1) {
        final leaderboardData = response.data;

        return leaderboardData['data']['user'];
        // Return the response data
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      throw e;
    }
    return {};
    // Return null if an error occurred or the response code was not 200
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController?.addListener(_handleTabSelection);
    getLeaderboardDetails();
    getUserscoreDetails();
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
      bottomNavigationBar: AppBottomAppbar(
        token: '',
      ),
      body: Column(
        children: [
          AppLeaderBoardTabBar(
              tabController: _tabController, indicatorcolor: true),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                LeaderboardTabScreen(
                    dataFuture: getLeaderboardDetails(),
                    userdataFuture: getUserscoreDetails()),
                StatsTabScreen(userDataFuture: getUserscoreDetails()),
                WinningTabScreen()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatsTabScreen extends StatelessWidget {
  final Future<Map<String, dynamic>> userDataFuture;

  const StatsTabScreen({
    Key? key,
    required this.userDataFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: userDataFuture,
        builder: (context, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (userSnapshot.hasError) {
            return Center(
              child: Text('User Data Error: ${userSnapshot.error}'),
            );
          } else {
            final userData = userSnapshot.data!;
            return ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 292,
                  height: 121,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AppProgressIndicator(
                        percent: userData['technical_score'] == 0 &&
                                userData['final_score'] == 0
                            ? 0
                            : (userData['technical_score'] /
                                    userData['final_score'] *
                                    100.0)
                                .toInt(),
                        title: 'Technical',
                      ),
                      AppProgressIndicator(
                        percent: userData['managerial_score'] == 0 &&
                                userData['final_score'] == 0
                            ? 0
                            : (userData['managerial_score'] /
                                    userData['final_score'] *
                                    100.0)
                                .toInt(),
                        title: 'Managerial',
                      ),
                      AppProgressIndicator(
                        percent: userData['oratory_score'] == 0 &&
                                userData['final_score'] == 0
                            ? 0
                            : (userData['oratory_score'] /
                                    userData['final_score'] *
                                    100.0)
                                .toInt(),
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
                        pa: false,
                        eventname: 'Demystifying Blockchain',
                        day: 4),
                    AppStatsCard(
                        pa: true, eventname: 'Demystifying Blockchain', day: 5),
                    AppStatsCard(
                        pa: true, eventname: 'Introduction to CP', day: 1),
                    AppStatsCard(
                        pa: false, eventname: 'Introduction to CP', day: 2),
                    AppStatsCard(
                        pa: true, eventname: 'Introduction to CP', day: 3),
                    AppStatsCard(
                        pa: true, eventname: 'Introduction to CP', day: 4),
                  ],
                )
              ],
            );
          }
        });
  }
}

class WinningTabScreen extends StatelessWidget {
  const WinningTabScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
  final Future<List<dynamic>> dataFuture;
  final Future<Map<String, dynamic>> userdataFuture;

  const LeaderboardTabScreen({
    Key? key,
    required this.dataFuture,
    required this.userdataFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: dataFuture,
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (dataSnapshot.hasError) {
          return Center(
            child: Text('Data Error: ${dataSnapshot.error}'),
          );
        } else {
          final data = dataSnapshot.data!;

          return FutureBuilder<Map<String, dynamic>>(
            future: userdataFuture,
            builder: (context, userSnapshot) {
              if (userSnapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (userSnapshot.hasError) {
                return Center(
                  child: Text('User Data Error: ${userSnapshot.error}'),
                );
              } else {
                final userData = userSnapshot.data!;

                return ListView(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    AppStackedImages(data: data),
                    AppVerifyTextField(
                      padding: const EdgeInsets.only(left: 25, top: 20),
                      text: 'Your Rank',
                      text1: '',
                      textstyle: Textstyle.inputtext(
                        Appcolors.white(),
                        15.0,
                        FontWeight.w400,
                      ),
                      textalign: TextAlign.left,
                    ),
                    AppLeadrboardCard(
                      rank: userData['ranking'].toString(),
                      name:
                          '${userData["first_name"]} ${userData["last_name"]}',
                      score: userData['final_score'] ?? 0,
                      imgUrl: userData['image'],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BaseStyle.linealignment(1.5),
                    ),
                    AppVerifyTextField(
                      padding: const EdgeInsets.only(left: 25, top: 2),
                      text: 'Overall Ranking',
                      text1: '',
                      textstyle: Textstyle.inputtext(
                        Appcolors.white(),
                        15.0,
                        FontWeight.w400,
                      ),
                      textalign: TextAlign.left,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: List.generate(
                          data.length,
                          (index) => AppLeadrboardCard(
                            imgUrl: data[index + 3]['image'],
                            rank: data[index + 3]['ranking'].toString(),
                            name:
                                "${data[index]['first_name']} ${data[index + 3]['last_name']}",
                            score: data[index + 3]['final_score'] ?? 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          );
        }
      },
    );
  }
}
