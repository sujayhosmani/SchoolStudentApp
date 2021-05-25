import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_guardian/Helpers/Constants.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Repositories/student_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StudentProvider with ChangeNotifier {
  StudentRepository _studentRepository;
  CustomResponse<Student> _student;
  SharedPreferences prefs;
  bool isLoggined = false;

  CustomResponse<Student> get student => _student;

  StudentProvider() {
    _studentRepository = StudentRepository();
    fetchFromSharedPreference();
  }

  Future<CustomResponse<Student>> studentLogin(BuildContext context, String ph, String from, String aNo) async {
    CustomResponse<Student> student = await _studentRepository.fetchStudentDetails(context, ph,from, aNo);
    _student = student;
    if(_student.Data != null){
      saveToSharedPreference();
    }
    notifyListeners();
    return student;
  }

  fetchFromSharedPreference()async{
    prefs = await SharedPreferences.getInstance();
    String userValues = prefs.getString(loginUser) ?? "";
    if(userValues != ""){
      Student stu = Student.fromJson(jsonDecode(userValues));
      _student = CustomResponse(Data: stu,Status: 1,Error: null);
      notifyListeners();
    }
  }

  saveToSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(loginUser, jsonEncode(_student.Data.toJson()));
  }

}