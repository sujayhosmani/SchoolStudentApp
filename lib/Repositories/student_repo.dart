

import 'package:my_guardian/Model/Student.dart';
import 'package:my_guardian/NetworkModule/api_path.dart';
import 'package:my_guardian/NetworkModule/http_client.dart';

class StudentRepository {
  Future<Student> fetchStudentDetails() async {
    final response = await HttpClient.instance.fetchData(APIPathHelper.getValue(APIPath.fetch_student));
    print("Response - $response");
    return Student.fromJson(response);
  }
}