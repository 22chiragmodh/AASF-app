import 'package:flutter/material.dart';

class StudentDataProvider extends ChangeNotifier {
  Map<String, dynamic> studentData = {};
  String authToken = "";

  void setStudentData(Map<String, dynamic> data) {
    studentData = data;

    notifyListeners();
  }
}
