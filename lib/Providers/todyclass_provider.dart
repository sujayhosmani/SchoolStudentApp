import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_guardian/Model/Attendance.dart';
import 'package:my_guardian/Model/OnlineClass.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/SubjectModel.dart';
import 'package:my_guardian/Model/TimeTable.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Repositories/student_repo.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class TodayClassProvider with ChangeNotifier {
  StudentRepository _todayClassRepository;
  List<TimeTable> _todayClass;
  List<TimeTable> _upClass;
  List<SubjectModel> _allSubjects;

  List<TimeTable> get todayClass => _todayClass;
  List<TimeTable> get upClass => _upClass;
  List<SubjectModel> get allSubjects => _allSubjects;

  TodayClassProvider() {
    _todayClassRepository = StudentRepository();
    fetchSubjects(null);
  }

  fetchTodayClass(BuildContext context, String from) async {
    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
    CustomResponse<List<TimeTable>> todayTimeTable = await _todayClassRepository.fetchTodayClassStudent(context,from, stu.Class, stu.Section ,stu.Id);

    if(from == "up"){
      _upClass = todayTimeTable?.Data;
    }else{
      _todayClass = todayTimeTable?.Data;
      _todayClass?.sort((a, b) => a.FromTime.compareTo(b.FromTime));
    }
    notifyListeners();
    // return todayTimeTable;
  }

  Future<CustomResponse<Attendance>> addAttendance(BuildContext context, Attendance attendance, int index, String from) async {
    CustomResponse<Attendance> res = await _todayClassRepository.addAttendance(context, attendance);
    if(res.Status == 1){
      if(from == "up"){
        _upClass[index].weekSub[0].Status = "Resume";
      }else{
        _todayClass[index].weekSub[0].Status =  "Resume";
      }
      notifyListeners();
    }
    return res;

  }

  fetchSubjects(BuildContext context) async {
    CustomResponse<List<SubjectModel>> res = await _todayClassRepository.fetchAllSubjects(context);
    _allSubjects = res?.Data;
    notifyListeners();
    // return todayTimeTable;
  }

  SubjectModel getSubjectById(String id){
    SubjectModel sub = SubjectModel(SubjectCode: 0, Subject: "Empty");
    return allSubjects?.firstWhere((element) => element.Id == id, orElse: () => sub);
  }

}