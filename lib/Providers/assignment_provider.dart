import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_guardian/Model/Assignment.dart';
import 'package:my_guardian/Model/AssignmentFiles.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/Model/SubmitAssignment.dart';
import 'package:my_guardian/NetworkModule/api_base.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/Providers/global_provider.dart';
import 'package:my_guardian/Providers/student_provider.dart';
import 'package:my_guardian/Repositories/student_repo.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AssignmentProvider with ChangeNotifier {
  StudentRepository _studentRepository;
  List<Assignment> _assignments;
  List<Object> images = [];
  bool isSubmitted = false;
  SubmitAssignments subAss;


  List<Assignment> get assignments => _assignments;


  AssignmentProvider() {
    _studentRepository = StudentRepository();
    print("Assignment Provider");
  }

  addInitialFromNetwork(BuildContext context, Assignment assig)async{
    images = [];
    subAss = null;
    isSubmitted = false;
    // get from network
    CustomResponse<SubmitAssignments> submittedResponse = await fetchSubmittedAssignment(context, assig);
    if(submittedResponse.Status == 1){
      isSubmitted = true;
      subAss = submittedResponse.Data;
      images = submittedResponse.Data.FileUrls;
      notifyListeners();
    }else{
      images.add("Add Image");
      isSubmitted = false;
      Future.delayed(Duration.zero, () async {
        notifyListeners();
      });
    }

  }


  onRemoveImage(int index){
    images.replaceRange(index, index + 1, ['Add Image']);
    notifyListeners();
  }

  onAddImage(int index, AssignmentFiles imageUpload,  Assignment assig, Student stu, BuildContext context){
    images.replaceRange(index, index + 1, [imageUpload]);
    uploadImage(index, imageUpload, assig, stu, false, context);
    if(images.length - 1 == index) {
      images.add("Add Image");
      notifyListeners();
    }

  }

  uploadImage(int index, AssignmentFiles af, Assignment assig, Student stu, bool isNotify, BuildContext context) async {
    af.isUploading = true;
    notifyListeners();
    var dio = Dio();
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
    var assignmentFormData = FormData.fromMap({
      'UploadedDate': formattedDate,
      'Type': "img",
      'Key': index + 1,
      'isUploaded': false,
      'isUploading': true,
    });
    var formData = FormData.fromMap({
      'From': 'assignments',
      'UploadingDate': assig.StartDate,
      'Subject': assig.SubjectName,
      'ClassSection': assig.Std+assig.Section,
      'StudentName': stu.Name.replaceAll(new RegExp(r"\s+"), ""),
      'Sid': stu.Id,
      "Files" : await MultipartFile.fromFile(af.AssigFile.path),
      'FilePath': assignmentFormData,
    });
    try{

      var response = await dio.post(APIBase.baseURL + "FileDoc/singleFiles", data: formData);
      print(response.statusCode);
      if(response.statusCode == 200){
        CustomResponse res = CustomResponse.fromJson((response.data));
        if(res.Status == 1){
          AssignmentFiles df = AssignmentFiles.fromJson(res.Data["FilePath"]);
          df.ImgUrl = APIBase.mainBaseURL + df.ImgUrl.substring(9,df.ImgUrl.length).toString();
          print(df.isUploaded);
          images.replaceRange(index, index + 1, [df]);
          notifyListeners();
        }

      }
    }catch(error){
      af.isUploading = false;
      af.isUploaded = false;
      images.replaceRange(index, index + 1, [af]);
      notifyListeners();
    }

  }

  fetchAssignmentsBySid(BuildContext context) async {
    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
    CustomResponse<List<Assignment>> assignment = await _studentRepository.fetchAssignmentsBySid(context, stu.Id, stu.Class, stu.Section);
    print(assignment.Data);
    _assignments = assignment?.Data;
    _assignments?.sort((a, b) => a.EndDate.compareTo(b.EndDate));
    notifyListeners();
  }

  fetchSubmittedAssignment(BuildContext context, Assignment assignment) async {
    Student stu = Provider.of<StudentProvider>(context, listen: false).student.Data;
    CustomResponse<SubmitAssignments> submittedResponse = await _studentRepository.fetchSubmittedAssignment(context, stu.Id, assignment.Id);
    print(submittedResponse.Data);
    return submittedResponse;

  }

  Future<int> addSubmittedAssignment(BuildContext context, SubmitAssignments assignment) async {
    CustomResponse<SubmitAssignments> res = await _studentRepository.addSubmittedAssignment(context, assignment);
    if(res.Status == 1){
      // fetchAssignmentsBySid(null);
    }
    return res.Status;
  }



}