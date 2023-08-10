import 'dart:convert';

import 'package:aasf_iiitmg/src/utils/constants.dart';
import 'package:dio/dio.dart';

import 'package:shared_preferences/shared_preferences.dart';

class EventDeatils {
  static Future<void> storeDataToSharedPreferences(
      String key, List<dynamic> data, String timestamp, int datetime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(data));
    prefs.setInt(timestamp, datetime);
  }

  static Future<List<dynamic>> fetchDataFromSharedPreferences(
      String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataString = prefs.getString(key);
    if (dataString != null) {
      return jsonDecode(dataString);
    }
    return [];
  }

  static Future<int> fetchTimestamp(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? timestamp = prefs.getInt('timestamp');
    if (timestamp != null) {
      return timestamp;
    }
    return 0;
  }

  static Future<List<dynamic>> fetchEventsData() async {
    List<dynamic> storedData =
        await EventDeatils.fetchDataFromSharedPreferences('eventsData');
    int storedTimestamp = await EventDeatils.fetchTimestamp('timestamp');
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if (storedData.isNotEmpty &&
        (currentTimestamp - storedTimestamp) <= 2 * 60 * 60 * 1000) {
      return storedData;
    }
    try {
      Dio dio = Dio();
      Response response = await dio.get("${ConstantsVar.url}/events");
      Map<String, dynamic> responseData = response.data;
      if (responseData['success'] == 1) {
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
        await EventDeatils.storeDataToSharedPreferences(
            'eventsData', responseData['data'], 'timestamp', currentTimestamp);
        return responseData['data'];
      }
    } catch (e) {
      print(e.toString());
      print('Error: Failed to fetch data');
    }
    return [];
  }

  static Future<List<dynamic>> fetchBlogsData() async {
    // Check if data is already stored in SharedPreferences
    List<dynamic> storedData =
        await EventDeatils.fetchDataFromSharedPreferences('blogsData');
    int storedTimestamp = await EventDeatils.fetchTimestamp('timestamp');
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if (storedData.isNotEmpty &&
        (currentTimestamp - storedTimestamp) <= 24 * 60 * 60 * 1000) {
      return storedData;
    }

    try {
      Dio dio = Dio();
      Response response = await dio.get("${ConstantsVar.url}/blogs");
      Map<String, dynamic> responseData = response.data;
      if (responseData['success'] == 1) {
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
        List<dynamic> blogsData = responseData['data']['items'];
        await EventDeatils.storeDataToSharedPreferences(
            'blogsData', blogsData, 'timestamp', currentTimestamp);
        return blogsData;
      }
    } catch (e) {
      print(e.toString());
      print('Error: Failed to fetch data');
    }
    return [];
  }

  static Future<List<dynamic>> fetchAbhisharData() async {
    List<dynamic> storedData =
        await EventDeatils.fetchDataFromSharedPreferences('abhisharData');
    int storedTimestamp = await EventDeatils.fetchTimestamp('timestamp');
    int currentTimestamp = DateTime.now().millisecondsSinceEpoch;
    if (storedData.isNotEmpty &&
        (currentTimestamp - storedTimestamp) <= 30 * 24 * 60 * 60 * 1000) {
      return storedData;
    }
    try {
      Dio dio = Dio();
      Response response = await dio.get("${ConstantsVar.url}/abhishar");
      Map<String, dynamic> responseData = response.data;
      if (responseData['success'] == 1) {
        List<dynamic> abhisharData = responseData['data'];
        int currentTimestamp = DateTime.now().millisecondsSinceEpoch;

        await EventDeatils.storeDataToSharedPreferences(
            'abhisharData', abhisharData, 'timestamp', currentTimestamp);
        return abhisharData;
      }
    } catch (e) {
      print(e.toString());
      print('Error: Failed to fetch data');
    }
    return [];
  }

  static Future<void> storeDataToSharedPreferencesMap(
    String key,
    Map<String, dynamic> data,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String dataJson = jsonEncode(data);
    prefs.setString(key, dataJson);
  }

  static Future<Map<String, dynamic>> fetchDataFromSharedPreferencesMap(
      String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? dataString = prefs.getString(key);

    if (dataString != null) {
      Map<String, dynamic> data = jsonDecode(dataString);
      return data;
    }

    return {};
  }
}
