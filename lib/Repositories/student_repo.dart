

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:my_guardian/Model/Announcement.dart';
import 'package:my_guardian/Model/Assignment.dart';
import 'package:my_guardian/Model/Attendance.dart';
import 'package:my_guardian/Model/MultipleFileDoc.dart';
import 'package:my_guardian/Model/OverAll.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/SubjectModel.dart';
import 'package:my_guardian/Model/SubmitAssignment.dart';
import 'package:my_guardian/Model/TimeTable.dart';
import 'package:my_guardian/NetworkModule/api_path.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/NetworkModule/http_client.dart';


class StudentRepository {
  Future<CustomResponse<Student>> fetchStudentDetails(BuildContext context, String ph, String from, String aNo) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.fetch_student, ph));
    CustomResponse<Student> ss = CustomResponse<Student>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? Student.fromJson(response.Data) : null);
    return ss;
  }

  Future<CustomResponse<List<SubjectModel>>> fetchAllSubjects(BuildContext context) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.getAllSubjects, ""));
    CustomResponse<List<SubjectModel>> ss = CustomResponse<List<SubjectModel>>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ?  List<SubjectModel>.from(response.Data.map((model)=> SubjectModel.fromJson(model))) : null);
    return ss;
  }

  Future<CustomResponse<List<TimeTable>>> fetchTodayClassStudent(BuildContext context, String from, String std, String section, String sid) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.fetch_today, "?from="+ from + "&std=" + std + "&section=" + section + "&sid=" + sid));
    print(response.Data);
    CustomResponse<List<TimeTable>> ss = CustomResponse<List<TimeTable>>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? List<TimeTable>.from(response.Data.map((model)=> TimeTable.fromJson(model))) : null);
    return ss;
  }

  Future<CustomResponse<List<TimeTable>>> fetchTimeTable(BuildContext context, String from, String std, String section) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.fetch_time_table, "?from="+ from + "&std=" + std + "&section=" + section));
    print(response.Data);
    CustomResponse<List<TimeTable>> ss = CustomResponse<List<TimeTable>>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? List<TimeTable>.from(response.Data.map((model)=> TimeTable.fromJson(model))) : null);
    return ss;
  }

  Future<CustomResponse<List<OverAll>>> fetchAttendance(BuildContext context, String std, String section, String sid) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.fetch_attendance, "?std="+ std + "&sec=" + section + "&sid=" + sid));
    print(response.Data);
    CustomResponse<List<OverAll>> ss = CustomResponse<List<OverAll>>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? List<OverAll>.from(response.Data.map((model)=> OverAll.fromJson(model))) : null);
    return ss;
  }

  Future<CustomResponse<Attendance>> addAttendance(BuildContext context, Attendance attendance) async {
    CustomRequest c = CustomRequest(Data: attendance.toJson());
    String sendingJ = json.encode(c.toJson());
    final response = await HttpClient.instance.postData(context, APIPathHelper.getValue(APIPath.add_attendance, ""), sendingJ);
    CustomResponse<Attendance> ss = CustomResponse<Attendance>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? Attendance.fromJson(response.Data) : null);
    return ss;
  }


  Future<CustomResponse<List<Assignment>>> fetchAssignmentsBySid(BuildContext context, String sid, String std, String section) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.getAssignmentsBySid, "?std="+ std + "&section=" + section + "&sid=" + sid));
    CustomResponse<List<Assignment>> ss = CustomResponse<List<Assignment>>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ?  List<Assignment>.from(response.Data.map((model)=> Assignment.fromJson(model))) : null);
    return ss;
  }

  Future<CustomResponse<List<Announcement>>> fetchAnnouncement(BuildContext context, String std, String sec) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.getAnnouncement, "?from=student" + "&std=" + std + "&sec=" + sec));
    CustomResponse<List<Announcement>> ss = CustomResponse<List<Announcement>>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ?  List<Announcement>.from(response.Data.map((model)=> Announcement.fromJson(model))) : null);
    return ss;
  }

  Future<CustomResponse<SubmitAssignments>> fetchSubmittedAssignment(BuildContext context, String sid, String assigId) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.getSubmittedAssignment, "?sid=" + sid + "&assigId=" + assigId));
    CustomResponse<SubmitAssignments> ss = CustomResponse<SubmitAssignments>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? SubmitAssignments.fromJson(response.Data) : null);
    return ss;
  }

  Future<CustomResponse<SubmitAssignments>> addSubmittedAssignment(BuildContext context, SubmitAssignments submitAssignments) async {
    CustomRequest c = CustomRequest(Data: submitAssignments.toJson());
    String sendingJ = json.encode(c.toJson());
    final response = await HttpClient.instance.postData(context, APIPathHelper.getValue(APIPath.add_submittedAssignment, ""), sendingJ);
    CustomResponse<SubmitAssignments> ss = CustomResponse<SubmitAssignments>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? SubmitAssignments.fromJson(response.Data) : null);
    return ss;
  }



}