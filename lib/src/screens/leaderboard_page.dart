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
  // Map<String, dynamic>? userData;

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
        // userData = leaderboardData['data']['user'];
        // print(leaderboardData['data']);
        // print(userData);
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

  Future<List<dynamic>> getStatiticsDetails() async {
    // print("###########33 ${ConstantsVar.token}");
    // final LocalStorage storage = LocalStorage('localstorage');

    Response response;
    final dio = Dio();

    // dio.options.headers['Authorization'] = 'Bearer ${widget.token}';
    Options options = Options(
      headers: {'Authorization': 'Bearer ${ConstantsVar.token}'},
    );

    try {
      response = await dio.get("${ConstantsVar.url}/user/statistics",
          options: options);

      if (response.data['success'] == 1) {
        final statiticsData = response.data;

        // print(statiticsData['data']);
        // Return the response data
        return statiticsData['data'];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);

      throw e;
    }

    return [];
    // Return null if an error occurred or the response code was not 200
  }

  Future<List<dynamic>> getachievementsDetails() async {
    // print("###########33 ${ConstantsVar.token}");
    // final LocalStorage storage = LocalStorage('localstorage');

    Response response;
    final dio = Dio();

    // dio.options.headers['Authorization'] = 'Bearer ${widget.token}';
    Options options = Options(
      headers: {'Authorization': 'Bearer ${ConstantsVar.token}'},
    );

    try {
      response = await dio.get("${ConstantsVar.url}/user/achievements",
          options: options);

      if (response.data['success'] == 1) {
        final achievementsData = response.data;

        print(achievementsData['data']);
        // Return the response data
        return achievementsData['data'];
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);

      throw e;
    }

    return [];
    // Return null if an error occurred or the response code was not 200
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController?.addListener(_handleTabSelection);
    getLeaderboardDetails();
    getUserscoreDetails();
    getStatiticsDetails();
    getachievementsDetails();
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
                StatsTabScreen(
                  userDataFuture: getUserscoreDetails(),
                  statiticsDataFuture: getStatiticsDetails(),
                ),
                WinningTabScreen(
                  achievementsDataFuture: getachievementsDetails(),
                )
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
  final Future<List<dynamic>> statiticsDataFuture;
  const StatsTabScreen(
      {Key? key,
      required this.userDataFuture,
      required this.statiticsDataFuture})
      : super(key: key);

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
            return FutureBuilder<List<dynamic>>(
              future: statiticsDataFuture,
              builder: (context, snapshotData) {
                if (snapshotData.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshotData.hasError) {
                  return Center(
                    child: Text('Data Error: ${snapshotData.error}'),
                  );
                } else {
                  final statiticsData = snapshotData.data!;
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
                        children: [
                          for (var data in statiticsData)
                            for (var subEvent in data['sub_events'])
                              AppStatsCard(
                                pa: subEvent['attendance'].length == 0
                                    ? false
                                    : true,
                                eventname: data['name'],
                                day: subEvent['day'] as int,
                              ),
                        ],
                      )
                    ],
                  );
                }
              },
            );
          }
        });
  }
}

class WinningTabScreen extends StatelessWidget {
  Future<List<dynamic>> achievementsDataFuture;

  WinningTabScreen({
    Key? key,
    required this.achievementsDataFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: achievementsDataFuture,
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.hasError) {
            return Center(
              child: Text('User Data Error: ${dataSnapshot.error}'),
            );
          } else {
            final data = dataSnapshot.data!;

            if (data.isEmpty) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/Asset 2 1.png'),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text('Keep Trying',
                      style: Textstyle.winningtext(Appcolors.yew(), 22.0))
                ],
              );
            } else {
              return ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child:
                        Image(image: AssetImage('assets/images/Asset 2 1.png')),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return AppWinningCard(
                          eventname: data[index]['event']['name'],
                          imgurl: data[index]['position'] == 1
                              ? 'assets/images/Asset 1.png'
                              : data[index]['position'] == 2
                                  ? 'assets/images/Asset 2.png'
                                  : 'assets/images/Asset 3.png');
                    },
                  ),
                  // Row(
                  //   children: const [
                  //     AppWinningCard(
                  //         eventname: 'Webkriti',
                  //         imgurl: 'assets/images/Asset 2.png'),
                  //     AppWinningCard(
                  //         eventname: 'Jest a Minute',
                  //         imgurl: 'assets/images/Asset 3.png'),
                  //   ],
                  // ),
                  // Row(
                  //   children: const [
                  //     AppWinningCard(
                  //         eventname: 'JPC-I',
                  //         imgurl: 'assets/images/Asset 1.png'),
                  //   ],
                  // ),
                ],
              );
            }
          }
        });
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
                            imgUrl: data[index]['image'],
                            rank: data[index]['ranking'].toString(),
                            name:
                                "${data[index]['first_name']} ${data[index]['last_name']}",
                            score: data[index]['final_score'] ?? 0,
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
