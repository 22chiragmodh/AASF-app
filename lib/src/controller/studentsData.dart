import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StudentDetails {
  static Future<Map<String, dynamic>> getStudentDataFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentDataString = prefs.getString('studentData');

    if (studentDataString != null) {
      return Map<String, dynamic>.from(jsonDecode(studentDataString));
    }
    return {};
  }

  static Future<String> getauthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentDataString = prefs.getString('studentData');

    if (studentDataString != null) {
      var studentData = jsonDecode(studentDataString);

      return studentData['token']['token'];
    }
    return "";
  }

  static Future<String> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentDataString = prefs.getString('studentData');

    if (studentDataString != null) {
      var studentData = jsonDecode(studentDataString);

      return studentData['email'];
    }
    return "";
  }
}
