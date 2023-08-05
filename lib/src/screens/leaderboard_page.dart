import 'dart:convert';

import 'package:aasf_iiitmg/src/screens/progress/acheivemntsScreen.dart';
import 'package:aasf_iiitmg/src/screens/progress/leaderboradScreen.dart';
import 'package:aasf_iiitmg/src/screens/progress/statiticsScreen.dart';
import 'package:aasf_iiitmg/src/styles/colors.dart';

import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:dio/dio.dart';

import 'package:aasf_iiitmg/src/widgets/appbottomappbar.dart';

import 'package:aasf_iiitmg/src/widgets/appleaderboardtabbar.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LeaderBoradPage extends StatefulWidget {
  const LeaderBoradPage({super.key});

  @override
  State<LeaderBoradPage> createState() => _LeaderBoradPageState();
}

class _LeaderBoradPageState extends State<LeaderBoradPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  bool? indicatorcolor;
  // List<dynamic> lboardData = [];
  // Map<String, dynamic>? userData;

  Future<List<dynamic>> fetchDataFromSharedPreferences(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataString = prefs.getString(key);
    if (dataString != null) {
      return jsonDecode(dataString);
    }
    return [];
  }

  Future<void> storeDataToSharedPreferences(
      String key, List<dynamic> data, String timestamp, int datetime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(data));
    prefs.setInt(timestamp, datetime);
  }

  Future<void> storeDataToSharedPreferencesMap(
    String key,
    Map<String, dynamic> data,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dataJson = jsonEncode(data);
    prefs.setString(key, dataJson);
  }

  Future<Map<String, dynamic>> fetchDataFromSharedPreferencesMap(
      String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataString = prefs.getString(key);

    if (dataString != null) {
      Map<String, dynamic> data = jsonDecode(dataString);
      return data;
    }

    return {};
  }

  Future<List<dynamic>> getLeaderboardDetails() async {
    Response response;
    final dio = Dio();

    // dio.options.headers['Authorization'] = 'Bearer ${widget.token}';
    Options options = Options(
      headers: {'Authorization': 'Bearer ${ConstantsVar.token}'},
    );
    List<dynamic> storedData =
        await fetchDataFromSharedPreferences('leaderboardData');
    if (storedData.isNotEmpty) {
      return storedData;
    }
    try {
      response = await dio.get("${ConstantsVar.url}/user/leaderboard",
          options: options);

      if (response.data['success'] == 1) {
        final leaderboardData = response.data;
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

        await storeDataToSharedPreferences(
            'leaderboardData',
            leaderboardData['data']['leaderboard'],
            'timestamp',
            currentTimestamp);

        return leaderboardData['data']['leaderboard'];
      }
    } catch (e) {
      print(e);
      throw e;
    }
    return [];
  }

  Future<Map<String, dynamic>> getUserscoreDetails() async {
    // print("###########33 ${ConstantsVar.token}");
    // final LocalStorage storage = LocalStorage('localstorage');

    Response response;
    final dio = Dio();

    // dio.options.headers['Authorization'] = 'Bearer ${widget.token}';
    Options options = Options(
      headers: {'Authorization': 'Bearer ${ConstantsVar.token}'},
      validateStatus: (_) => true,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    );
    Map<String, dynamic> retrievedData =
        await fetchDataFromSharedPreferencesMap('userScoreData');
    if (retrievedData.isNotEmpty) {
      return retrievedData;
    }
    try {
      response = await dio.get("${ConstantsVar.url}/user/leaderboard",
          options: options);

      if (response.data['success'] == 1) {
        final leaderboardData = response.data;
        await storeDataToSharedPreferencesMap(
            'userScoreData', leaderboardData['data']['user']);
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
    List<dynamic> storedData =
        await fetchDataFromSharedPreferences('statisticsData');
    if (storedData.isNotEmpty) {
      return storedData;
    }

    try {
      response = await dio.get("${ConstantsVar.url}/user/statistics",
          options: options);

      if (response.data['success'] == 1) {
        final statiticsData = response.data;
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

        await storeDataToSharedPreferences('statisticsData',
            statiticsData['data'], 'timestamp', currentTimestamp);
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
    List<dynamic> storedData =
        await fetchDataFromSharedPreferences('achievementsData');
    if (storedData.isNotEmpty) {
      return storedData;
    }
    try {
      response = await dio.get("${ConstantsVar.url}/user/achievements",
          options: options);

      if (response.data['success'] == 1) {
        final achievementsData = response.data;
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

        await storeDataToSharedPreferences('achievementsData',
            achievementsData['data'], 'timestamp', currentTimestamp);
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
