

import 'package:flutter/cupertino.dart';
import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/NetworkModule/api_path.dart';
import 'package:my_guardian/NetworkModule/api_response.dart';
import 'package:my_guardian/NetworkModule/http_client.dart';


class StudentRepository {
  Future<CustomResponse<Student>> fetchStudentDetails(BuildContext context, String ph, String from, String aNo) async {
    final response = await HttpClient.instance.fetchData(context, APIPathHelper.getValue(APIPath.fetch_student, ph));
    CustomResponse<Student> ss = CustomResponse<Student>(Error: response?.Error, Status: response?.Status, Data: response?.Data != null ? Student.fromJson(response.Data) : null);
    return ss;
  }
}